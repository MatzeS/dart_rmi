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

    String classOutput = '''
    class _\$${classElement.name}Proxy implements ${classElement.name}{
      ProxyHandler _handler;

      _\$${classElement.name}Proxy(this._handler) : super(); //TODO super calls

      ${classvisitor.outputString}
    }
    ''';

    return classOutput;
  }
}

class ProxyClassVisitor extends ThrowingElementVisitor {
  String get outputString => output.toString();
  StringBuffer output = new StringBuffer();

  @override
  void visitMethodElement(MethodElement element) {
    String parameters = element.parameters.map((p) {
      return '${p.type} ${p.name}';
    }).join(',');

    output.write('''
      ${element.returnType} ${element.name}(${parameters}){
        Invocation invocation = Invocation.method(#${element.name}, Iterable.empty()); //TODO empty parameters

        _handler.handle(invocation);
      }
    ''');
  }

  @override
  void visitConstructorElement(ConstructorElement element) {
    //TODO
  }
}
