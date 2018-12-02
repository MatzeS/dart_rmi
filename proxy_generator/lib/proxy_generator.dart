library proxy_generator;

import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:proxy/proxy.dart';

class ProxyGenerator extends GeneratorForAnnotation<Proxy> {
  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    if (element is! ClassElement) {
      log.severe('only classes can be proxies, $element is not a class');
    }

    ClassElement classElement = element as ClassElement;
    ProxyClassVisitor classvisitor = new ProxyClassVisitor();
    classElement.visitChildren(classvisitor);

    if (!classvisitor.foundNoArgConstructor) {
      log.severe('${classElement} must have a no argument constructor');
    }

    String classOutput = '''
    class _\$${classElement.name}Proxy implements ${classElement.name}{
      ProxyHandler _handler;

      _\$${classElement.name}Proxy(this._handler) : super();

      ${classvisitor.outputString}
    }
    ''';

    return classOutput;
  }
}

class ProxyClassVisitor extends ThrowingElementVisitor {
  String get outputString => output.toString();
  StringBuffer output = new StringBuffer();

  bool foundNoArgConstructor = false;

  @override
  void visitMethodElement(MethodElement element) {
    if (element.isFactory) return;

    bool hasNamedArgs = element.parameters.any((p) => p.isNamed);
    bool hasPositional = element.parameters.any((p) => p.isPositional);
    assert(!(hasNamedArgs && hasPositional));

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

    String declaration = element.computeNode().toSource();
    output.write('''
      ${declaration.substring(0, declaration.length - 1)}
        List<Object> arguments =  [];
        ${argumentAdds}
        Map<Symbol, Object> namedArguments = {};
        ${namedArgumentAdds}
        Invocation invocation = Invocation
          .method(#${element.name}, arguments, namedArguments);

        ${!element.returnType.isVoid ? 'return' : ''} _handler.handle(invocation);
      }
    ''');
  }

  @override
  void visitConstructorElement(ConstructorElement element) {
    if (!element.isFactory && element.parameters.any((p) => p.isNotOptional))
      return;

    foundNoArgConstructor = true;
  }

  @override
  visitPropertyAccessorElement(PropertyAccessorElement element) {
    print(element);
    String declaration = element.computeNode().toSource();
    output.write('''
      ${declaration.substring(0, declaration.length - 1)}        
        Invocation invocation = Invocation.getter(#${element.name});

        return _handler.handle(invocation);
      }
    ''');
  }

  @override
  visitFieldElement(FieldElement element) {
    print(element);
  }
}
