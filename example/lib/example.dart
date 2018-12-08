import 'package:rmi/remote_method_invocation.dart';
import 'dart:async';

part 'example.g.dart';

class ExampleClass implements RmiTarget {
  void someMethod() {
    print('some stuff');
  }

  ExampleClass();
  // required boilerplate for code generation
  @override
  Object invoke(Invocation invocation) =>
      _$ExampleClassInvoker.invoke(invocation, this);
  factory ExampleClass.getRemote(Context context, String uuid) =>
      _$ExampleClassRmi.getRemote(context, uuid);
  Provision provideRemote(Context context) =>
      _$ExampleClassRmi.provideRemote(context, this);
}

main() {
  StreamController<String> aToB = StreamController();
  StreamController<String> bToA = StreamController();

  ExampleClass remoteTarget = new ExampleClass();
  var provision = remoteTarget.provideRemote(new Context(aToB.stream, bToA));

  ExampleClass proxy =
      ExampleClass.getRemote(new Context(bToA.stream, aToB), provision.uuid);

  proxy.someMethod();
}
