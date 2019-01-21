import 'package:rmi/proxy.dart';
import 'dart:async';

@NoProxy([#basicNoProxyMethod])
class BasicClass {
  void simpleMethod() {}
  void methodWithArg(num numArg) {}
  void methodWithArgs(num numArg, String second) {}
  void methodWithNamedArg({num namedArg}) {}
  void methodWithNamedArgs({num namedArg, String namedArg2}) {}
  void methodWithPosArg([num arg]) {}
  void methodWithPosArgs([num arg1, String arg2]) {}
  void methodWithMixedPositional(num required, [num positional]) {}
  void methodWithMixedNamed(num required, {num named}) {}
  num methodWithReturn() => -1;

  num get aGetter => -1;

  set aSetter(num arg) {}

  num aField;

  operator <(Object other) {}

  operator [](Object key) {}
  operator []=(Object key, Object value) {}

  int basicNoProxyMethod() => 42;
  @NoProxy()
  int basicNoProxyMethod2() => 42;

  Stream<num> someGenerator() => null;
  Stream<num> get someGetterGenerator => null;
}

class BasicAsyncClass {
  Future<void> simpleMethod() async {}
  Future<void> methodWithArg(num numArg) async {}
  Future<void> methodWithArgs(num numArg, String second) async {}
  Future<void> methodWithNamedArg({num namedArg}) async {}
  Future<void> methodWithNamedArgs({num namedArg, String namedArg2}) async {}
  Future<void> methodWithPosArg([num arg]) async {}
  Future<void> methodWithPosArgs([num arg1, String arg2]) async {}
  Future<void> methodWithMixedPositional(num required,
      [num positional]) async {}
  Future<void> methodWithMixedNamed(num required, {num named}) async {}
  Future<num> methodWithReturn() async => -1;

  Future<num> get aGetter async => -1;

  operator <(Object other) async {}

  operator [](Object key) async {}
  operator []=(Object key, Object value) async {}

  Stream<num> someGenerator() async* {}
  Stream<num> get someGetterGenerator async* {}
}
