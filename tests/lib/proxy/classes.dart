import 'package:proxy/proxy.dart';

part 'classes.g.dart';

// @Proxy() // TODO test this
// class HasNoZeroArgConstrClass {
//   HasNoZeroArgConstrClass(num arg) {}
// }

@Proxy()
class HasOptionalPosZeroArgConstrClass {
  HasOptionalZeroArgConstrClass([num arg]) {}
}

@Proxy()
class HasOptionalNameZeroArgConstrClass {
  HasOptionalZeroArgConstrClass({num arg}) {}
}

@Proxy()
class TestClass {
  void simpleMethod() {}
  void methodWithArg(num numArg) {}
  void methodWithArgs(num numArg, String second) {}
  void methodWithNamedArg({num namedArg}) {}
  void methodWithNamedArgs({num namedArg, String namedArg2}) {}
  void methodWithPosArg([num arg]) {}
  void methodWithPosArgs([num arg1, String arg2]) {}

  int methodWithReturn() {}

  int get anGetter {}

  //TODO default

  factory TestClass.proxy(ProxyHandler handler) =>
      new _$TestClassProxy(handler);
}
