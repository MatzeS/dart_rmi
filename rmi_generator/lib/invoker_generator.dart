import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'type_checkers.dart';
import 'package:source_gen_helpers/class/util.dart';

class InvokerGenerator extends Generator {
  BuilderOptions options;
  InvokerGenerator(this.options);

  bool elementFilter(Element element) {
    if (RmiTargetChecker.isExactly(element)) return false;
    if (NotInvocableChecker.hasAnnotationOf(element)) return false;
    if (NotInvocableChecker.isAssignableFrom(element)) return false;
    if (InvocableChecker.isAssignableFrom(element)) return true;
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

    //TODO cleanup this with new source gen helpers

    InvocableClassVisitor visitor = new InvocableClassVisitor(classElement);
    // classElement.visitChildren(visitor);
    List<Element> member = allClassMember(classElement);
    member = member.where((e) => !(e as dynamic).isStatic).toList();
    member = member.where((e) {
      if (e.enclosingElement is! ClassElement) return true;
      ClassElement c = e.enclosingElement as ClassElement;
      return !c.type.isBottom;
    }).toList();

    member = filterConcreteElements(classElement, member);
    member.forEach((e) => e.accept(visitor));

    return '''
        class _\$${classElement.name}Invoker {
          static dynamic invoke(Invocation invocation, ${classElement.name} target){
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
    if (element.isPrivate) return;
    if (element.name == 'invoke' &&
        element.parameters.length == 1 && //TODO cleanup
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

//TODO named
    var positionalArguments =
        element.parameters.where((p) => p.isPositional).toList();

    List<String> posArgList = [];
    for (int i = 0; i < reqArgCount + optPosArgCount; i++) {
      String argumentReference = 'positionalArguments[$i]';
      if (positionalArguments[i].type.isDartAsyncFuture) {
        String type = (positionalArguments[i].type as ParameterizedType)
            .typeArguments
            .first
            .displayName;
        argumentReference =
            '($argumentReference as Future).then((v) => v as ${type})';
      } else if (TypeChecker.fromRuntime(Stream)
          .isAssignableFromType(positionalArguments[i].type)) {
        argumentReference = '($argumentReference as Stream).cast()';
      }
      posArgList.add(argumentReference);
    }

    String args = posArgList.join(', ');
    if (args.isNotEmpty) args += ', ';
    args += namedArgList.join(', ');

    String methodCall;
    if (element.isOperator) {
      if (element.displayName == '[]=') {
        String key = 'positionalArguments[0]';
        String value = 'positionalArguments[1]';
        methodCall = 'target[$key] = $value;';
      } else if (element.displayName == '[]') {
        String key = 'positionalArguments[0]';
        methodCall = 'target[$key];';
      } else {
        String singleArg = 'positionalArguments[0]';
        methodCall = 'return target ${element.displayName} $singleArg;';
      }
    } else {
      methodCall = 'return target.${element.displayName}($args);';
    }

    output.write('''
      if( 
        invocation.isMethod &&
        #${element.displayName} == invocation.memberName
      ){ 
        List<Object> positionalArguments = List.from(invocation.positionalArguments);
        for(int i = invocation.positionalArguments.length; i < ${reqArgCount + optPosArgCount}; i++)
          positionalArguments.add(null);

        $methodCall
      }
    ''');
  }

  @override
  visitPropertyAccessorElement(PropertyAccessorElement element) {
    if (element.isPrivate) return;
    if (element.isSetter) {
      output.write('''
      if( 
        invocation.isSetter &&
        #${element.displayName} == invocation.memberName
      ){ 
        target.${element.displayName} = invocation.positionalArguments[0];
        return null;
      }
    ''');
    } else if (element.isGetter) {
      output.write('''
      if( 
        invocation.isGetter &&
        #${element.displayName} == invocation.memberName
      ){ 
        return target.${element.displayName};
      }
    ''');
    } else {
      throw new Exception('invalid property accessor');
    }
  }

  @override
  visitFieldElement(FieldElement element) {
    // handled by property accessor
  }
}
