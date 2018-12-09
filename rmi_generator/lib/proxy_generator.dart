import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/element/type.dart';

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:rmi/proxy.dart';
// import 'package:rmi/remote_method_invocation.dart';

import 'package:source_gen_class_visitor/class_visitor.dart';
import 'package:source_gen_class_visitor/output_visitor.dart';
import 'package:source_gen_class_visitor/override_visitor.dart';

class ProxyGenerator extends Generator {
  BuilderOptions options;
  ProxyGenerator(this.options);

  // bool get isRmiActive => options.config.containsKey('rmi');

  bool isAnnotatedWith<T>(Element element) {
    return TypeChecker.fromRuntime(T).firstAnnotationOf(element) != null;
  }

  bool elementFilter(Element element) {
    if (element.name == 'RmiTarget')
      return false; // this removes generation from the root class

    if (isAnnotatedWith<Proxy>(element)) return true;
    if (TypeChecker.fromRuntime(Proxy).isAssignableFrom(element)) return true;

    return false;
  }

  @override
  generate(LibraryReader library, BuildStep buildStep) async {
    var futures = library.allElements
        .where(elementFilter)
        .map((e) async => await generateForElement(e))
        .toList();
    var result = await Future.wait(futures);
    return result.join('\n\n');
  }

  generateForElement(Element element) async {
    if (element is! ClassElement) {
      log.severe('only classes can be proxies, $element is not a class');
    }

    ClassElement classElement = element as ClassElement;

    ProxyClassVisitor classVisitor = new ProxyClassVisitor(classElement);
    OverrideVisitor overrideVisitor = new OverrideVisitor(classVisitor);
    ClassOutputVisitor outputVisitor = new ClassOutputVisitor(overrideVisitor);

    List<Element> elements = [];
    elements.add(classElement);
    elements.addAll(classElement.accessors);
    elements.addAll(classElement.methods);

    void addElements(List<Element> mapper(InterfaceType e)) {
      elements.addAll(classElement.allSupertypes
          .map((e) => mapper(e))
          .fold<List<Element>>([], (a, b) {
        a.addAll(b);
        return a;
      }));
    }

    addElements((e) => e.accessors);
    addElements((e) => e.methods);

    await outputVisitor.visitElements(elements);

    return await outputVisitor.output;
  }
}

class ProxyClassVisitor extends ClassVisitor {
  ProxyClassVisitor(ClassElement element) : super(element);

  @override
  FutureOr<String> visitClassElement(ClassElement element) {
    classDeclaration
        .complete('class _\$${element.name}Proxy implements ${element.name}');

    return '''
      InvocationHandlerFunction _handle;
      _\$${classElement.name}Proxy(this._handle) : super();    
    ''';
  }

  @override
  visitMethodElement(MethodElement element) {
    if (element.isGenerator) return '';
    if (element.isStatic) return '';
    if (element.isOperator) return '';

    // if (visited.contains(element.name)) return;
    // visited.add(element.name);

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
    // if (visited.contains(element.name)) return;
    // visited.add(element.name);

    if (element.isGetter) return generateGetter(element);
    if (element.isSetter) return generateSetter(element);
  }

  @override
  visitFieldElement(FieldElement element) {
    // ignored since they are handled by property accessor with getter and setter implementation
  }
}
