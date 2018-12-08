import 'package:proxy/proxy.dart';
import 'package:invoker/invoker.dart';
import 'package:test/test.dart';
import '../lib/basic_class.dart';
import '../lib/logging_class.dart';

part 'simple_classes_test.g.dart';

class TestClass extends BasicClass implements Proxy, Invocable {
  @override
  Object invoke(Invocation invocation) =>
      _$TestClassInvoker.invoke(invocation, this);

  factory TestClass.proxy(InvocationHandlerFunction handler) =>
      _$TestClassProxy(handler);
}

class AProxyHandler {
  Invocable delegate;

  AProxyHandler(this.delegate);

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
      TestClass proxy = TestClass.proxy(handler.handle);

      proxy.simpleMethod();

      expect(logger.triggeredOnce(#simpleMethod), true);
    });
  });
}
