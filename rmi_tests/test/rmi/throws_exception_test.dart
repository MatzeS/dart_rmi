import 'package:test/test.dart';
import 'package:rmi/remote_method_invocation.dart';
import 'package:rmi/proxy.dart';

import 'dart:async';

part 'throws_exception_test.g.dart';

class TargetClass implements RmiTarget {
  Future<void> someMethod() {
    return Future.delayed(Duration(seconds: 1)).then((empty) {
      throw new Exception('some exception');
    });
  }

  // Future<void> someMethod() async {
  //   throw new Exception('some exception');
  // }

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
      } on Exception {
        exception = true;
      }

      expect(exception, true);
    });
    test('simple method call with future syntax', () async {
      bool exception = false;
      proxy.someMethod().catchError((Object e) {
        print('this occours in catch $e');
        exception = true;
      });
      await Future.delayed(Duration(seconds: 3)); //TODO remove

      expect(exception, true);
    });
  });
}
