import 'package:test/test.dart';
import 'package:rmi/remote_method_invocation.dart';
import 'package:rmi/proxy.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:async';

part 'serialize_parameters_test.g.dart';

@JsonSerializable()
class SomeParameter {
  num wrapped;

  SomeParameter({this.wrapped});

  Map<String, dynamic> toJson() => _$SomeParameterToJson(this);
  static SomeParameter fromJson(Map<String, dynamic> json) =>
      _$SomeParameterFromJson(json);
}

class TargetClass implements RmiTarget {
  void someMethod(SomeParameter parameter) async {}

  Future<num> methodWithReturnValue(SomeParameter parameter) async {
    return parameter.wrapped;
  }

  Future<SomeParameter> get aGetter async {
    var x = new SomeParameter();
    x.wrapped = 123456789;
    return x;
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
  group('serializable parameter/', () {
    test('simple method call', () async {
      StreamController<String> exposeToGet = StreamController();
      StreamController<String> getToExpose = StreamController();

      TargetClass remoteTarget = new TargetClass();
      var provision = remoteTarget
          .provideRemote(new Context(getToExpose.stream, exposeToGet));

      TargetClass proxy = TargetClass.getRemote(
          new Context(exposeToGet.stream, getToExpose), provision.uuid);
      SomeParameter parameter = SomeParameter(wrapped: 1234);
      await proxy.someMethod(parameter);
    });

    test('return value', () async {
      StreamController<String> exposeToGet = StreamController();
      StreamController<String> getToExpose = StreamController();

      TargetClass remoteTarget = new TargetClass();
      var provision = remoteTarget
          .provideRemote(new Context(getToExpose.stream, exposeToGet));

      TargetClass proxy = TargetClass.getRemote(
          new Context(exposeToGet.stream, getToExpose), provision.uuid);
      SomeParameter parameter = SomeParameter(wrapped: 1234);
      num result = await proxy.methodWithReturnValue(parameter);

      expect(result, 1234);
    });

    test('getter', () async {
      StreamController<String> exposeToGet = StreamController();
      StreamController<String> getToExpose = StreamController();

      TargetClass remoteTarget = new TargetClass();
      var provision = remoteTarget
          .provideRemote(new Context(getToExpose.stream, exposeToGet));

      TargetClass proxy = TargetClass.getRemote(
          new Context(exposeToGet.stream, getToExpose), provision.uuid);

      var returned = await proxy.aGetter;
      expect(returned.wrapped, 123456789);
    });
  });
}
