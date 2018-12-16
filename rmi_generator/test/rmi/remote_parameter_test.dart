import 'package:test/test.dart';
import 'package:rmi/remote_method_invocation.dart';
import 'package:rmi/proxy.dart';

import 'dart:async';

part 'remote_parameter_test.g.dart';

class ASubParameter implements RmiTarget {
  bool triggered = false;
  String aField;

  ASubParameter(this.aField);

  Future<String> get someStringGetter async {
    triggered = true;
    return aField;
  }

  @override
  Object invoke(Invocation invocation) =>
      _$ASubParameterInvoker.invoke(invocation, this);
  static ASubParameter getRemote(Context context, String uuid) =>
      _$ASubParameterRmi.getRemote(context, uuid);
  Provision provideRemote(Context context) =>
      _$ASubParameterRmi.provideRemote(context, this);
}

class AParameter implements RmiTarget {
  num value;
  bool triggered = false;
  ASubParameter sub;
  AParameter([this.value, this.sub]);
  Future<num> parameterMethod() async {
    triggered = true;
    return value;
  }

  Future<ASubParameter> get getSub async {
    return sub;
  }

  @override
  Object invoke(Invocation invocation) =>
      _$AParameterInvoker.invoke(invocation, this);
  static AParameter getRemote(Context context, String uuid) =>
      _$AParameterRmi.getRemote(context, uuid);
  Provision provideRemote(Context context) =>
      _$AParameterRmi.provideRemote(context, this);
}

class TargetClass implements RmiTarget {
  Future<num> someMethod(AParameter parameter) async {
    return await parameter.parameterMethod(); // AWAIT???? TODO !!!!!!
  }

  Future<String> subElementCheck(AParameter parameter) async {
    var x = parameter;
    var y = await x.getSub;
    var z = y.someStringGetter;
    return z;
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
  group('remote parameter', () {
    StreamController<String> exposeToGet;
    StreamController<String> getToExpose;

    TargetClass remoteTarget;
    TargetClass proxy;
    AParameter parameter;
    setUp(() {
      exposeToGet = StreamController();
      getToExpose = StreamController();

      remoteTarget = new TargetClass();
      var provision = remoteTarget.provideRemote(
          new Context(getToExpose.stream.asBroadcastStream(), exposeToGet));

      proxy = TargetClass.getRemote(
          new Context(exposeToGet.stream.asBroadcastStream(), getToExpose),
          provision.uuid);

      parameter = new AParameter(1234);
    });
    test('simple method call ', () async {
      num res = await proxy.someMethod(parameter);
      expect(res, 1234);
      expect(parameter.triggered, true);
    });
  });

  group('second level parameter stuff', () {
    StreamController<String> provideToGet;
    StreamController<String> getToProvide;

    TargetClass remoteTarget;
    TargetClass proxy;
    AParameter parameter;
    ASubParameter sub;
    setUp(() {
      provideToGet = StreamController();
      getToProvide = StreamController();

      remoteTarget = new TargetClass();
      var provision = remoteTarget.provideRemote(
          new Context(getToProvide.stream.asBroadcastStream(), provideToGet));

      proxy = TargetClass.getRemote(
          new Context(provideToGet.stream.asBroadcastStream(), getToProvide),
          provision.uuid);

      sub = new ASubParameter('asdfer');
      parameter = new AParameter(1234, sub);
    });
    test('simple method call', () async {
      String res = await proxy.subElementCheck(parameter);
      expect(res, 'asdfer');
      expect(sub.triggered, true);
    });
  });
}
