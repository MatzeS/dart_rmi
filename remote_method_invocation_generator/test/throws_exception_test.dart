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
  Future<void> someMethod() async {
    throw new Exception('some exception');
  }

  TargetClass();
  @override
  Object invoke(Invocation invocation) =>
      _$TargetClassInvoker.invoke(invocation, this);
  factory TargetClass.getRemote(Context context, String uuid) =>
      _$TargetClassRmi.getRemote(context, uuid);
  Provision provideRemote(Context context) =>
      _$TargetClassRmi.provideRemote(context, this);
}

main() {
  StreamController<String> exposeToGet;
  StreamController<String> getToExpose;

  TargetClass remoteTarget;
  TargetClass proxy;
  group('exception', () {
    setUp(() {
      exposeToGet = StreamController();
      getToExpose = StreamController();

      remoteTarget = new TargetClass();
      var provision = remoteTarget
          .provideRemote(new Context(getToExpose.stream, exposeToGet));

      proxy = TargetClass.getRemote(
          new Context(exposeToGet.stream, getToExpose), provision.uuid);
    });
    test('simple method call with await', () async {
      bool exception = false;

      try {
        await proxy.someMethod();
      } on Exception catch (e) {
        exception = true;
      }

      expect(exception, true);
    });
    test('simple method call with future syntax', () async {
      bool exception = false;

      proxy.someMethod().catchError((Object e) {
        exception = true;
      });
      await Future.delayed(Duration(seconds: 1));

      expect(exception, true);
    });
  });
}
