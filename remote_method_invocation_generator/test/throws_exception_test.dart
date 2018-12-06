import 'package:test/test.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:remote_method_invocation/remote_method_invocation.dart';
import 'package:proxy/proxy.dart';
import 'dart:convert';
import 'package:built_value/built_value.dart';

import 'dart:async';

part 'throws_exception_test.g.dart';

class TargetClass implements RmiTarget {
  Future<void> someMethod() {
    throw new Exception('some exception');
  }

  TargetClass();
  @override
  Object invoke(Invocation invocation) =>
      _$TargetClassInvoker.invoke(invocation, this);
  factory TargetClass.getRemote(Connection connection) =>
      _$TargetClassRmi.getRemote(connection);
  void exposeRemote(Connection connection) =>
      _$TargetClassRmi.exposeRemote(connection, this);
}

main() {
  group('exception', () {
    test('simple method call', () async {
      StreamController<String> exposeToGet = StreamController();
      StreamController<String> getToExpose = StreamController();

      TargetClass remoteTarget = new TargetClass();
      remoteTarget
          .exposeRemote(new Connection(getToExpose.stream, exposeToGet));

      TargetClass proxy = TargetClass.getRemote(
          new Connection(exposeToGet.stream, getToExpose));

      int exception = 0;

      try {
        await proxy.someMethod();
      } on Exception catch (e) {
        exception++;
      }

      proxy.someMethod().catchError((Object e) {
        exception++;
      });
      await Future.delayed(Duration(seconds: 1));

      expect(exception, 2);
    });
  });
}
