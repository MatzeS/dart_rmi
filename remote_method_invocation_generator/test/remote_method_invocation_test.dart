import 'package:test/test.dart';
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

class TargetClass implements RmiTarget {
  num value;
  TargetClass(this.value);

  void someMethod() {
    triggered = true;
  }

  num methodWithReturnValue() {
    return value;
  }

  @override
  Object invoke(Invocation invocation) =>
      _$TargetClassInvoker.invoke(invocation, this);
  factory TargetClass.getRemote(Connection connection) =>
      _$TargetClassRmi.getRemote(connection);
  void exposeRemote(Connection connection) =>
      _$TargetClassRmi.exposeRemote(connection, this);
}

main() {
  group('remote method invocation tests', () {
    test('simple method call', () {
      StreamController<String> exposeToGet = StreamController();
      StreamController<String> getToExpose = StreamController();

      TargetClass remoteTarget = new TargetClass(1234);
      remoteTarget
          .exposeRemote(new Connection(getToExpose.stream, exposeToGet));

      TargetClass proxy = TargetClass.getRemote(
          new Connection(exposeToGet.stream, getToExpose));

      proxy.someMethod();
      print('tset is here');
      expect(triggered, true);
    });

    // test('return value', () {
    //   StreamController<String> exposeToGet = StreamController();
    //   StreamController<String> getToExpose = StreamController();

    //   TargetClass remoteTarget = new TargetClass(1234);
    //   remoteTarget
    //       .exposeRemote(new Connection(getToExpose.stream, exposeToGet));

    //   TargetClass proxy = TargetClass.getRemote(
    //       new Connection(exposeToGet.stream, getToExpose));
    //   // num result = proxy.methodWithReturnValue();

    //   // expect(result, 1234);
    // });
  });
}
