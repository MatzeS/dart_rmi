import 'package:test/test.dart';
import 'package:proxy/proxy.dart';
import 'package:rmi_test/basic_class.dart';

part 'synchronous_test.g.dart';

class SynchronousHandler {
  num returnValue;
  SynchronousHandler(this.returnValue);
  List<Invocation> invocations = [];

  Object handle(Invocation invocation) async {
    print('waiting 5 sec');
    await Future.delayed(Duration(seconds: 5));
    print('waiting done');
    invocations.add(invocation);
    return returnValue;
  }
}

class TestClass implements Proxy {
  Future<num> someMethod() async {}
  factory TestClass.proxy(InvocationHandlerFunction handler) =>
      _$TestClassProxy(handler);
}

void main() {
  TestClass testObject;

  group('synchronous method test', () {
    SynchronousHandler handler;
    setUp(() {
      handler = new SynchronousHandler(1234);
      testObject = TestClass.proxy(handler.handle);
    });
    test('simple method', () async {
      var val = testObject.someMethod();
      await val;
      print(val);
      print(val.runtimeType);

      expect(handler.invocations.length, 1);
      expect(handler.invocations.first != null, true);
      expect(handler.invocations.first.isMethod, true);
      expect(handler.invocations.first.memberName, #someMethod);
      expect(handler.invocations.first.positionalArguments.length, 0);
    });
  });
}
