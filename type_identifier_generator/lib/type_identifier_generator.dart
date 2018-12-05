library type_identifier_generator;

import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'package:type_identifier/type_identifier.dart';

TypeIdentifier typeIdentifierFromClassElement(ClassElement element) {
  return null;
}

String typeIdentifierToSource(TypeIdentifier typeIdentifier) {
  return '';
}

class TypeIdentifierGenerator extends Generator {
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) {
    StringBuffer output = new StringBuffer();

    library.classElements.forEach((classElement) {
      if (!TypeChecker.fromRuntime(RegisteredType)
          .isAssignableFrom(classElement)) return;

      TypeIdentifier typeIdentifier =
          typeIdentifierFromClassElement(classElement);

      ElementVisitor visitor;
      // InvocableClassVisitor visitor = new InvocableClassVisitor(classElement);
      classElement.visitChildren(visitor);
      output.write('''
        TypeIdentifier get _\$${classElement.name}TypeIdentifier {
          return ${typeIdentifierToSource(typeIdentifier)};
        }
      ''');
    });
    return output.toString();
  }
}
