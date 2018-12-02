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
    if (!(element.displayName == 'invoke' &&
        element.parameters.length == 2 &&
        element.parameters[0].type.displayName == 'Invocation' &&
        element.parameters[1].type.displayName == classElement.displayName))
      return;

    print(element);
  }
}
