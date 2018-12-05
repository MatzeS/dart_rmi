import 'package:test/test.dart';
import 'package:remote_method_invocation/serializable_invocation.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:remote_method_invocation/remote_method_invocation.dart';
import 'package:proxy/proxy.dart';
import 'dart:convert';

import 'dart:async';

part 'remote_method_invocation_test.g.dart';

bool triggered = false;

class TargetClass implements RpcTarget {
  TargetClass();

  @override
  Object invoke(Invocation invocation) =>
      _$TargetClassInvoker.invoke(invocation, this);

  void someMethod() {
    triggered = true;
  }

  factory TargetClass.getRemote(Connection connection) =>
      _$TargetClassRpc.getRemote(connection);
  static void exposeRemote(Connection connection, TargetClass target) =>
      rpcExposeRemote(connection, target);
}

main() {
  group('remote method invocation tests', () {
    //TODO testcoverage
    test('', () {
      StreamController<String> exposeToGet = StreamController();
      StreamController<String> getToExpose = StreamController();

      TargetClass remoteTarget = new TargetClass();
      TargetClass.exposeRemote(
          new Connection(getToExpose.stream, exposeToGet), remoteTarget);

      TargetClass proxy = TargetClass.getRemote(
          new Connection(exposeToGet.stream, getToExpose));
      proxy.someMethod();

      Future.delayed(Duration(seconds: 2), () {
        expect(triggered, true);
      });
    });
  });
}
