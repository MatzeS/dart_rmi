import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

class InvokerGenerator extends Generator {
  BuilderOptions options;
  InvokerGenerator(this.options);

  bool isAnnotatedWith<T>(Element element) {
    return TypeChecker.fromRuntime(T).firstAnnotationOf(element) != null;
  }

  //TODO cleanup
  bool isAnnotatedWithUrl(Element element, String url) {
    return TypeChecker.fromUrl(url).firstAnnotationOf(element) != null;
  }

  bool elementFilter(Element element) {
    if (element is ClassElement &&
        TypeChecker.fromUrl(
                'asset:rmi/lib/remote_method_invocation.dart#RmiTarget')
            .isExactlyType(element.type)) {
      return false;
    }

    if (isAnnotatedWithUrl(element, 'asset:rmi/lib/invoker.dart#NotInvocable'))
      return false;
    if (TypeChecker.fromUrl('asset:rmi/lib/invoker.dart#NotInvocable')
        .isAssignableFrom(element)) return false;

    if (TypeChecker.fromUrl('asset:rmi/lib/invoker.dart#Invocable')
        .isAssignableFrom(element)) return true;

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

    List<String> posArgList = [];
    for (int i = 0; i < reqArgCount + optPosArgCount; i++)
      posArgList.add('positionalArguments[$i]');

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
