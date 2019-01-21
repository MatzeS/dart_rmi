import 'package:test/test.dart';
import 'dart:async';
import 'package:rmi/rmi.dart';
import '../bound_context.dart';
part 'future_parameter_test.g.dart';

class TestClass implements RmiTarget {
  Provision provideRemote(Context context) =>
      _$TestClassRmi.provideRemote(context, this);

  static TestClass getRemote(Context context, String uuid) =>
      _$TestClassRmi.getRemote(context, uuid);

  @override
  Object invoke(Invocation invocation) =>
      _$TestClassInvoker.invoke(invocation, this);

  Future<num> futureMethod(Future<String> aParameter) async {
    var txt = await aParameter;
    return num.parse(txt);
  }

  Future<num> streamMethod(Stream<String> aParameter) async {
    Future<String> aFuture = aParameter.first;
    await aFuture;
    var txt = await aFuture;
    return num.parse(txt);
  }
}

main() {
  TestClass target;
  TestClass testObject;
  setUp(() {
    target = new TestClass();
    var contexts = createBoundContexts();
    var provision = target.provideRemote(contexts.item1);
    testObject = TestClass.getRemote(contexts.item2, provision.uuid);
  });

  group('general', () {
    test('future parameter', () async {
      var param = Future.value('3');
      var res = await testObject.futureMethod(param);
      expect(res, 3);
    });
    test('stream parameter', () async {
      var sc = new StreamController<String>();
      var res = testObject.streamMethod(sc.stream);
      sc.sink.add('3');
      expect(await res, 3);
    });
  });
}
