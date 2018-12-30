// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_class_test.dart';

// **************************************************************************
// ProxyGenerator
// **************************************************************************

class _$TestClassProxy implements TestClass {
  void simpleMethod() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#simpleMethod, arguments, namedArguments);

    _handle(_$invocation);
  }

  void methodWithArg(num numArg) {
    List<Object> arguments = [];
    arguments.add(numArg);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#methodWithArg, arguments, namedArguments);

    _handle(_$invocation);
  }

  void methodWithArgs(num numArg, String second) {
    List<Object> arguments = [];
    arguments.add(numArg);
    arguments.add(second);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#methodWithArgs, arguments, namedArguments);

    _handle(_$invocation);
  }

  void methodWithNamedArg({num namedArg}) {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};
    namedArguments.putIfAbsent(#namedArg, () => namedArg);
    Invocation _$invocation =
        Invocation.method(#methodWithNamedArg, arguments, namedArguments);

    _handle(_$invocation);
  }

  void methodWithNamedArgs({num namedArg, String namedArg2}) {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};
    namedArguments.putIfAbsent(#namedArg, () => namedArg);
    namedArguments.putIfAbsent(#namedArg2, () => namedArg2);
    Invocation _$invocation =
        Invocation.method(#methodWithNamedArgs, arguments, namedArguments);

    _handle(_$invocation);
  }

  void methodWithPosArg([num arg]) {
    List<Object> arguments = [];
    arguments.add(arg);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#methodWithPosArg, arguments, namedArguments);

    _handle(_$invocation);
  }

  void methodWithPosArgs([num arg1, String arg2]) {
    List<Object> arguments = [];
    arguments.add(arg1);
    arguments.add(arg2);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#methodWithPosArgs, arguments, namedArguments);

    _handle(_$invocation);
  }

  void methodWithMixedPositional(num required, [num positional]) {
    List<Object> arguments = [];
    arguments.add(required);
    arguments.add(positional);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation = Invocation.method(
        #methodWithMixedPositional, arguments, namedArguments);

    _handle(_$invocation);
  }

  void methodWithMixedNamed(num required, {num named}) {
    List<Object> arguments = [];
    arguments.add(required);
    Map<Symbol, Object> namedArguments = {};
    namedArguments.putIfAbsent(#named, () => named);
    Invocation _$invocation =
        Invocation.method(#methodWithMixedNamed, arguments, namedArguments);

    _handle(_$invocation);
  }

  num methodWithReturn() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#methodWithReturn, arguments, namedArguments);

    return _handle(_$invocation);
  }

  String toString() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toString, arguments, namedArguments);

    return _handle(_$invocation);
  }

  dynamic noSuchMethod(Invocation invocation) {
    List<Object> arguments = [];
    arguments.add(invocation);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#noSuchMethod, arguments, namedArguments);

    return _handle(_$invocation);
  }

  InvocationHandlerFunction _handle;
  _$TestClassProxy(this._handle) : super();

  num get aField {
    Invocation invocation = Invocation.getter(#aField);

    return _handle(invocation);
  }

  num get aGetter {
    Invocation invocation = Invocation.getter(#aGetter);

    return _handle(invocation);
  }

  set aSetter(num arg) {
    Invocation invocation = Invocation.setter(#aSetter, arg);

    _handle(invocation);
  }

  int get hashCode {
    Invocation invocation = Invocation.getter(#hashCode);

    return _handle(invocation);
  }

  Type get runtimeType {
    Invocation invocation = Invocation.getter(#runtimeType);

    return _handle(invocation);
  }
}
