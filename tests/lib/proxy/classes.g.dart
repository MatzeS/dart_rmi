// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classes.dart';

// **************************************************************************
// ProxyGenerator
// **************************************************************************

class _$TestClassProxy implements TestClass {
  ProxyHandler _handler;

  _$TestClassProxy(this._handler) : super(); //TODO super calls

  void simpleMethod() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation invocation =
        Invocation.method(#simpleMethod, arguments, namedArguments);

    _handler.handle(invocation);
  }

  void methodWithArg(num numArg) {
    List<Object> arguments = [];
    arguments.add(numArg);
    Map<Symbol, Object> namedArguments = {};

    Invocation invocation =
        Invocation.method(#methodWithArg, arguments, namedArguments);

    _handler.handle(invocation);
  }

  void methodWithArgs(num numArg, String second) {
    List<Object> arguments = [];
    arguments.add(numArg);
    arguments.add(second);
    Map<Symbol, Object> namedArguments = {};

    Invocation invocation =
        Invocation.method(#methodWithArgs, arguments, namedArguments);

    _handler.handle(invocation);
  }

  void methodWithNamedArg({num namedArg}) {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};
    namedArguments.putIfAbsent(#namedArg, () => namedArg);
    Invocation invocation =
        Invocation.method(#methodWithNamedArg, arguments, namedArguments);

    _handler.handle(invocation);
  }

  void methodWithNamedArgs({num namedArg, String namedArg2}) {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};
    namedArguments.putIfAbsent(#namedArg, () => namedArg);
    namedArguments.putIfAbsent(#namedArg2, () => namedArg2);
    Invocation invocation =
        Invocation.method(#methodWithNamedArgs, arguments, namedArguments);

    _handler.handle(invocation);
  }

  void methodWithPosArg([num arg]) {
    List<Object> arguments = [];
    arguments.add(arg);
    Map<Symbol, Object> namedArguments = {};

    Invocation invocation =
        Invocation.method(#methodWithPosArg, arguments, namedArguments);

    _handler.handle(invocation);
  }

  void methodWithPosArgs([num arg1, String arg2]) {
    List<Object> arguments = [];
    arguments.add(arg1);
    arguments.add(arg2);
    Map<Symbol, Object> namedArguments = {};

    Invocation invocation =
        Invocation.method(#methodWithPosArgs, arguments, namedArguments);

    _handler.handle(invocation);
  }
}
