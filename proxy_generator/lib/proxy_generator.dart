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
    if (element.isGenerator) return;

    bool hasNamedArgs = element.parameters.any((p) => p.isNamed);
    bool hasPositionalArgs =
        element.parameters.any((p) => p.isPositional && p.isOptional);
    if (hasNamedArgs && hasPositionalArgs) {
      log.severe('named and positional arguments $element');
    }

    String argumentEncoder(Iterable<ParameterElement> elements) =>
        elements.map((p) => '${p.type.name} ${p.name}').join(', ');
    String declarationRequiredArguments =
        argumentEncoder(element.parameters.where((p) => p.isNotOptional));
    String declarationPositionalArguments = argumentEncoder(
        element.parameters.where((p) => p.isPositional && p.isOptional));
    String declarationNamedArguments =
        argumentEncoder(element.parameters.where((p) => p.isNamed));
    String declarationArguments = declarationRequiredArguments;
    if ((hasNamedArgs || hasPositionalArgs) &&
        declarationRequiredArguments.isNotEmpty) declarationArguments += ', ';
    if (hasPositionalArgs) {
      declarationArguments += '[' + declarationPositionalArguments + ']';
    }
    if (hasNamedArgs) {
      declarationArguments += '{' + declarationNamedArguments + '}';
    }

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

    output.write('''
      ${element.returnType.name} ${element.displayName}($declarationArguments){
        List<Object> arguments =  [];
        ${argumentAdds}
        Map<Symbol, Object> namedArguments = {};
        ${namedArgumentAdds}
        Invocation _\$invocation = Invocation
          .method(#${element.name}, arguments, namedArguments);

        ${!element.returnType.isVoid ? 'return' : ''} _handler.handle(_\$invocation);
      }
    ''');
  }

  @override
  void visitConstructorElement(ConstructorElement element) {
    if (!element.isFactory && element.parameters.any((p) => p.isNotOptional))
      return;

    foundNoArgConstructor = true;
  }

  generateGetter(PropertyAccessorElement element) {
    output.write('''
      get ${element.name}{
        Invocation invocation = Invocation.getter(#${element.name});

        return _handler.handle(invocation);
      }
    ''');
  }

  generateSetter(PropertyAccessorElement element) {
    output.write('''
      set ${element.displayName}(
        ${element.parameters.first.type.name} ${element.parameters.first.displayName}
        ){
        Invocation invocation = Invocation.setter(
          #${element.displayName}, ${element.parameters.first.displayName});

        _handler.handle(invocation);
      }
    ''');
  }

  @override
  visitPropertyAccessorElement(PropertyAccessorElement element) {
    if (element.isGetter) generateGetter(element);
    if (element.isSetter) generateSetter(element);
  }

  @override
  visitFieldElement(FieldElement element) {
    // ignored since they are handled by property accessor with getter and setter implementation
  }
}
