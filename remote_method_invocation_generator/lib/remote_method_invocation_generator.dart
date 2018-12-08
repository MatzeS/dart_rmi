library invoker_generator;

import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:invoker/invoker.dart';
import 'package:remote_method_invocation/remote_method_invocation.dart';
import 'package:proxy/proxy.dart';
import 'package:built_value/built_value.dart';

class RmiGenerator extends Generator {
  BuilderOptions options;
  RmiGenerator(this.options);

  bool isAnnotatedWith<T>(Element element) {
    return TypeChecker.fromRuntime(T).firstAnnotationOf(element) != null;
  }

  bool elementFilter(Element element) {
    if (TypeChecker.fromRuntime(RmiTarget).isAssignableFrom(element))
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
      log.severe('only classes can be RmiTargets');
      return null;
    }
    ClassElement classElement = element as ClassElement;

    RmiClassVisitor visitor = new RmiClassVisitor();
    classElement.visitChildren(visitor);

    String serializerList =
        visitor.serializableTypes.map((t) => t.name + '.serializer').join(',');

    StringBuffer stubTypeRegistrations = new StringBuffer();
    for (DartType type in visitor.remoteTargetTypes)
      stubTypeRegistrations.write(
          "context.registerRemoteStubConstructor('${type.displayName}', _\$${type.displayName}Rmi.getRemote);");

    StringBuffer output = new StringBuffer();
    output.write('''
        class _\$${classElement.name}Rmi {
          static bool _registered = false;
          static void _registerSerializers() {
            if (_registered) return;
            _registered = true;

            rmiRegisterSerializers([$serializerList]);
          }
          static void _registerStubConstructors(Context context){
            $stubTypeRegistrations
          }
          static ${classElement.name} getRemote(Context context, String uuid) {
            _registerSerializers();
            _registerStubConstructors(context);
            RmiProxyHandler handler = RmiProxyHandler(context, uuid);
            return _\$${classElement.name}Proxy(handler.handle);
          }
          static Provision provideRemote(Context context, ${classElement.name} target) {
            _registerSerializers();
            _registerStubConstructors(context);
            return rmiProvideRemote(context, target);
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

    if (TypeChecker.fromRuntime(Built)
        .isAssignableFromType(type)) if (!serializableTypes.contains(type))
      serializableTypes.add(type);

    if (TypeChecker.fromRuntime(RmiTarget)
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
