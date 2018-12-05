library invoker_generator;

import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:invoker/invoker.dart';
import 'package:remote_method_invocation/remote_method_invocation.dart';

class RpcGenerator extends Generator {
  BuilderOptions options;
  RpcGenerator(this.options);

  // bool get isRpcActive => options.config.containsKey('rpc');

  bool isAnnotatedWith<T>(Element element) {
    return TypeChecker.fromRuntime(T).firstAnnotationOf(element) != null;
  }

  bool elementFilter(Element element) {
    if (TypeChecker.fromRuntime(RpcTarget).isAssignableFrom(element))
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
      log.severe('only classes can be RpcTargets');
      return null;
    }
    ClassElement classElement = element as ClassElement;

    StringBuffer output = new StringBuffer();
    output.write('''
        class _\$${classElement.name}Rpc {
          static TargetClass getRemote(Connection connection) {
            ProxyHandler handler = RpcProxyHandler(connection);
            return _\$${classElement.name}Proxy(handler);
          }
        }
      ''');
    return output.toString();
  }
}
