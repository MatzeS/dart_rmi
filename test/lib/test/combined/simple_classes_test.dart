import 'package:proxy/proxy.dart';
import 'package:invoker/invoker.dart';
import 'package:test/test.dart';
import '../invoker/simple_classes_test.dart';
import '../../proxy/classes.dart';

class AProxyHandler extends ProxyHandler {
  TestClass delegate;

  AProxyHandler(this.delegate);

  @override
  Object handle(Invocation invocation) {
    return delegate.invoke(invocation);
  }
}

void main() {
  group('combined tests', () {
    setUp(() {});
    test('simple method test', () {
      LoggingClass logger = new LoggingClass();
      AProxyHandler handler = new AProxyHandler(logger);
      TestClass proxy = TestClass.proxy(handler);

      proxy.simpleMethod();

      expect(logger.triggeredOnce(#simpleMethod), true);
    });
  });
}
