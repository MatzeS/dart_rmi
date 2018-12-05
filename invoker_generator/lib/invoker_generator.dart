library invoker_generator;

import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:invoker/invoker.dart';

class InvokerGenerator extends Generator {
  BuilderOptions options;
  InvokerGenerator(this.options);

  bool isAnnotatedWith<T>(Element element) {
    return TypeChecker.fromRuntime(T).firstAnnotationOf(element) != null;
  }

  bool elementFilter(Element element) {
    if (isAnnotatedWith<NotInvocable>(element)) return false;
    if (TypeChecker.fromRuntime(NotInvocable).isAssignableFrom(element))
      return false;

    if (TypeChecker.fromRuntime(Invocable).isAssignableFrom(element))
      return true;

    return false;
  }

  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) async {
    return library.allElements
        .where(elementFilter)
        .map((e) => generateForElement(e))
        .join('\n\n');
  }

  String generateForElement(Element element) {
    if (element is! ClassElement) {
      log.severe('only classes can be Invocable, $element is not a class');
    }
    ClassElement classElement = element as ClassElement;

    InvocableClassVisitor visitor = new InvocableClassVisitor(classElement);
    classElement.visitChildren(visitor);
    return '''
        class _\$${classElement.name}Invoker {
          static invoke(Invocation invocation, ${classElement.name} target){
            ${visitor.outputString}
          }
        }
      ''';
  }
}

class InvocableClassVisitor extends ThrowingElementVisitor {
  String get outputString => output.toString();
  StringBuffer output = new StringBuffer();

  final ClassElement classElement;
  InvocableClassVisitor(this.classElement);

  @override
  visitConstructorElement(ConstructorElement element) {
    // constructors cannot be called by invocations
  }

  @override
  visitMethodElement(MethodElement element) {
    if (element.isStatic) return;
    if (element.name == 'invoke' &&
        element.parameters.length == 1 &&
        element.parameters[0].type.name == 'Invocation') return;

    List<String> namedArgList = [];
    element.parameters.where((p) => p.isNamed)
      ..forEach((p) {
        namedArgList.add('${p.name}: invocation.namedArguments[#${p.name}]');
      });

    int reqArgCount = element.parameters
        .where((p) => p.isPositional && p.isNotOptional)
        .toList()
        .length;
    int optPosArgCount = element.parameters
        .where((p) => p.isPositional && p.isOptional)
        .toList()
        .length;

    List<String> methodCalls = [];
    for (int i = 0; i < optPosArgCount + 1; i++) {
      // +1 for no opt pos args

      List<String> posArgList = [];
      for (int j = 0; j < reqArgCount + i; j++)
        posArgList.add('invocation.positionalArguments[$j]');

      String args = posArgList.join(', ');
      if (args.isNotEmpty) args += ', ';
      args += namedArgList.join(', ');

      methodCalls.add('''
        if(invocation.positionalArguments.length == ${reqArgCount + i}){
          return target.${element.displayName}($args);
        }
      ''');
    }

    output.write('''
      if( 
        #${element.displayName} == invocation.memberName
      ){ 
        ${methodCalls.join('\n')}
      }

    ''');
  }

  @override
  visitPropertyAccessorElement(PropertyAccessorElement element) {
    print(element);
  }

  @override
  visitFieldElement(FieldElement element) {
    print(element);
  }
}
