import 'dart:async';

import 'package:analyzer/dart/element/element.dart';

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'package:source_gen_helpers/class/class_visitor.dart';
import 'package:source_gen_helpers/class/output_visitor.dart';
import 'package:source_gen_helpers/class/override_visitor.dart';
import 'package:source_gen_helpers/class/util.dart';
import 'package:source_gen_helpers/filter_generator.dart';
import 'type_checkers.dart';

class ProxyGenerator extends FilterGenerator {
  ProxyGenerator(BuilderOptions options) : super(options);

  bool elementFilter(Element element) {
    if (RmiTargetChecker.isExactly(element)) return false;
    if (ProxyChecker.hasAnnotationOf(element)) return true;
    if (ProxyChecker.isAssignableFrom(element)) return true;
    return false;
  }

  Future<String> generateForElement(Element element) async {
    if (element is! ClassElement) {
      log.severe('only classes can be proxies, $element is not a class');
    }

    ClassElement classElement = element as ClassElement;

    ProxyClassVisitor classVisitor = new ProxyClassVisitor();
    OverrideClassVisitor overrideVisitor =
        new OverrideClassVisitor(classVisitor);
    OutputClassVisitor outputVisitor = new OutputClassVisitor(overrideVisitor);

    List<Element> member = allClassMember(classElement);
    member = member.where((e) {
      if (e.enclosingElement is! ClassElement) return true;
      ClassElement c = e.enclosingElement as ClassElement;
      return !c.type.isBottom;
    }).toList();
    member = member.where((e) => e.isPublic).toList();

    outputVisitor.visitClassElement(classElement);
    await visitElements(outputVisitor, member);
    return await outputVisitor.output;
  }
}

class ProxyClassVisitor extends ClassVisitor<FutureOr<String>> {
  List<String> _visited = [];
  bool _visitOnce(Element element) {
    String compare = element.displayName;
    bool contained = _visited.contains(compare);
    _visited.add(compare);
    return contained;
  }

  @override
  FutureOr<String> visitClassElement(ClassElement element) {
    super.visitClassElement(element);
    classDeclarationCompleter
        .complete('class _\$${element.name}Proxy implements ${element.name}');

    return '''
      InvocationHandlerFunction _handle;
      _\$${element.name}Proxy(this._handle) : super();    
    ''';
  }

  @override
  FutureOr<String> visitConstructorElement(ConstructorElement element) {
    return '';
  }

  @override
  visitMethodElement(MethodElement element) async {
    if (element.isStatic) return null;
    if (_visitOnce(element)) return null;

    var metadata = classHierarchyMetadata(await classElement)
        .map((e) => e.constantValue)
        .where((e) => e != null)
        .where((e) => NoProxyChecker.isAssignableFromType(e.type));
    if (metadata.isNotEmpty) {
      var list = metadata
          .map((e) => e.getField('methods').toListValue())
          .fold([], (a, b) {
            a.addAll(b);
            return a;
          })
          .map((e) => e.toSymbolValue())
          .toList();

      if (list.contains(element.displayName)) {
        return null;
      }
    }

    if (NoProxyChecker.hasAnnotationOf(element)) return null;

    bool hasNamedArgs = element.parameters.any((p) => p.isNamed);
    String argumentAdds = element.parameters
        .where((p) => p.isPositional)
        .map((p) => 'arguments.add(${p.name});')
        .join('');
    String namedArgumentAdds = '';
    if (hasNamedArgs) {
      namedArgumentAdds += element.parameters
          .where((p) => p.isNamed)
          .map((p) =>
              'namedArguments.putIfAbsent(#${p.name}, () =>  ${p.name});')
          .join('\n');
    }

    String awaitText = '';
    if (element.isAsynchronous && !element.isGenerator) awaitText = 'await';

    //TODO
    bool isStream = false;
    if (!element.name.contains("noSuchMethod") &&
        element.returnType != null &&
        !element.returnType.isDynamic &&
        !element.returnType.isVoid)
      isStream = TypeChecker.fromRuntime(Stream)
          .isAssignableFromType(element.returnType);

    String handle =
        '${!element.returnType.isVoid ? 'return' : ''} ${awaitText} _handle(_\$invocation, metadata);';
    if (isStream) {
      handle =
          'var result = _handle(_\$invocation, metadata); if(result == null) return null; return (result as Stream).cast();';
    }

    return '''
    {
      List<Object> arguments =  [];
      ${argumentAdds}
      Map<Symbol, Object> namedArguments = {};
      ${namedArgumentAdds}
      Invocation _\$invocation = Invocation
        .method(#${element.name}, arguments, namedArguments);

      ${_metadata(element)}

      
      ${handle}   
    }
    ''';
  }

  generateGetter(PropertyAccessorElement element) {
    String awaitText = '';
    if (element.isAsynchronous && !element.isGenerator) awaitText = 'await';
    return '''
    {
      Invocation invocation = Invocation.getter(#${element.name});
      
      ${_metadata(element)}

      return ${awaitText} _handle(invocation, metadata); 
    }
    ''';
  }

  generateSetter(PropertyAccessorElement element) {
    return '''
    {
      Invocation invocation = Invocation.setter(
        #${element.displayName}, ${element.parameters.first.displayName});

      ${_metadata(element)}

      _handle(invocation, metadata);
    }
    ''';
  }

  @override
  visitPropertyAccessorElement(PropertyAccessorElement element) {
    if (_visitOnce(element)) return null;
    if (element.isGetter) return generateGetter(element);
    if (element.isSetter) return generateSetter(element);
    throw new Exception('unreachable');
  }

  // ignored since they are handled by property accessor with getter and setter implementation
  @override
  visitFieldElement(FieldElement element) => null;

  String _metadata(ExecutableElement element) {
    String metadata = 'InvocationMetadata metadata = new InvocationMetadata();';
    for (var p in element.parameters.where((p) => p.isPositional)) {
      metadata += 'metadata.positionalArgumentMetadata.add([]);';
      for (var m in p.metadata) {
        metadata +=
            'metadata.positionalArgumentMetadata[${element.parameters.indexOf(p)}].add(${m.toSource().substring(1)});';
      }
    }

    for (var p in element.parameters.where((p) => p.isNamed)) {
      metadata += 'metadata.namedArgumentMetadata[#${p.displayName}] = [];';
      for (var m in p.metadata) {
        metadata +=
            'metadata.namedArgumentMetadata[#${p.displayName}].add(${m.toSource().substring(1)});';
      }
    }

    for (var m in element.metadata) {
      metadata += 'metadata.elementMetadata.add(${m.toSource().substring(1)});';
    }

    bool isStream = false;
    //TODO
    if (!element.name.contains("noSuchMethod") &&
        element.returnType != null &&
        !element.returnType.isDynamic &&
        !element.returnType.isVoid)
      isStream = TypeChecker.fromRuntime(Stream)
          .isAssignableFromType(element.returnType);
    metadata += 'metadata.isStream = ${isStream};';

    return metadata;
  }
}
