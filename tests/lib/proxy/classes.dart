import 'package:proxy/proxy.dart';

part 'classes.g.dart';

@Proxy()
class TestClass {
  void simpleMethod() {}

  factory TestClass.proxy(ProxyHandler handler) =>
      new _$TestClassProxy(handler);
}
