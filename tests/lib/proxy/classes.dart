import 'package:proxy/proxy.dart';
import 'package:invoker/invoker.dart';

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
class TestClass implements Invocable {
  void simpleMethod() {}
  void methodWithArg(num numArg) {}
  void methodWithArgs(num numArg, String second) {}
  void methodWithNamedArg({num namedArg}) {}
  void methodWithNamedArgs({num namedArg, String namedArg2}) {}
  void methodWithPosArg([num arg]) {}
  void methodWithPosArgs([num arg1, String arg2]) {}
  void methodWithMixedPositional(num required, [num positional]) {}
  void methodWithMixedRequired(num required, {num named}) {}

  num methodWithReturn() {}

  num get aGetter {}
  set aSetter(num arg) {}

  num aField;

  //TODO default

  factory TestClass.proxy(ProxyHandler handler) =>
      new _$TestClassProxy(handler);

  @override
  Object invoke(Invocation invocation) =>
      _$TestClassInvoker.invoke(invocation, this);
}
