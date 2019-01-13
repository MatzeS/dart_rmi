import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:json_annotation/json_annotation.dart';

class RmiGenerator extends Generator {
  BuilderOptions options;
  RmiGenerator(this.options);

  bool isAnnotatedWith<T>(Element element) {
    return TypeChecker.fromRuntime(T).firstAnnotationOf(element) != null;
  }

  bool elementFilter(Element element) {
    if (element is ClassElement &&
        TypeChecker.fromUrl(
                'asset:rmi/lib/remote_method_invocation.dart#RmiTarget')
            .isExactlyType(element.type)) {
      return false;
    }

    if (TypeChecker.fromUrl(
            'asset:rmi/lib/remote_method_invocation.dart#RmiTarget')
        .isAssignableFrom(element)) {
      return true;
    }

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
      log.severe('only classes can be RmiTargets');
      return null;
    }
    ClassElement classElement = element as ClassElement;

    RmiClassVisitor visitor = new RmiClassVisitor();
    classElement.visitChildren(visitor);

    String deserializerList = visitor.serializableTypes
        .map((t) =>
            'context.registerDeserializer("${TypeChecker.fromStatic(t).toString()}", (d) => ${t.name}.fromJson(d));')
        .join('\n');

    StringBuffer stubTypeRegistrations = new StringBuffer();
    for (DartType type in visitor.remoteTargetTypes)
      if (type.displayName != classElement.displayName)
        stubTypeRegistrations.write(
            "context.registerRemoteStubConstructor('${TypeChecker.fromStatic(type).toString()}', ${type.displayName}.getRemote);");

    //TODO think about this, wheather this is a suitable workaround...
    stubTypeRegistrations.write(
        "context.registerRemoteStubConstructor('${TypeChecker.fromStatic(classElement.type).toString()}', getRemote);");

    StringBuffer output = new StringBuffer();
    output.write('''
        class _\$${classElement.name}Rmi {
          static void _registerSerializers(Context context) {
            $deserializerList
          }
          static void _registerStubConstructors(Context context){
            $stubTypeRegistrations
          }
          static ${classElement.name} getRemote(Context context, String uuid) {
            _registerSerializers(context);
            _registerStubConstructors(context);
            RmiProxyHandler handler = RmiProxyHandler(context, uuid);
            return _\$${classElement.name}Proxy(handler.handle);
          }
          static Provision provideRemote(Context context, ${classElement.name} target) {
            _registerSerializers(context);
            _registerStubConstructors(context);
            return rmiProvideRemote(context, target, '${TypeChecker.fromStatic(classElement.type).toString()}');
          }
        }
      ''');
    return output.toString();
  }
}

class RmiClassVisitor extends ThrowingElementVisitor {
  List<DartType> serializableTypes = [];
  List<DartType> remoteTargetTypes = [];

  check(DartType type) {
    if (type == null) return;
    if (type.isObject) return;
    if (type.isVoid) return;

    if (TypeChecker.fromRuntime(JsonSerializable)
        .annotationsOf(type.element)
        .isNotEmpty) if (!serializableTypes.contains(type))
      serializableTypes.add(type);

    if (TypeChecker.fromUrl(
            'asset:rmi/lib/remote_method_invocation.dart#RmiTarget')
        .isAssignableFromType(type)) if (!remoteTargetTypes.contains(type))
      remoteTargetTypes.add(type);
  }

  @override
  visitMethodElement(MethodElement element) {
    check(element.returnType);
    element.parameters.forEach((e) => check(e.type));
  }

  @override
  visitFieldElement(FieldElement element) {
    // covered by accessor
  }

  @override
  visitPropertyAccessorElement(PropertyAccessorElement element) {
    if (element.isGetter) {
      check(element.returnType);
    } else if (element.isSetter) {
      check(element.parameters.first.type);
    } else {
      throw new Exception('invalid accessor');
    }
  }

  @override
  visitConstructorElement(ConstructorElement element) {
    // constructors are not invocable
  }
}
