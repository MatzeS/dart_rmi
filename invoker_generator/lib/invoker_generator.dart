library invoker_generator;

import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:invoker/invoker.dart';

class InvokerGenerator extends Generator {
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) {
    StringBuffer output = new StringBuffer();
    library.classElements.forEach((classElement) {
      if (!classElement.allSupertypes.map((t) => t.name).contains('Invocable'))
        return;

      if (classElement.metadata
          .map((e) => e.computeConstantValue().toStringValue())
          .contains(notInvocable)) return;

      InvocableClassVisitor visitor = new InvocableClassVisitor(classElement);
      classElement.visitChildren(visitor);
      output.write('''
        class _\$${classElement.name}Invoker {
          static invoke(Invocation invocation, ${classElement.name} target){
            ${visitor.outputString}
          }
        }
      ''');
    });
    return output.toString();
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
      if( // check if invocation is applicable
        #${element.displayName} == invocation.memberName
      ){ //method call
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
