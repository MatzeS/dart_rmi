import 'package:test/test.dart';

import 'package:rmi_tests/proxy/classes.dart';
import 'package:proxy/proxy.dart';

class RecordingHandler extends ProxyHandler {
  List<Invocation> invocations;
  @override
  Object handle(Invocation invocation) {
    invocations.add(invocation);
  }
}

void main() {
  group('generator', () {
    test('TestClass.simpleMethod generation', () {
      RecordingHandler handler = new RecordingHandler();
      TestClass testObject = TestClass.proxy(handler);

      testObject.simpleMethod();

      expect(handler.invocations.length, 1);
      expect(handler.invocations.first != null, true);
      expect(handler.invocations.first.isMethod, true);
      expect(handler.invocations.first.memberName, 'simpleMethod');
      expect(handler.invocations.first.positionalArguments.length, 0);
    });
  });
}
