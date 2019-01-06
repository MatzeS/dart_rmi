import 'package:test/test.dart';
import 'package:rmi/remote_method_invocation.dart';
import 'package:rmi/proxy.dart';

import 'dart:async';

part 'remote_method_invocation_test.g.dart';

class TargetClass implements RmiTarget {
  num value;
  bool triggered = false;

  TargetClass(this.value);

  Future<void> someMethod() async {
    triggered = true;
  }

  Future<num> methodWithReturnValue() async {
    return value;
  }

  Future<dynamic> returnParameter(dynamic input) async => input;

  operator <(dynamic other) async {
    return value;
  }

  @override
  Object invoke(Invocation invocation) =>
      _$TargetClassInvoker.invoke(invocation, this);
  factory TargetClass.getRemote(Context context, String uuid) =>
      _$TargetClassRmi.getRemote(context, uuid);
  Provision provideRemote(Context context) =>
      _$TargetClassRmi.provideRemote(context, this);
}

main() {
  group('remote method invocation tests', () {
    TargetClass proxy;
    TargetClass remoteTarget;
    setUp(() {
      StreamController<String> exposeToGet = StreamController();
      StreamController<String> getToExpose = StreamController();

      remoteTarget = new TargetClass(1234);
      var provision = remoteTarget
          .provideRemote(new Context(getToExpose.stream, exposeToGet));

      proxy = TargetClass.getRemote(
          new Context(exposeToGet.stream, getToExpose), provision.uuid);
    });
    test('simple method call', () async {
      await proxy.someMethod();
      //TODO remove
      await Future.delayed(Duration(seconds: 4));
      expect(remoteTarget.triggered, true);
    });

    test('return value', () async {
      num result = await proxy.methodWithReturnValue();
      //TODO remove
      await Future.delayed(Duration(seconds: 4));
      expect(result, 1234);
    });
    test('passing null', () async {
      num result = await proxy.returnParameter(null);
      expect(result, isNull);
    });

    test('operator', () async {
      StreamController<String> exposeToGet = StreamController();
      StreamController<String> getToExpose = StreamController();

      TargetClass remoteTarget = new TargetClass(1234);
      var provision = remoteTarget
          .provideRemote(new Context(getToExpose.stream, exposeToGet));

      TargetClass proxy = TargetClass.getRemote(
          new Context(exposeToGet.stream, getToExpose), provision.uuid);
      num result = await (proxy < null);

      expect(result, 1234);
    });
  });
}
