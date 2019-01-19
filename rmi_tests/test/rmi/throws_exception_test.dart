import 'package:test/test.dart';
import 'package:rmi/remote_method_invocation.dart';
import 'package:rmi/proxy.dart';

import 'dart:async';

part 'throws_exception_test.g.dart';

class TargetClass implements RmiTarget {
  Exception sampleException = new Exception('sample exception');
  Future<void> method1() {
    return Future.error(sampleException);
  }

  Future<void> method2() async {
    throw sampleException;
  }

  Future<void> method3() {
    return Future.delayed(Duration(seconds: 1)).then((empty) {
      throw sampleException;
    });
  }

  Future<void> method4() {
    throw sampleException;
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
    List methods;

    setUp(() {
      exposeToGet = StreamController();
      getToExpose = StreamController();

      remoteTarget = new TargetClass();
      var provision = remoteTarget
          .provideRemote(new Context(getToExpose.stream, exposeToGet));

      proxy = TargetClass.getRemote(
          new Context(exposeToGet.stream, getToExpose), provision.uuid);
      methods = [proxy.method1, proxy.method2, proxy.method3, proxy.method4];
    });

    Future<void> asyncErrorAwait(Function call) async {
      bool exception = false;
      try {
        await call();
      } on Exception {
        exception = true;
      }
      expect(exception, true);
    }

    test('async error from await', () async {
      await Future.wait(
          methods.map((m) async => await asyncErrorAwait(m)).toList());
    });
    Future<void> asyncErrorFromFuture(Function call) async {
      var completed = new Completer();
      call().catchError((e) => completed.complete());
      // this will throw if not completed, failing the test
      await completed.future.timeout(Duration(seconds: 5), onTimeout: () {
        fail('error not thrown');
      });
    }

    test('async error from future', () async {
      await Future.wait(
          methods.map((m) async => await asyncErrorFromFuture(m)).toList());
    });
  });
}
