import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:rmi/proxy.dart';
// import 'package:rmi/remote_method_invocation.dart';

import 'package:source_gen_helpers/class/class_visitor.dart';
import 'package:source_gen_helpers/class/output_visitor.dart';
import 'package:source_gen_helpers/class/override_visitor.dart';
import 'package:source_gen_helpers/class/util.dart';
import 'package:source_gen_helpers/filter_generator.dart';

class ProxyGenerator extends FilterGenerator {
  ProxyGenerator(BuilderOptions options) : super(options);

  bool elementFilter(Element element) {
    if (element.name == 'RmiTarget')
      return false; // this removes generation from the root class

    if (TypeChecker.fromRuntime(Proxy).annotationsOf(element).isNotEmpty)
      return true;
    if (TypeChecker.fromRuntime(Proxy).isAssignableFrom(element)) return true;

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
    if (element.isGenerator) return null;
    if (element.isStatic) return null;
    if (_visitOnce(element)) return null;

    // if (element.metadata
    //     .map((e) => e.constantValue.toString())
    //     .contains('NoProxy ()')) return '';

    var list = (await classElement)
        .metadata
        .where((e) =>
            e.constantValue.type.toString() ==
            'NoProxy') //TODO better classCheck
        .map((e) => e.constantValue.getField('methods').toListValue())
        .fold([], (a, b) {
      a.addAll(b);
      return a;
    }).map((e) => e.toStringValue());

    if (list.contains(element.displayName))
      return null; //TODO check for symbols?

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
    return '''
    {
      List<Object> arguments =  [];
      ${argumentAdds}
      Map<Symbol, Object> namedArguments = {};
      ${namedArgumentAdds}
      Invocation _\$invocation = Invocation
        .method(#${element.name}, arguments, namedArguments);

      ${!element.returnType.isVoid ? 'return' : ''} ${element.isAsynchronous ? 'await' : ''} _handle(_\$invocation);      
    }
    ''';
  }

  generateGetter(PropertyAccessorElement element) {
    return '''
    {
      Invocation invocation = Invocation.getter(#${element.name});

      return ${element.isAsynchronous ? 'await' : ''} _handle(invocation);
    }
    ''';
  }

  generateSetter(PropertyAccessorElement element) {
    return '''
    {

      Invocation invocation = Invocation.setter(
        #${element.displayName}, ${element.parameters.first.displayName});

      _handle(invocation);
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
}
