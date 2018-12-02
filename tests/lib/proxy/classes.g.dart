// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classes.dart';

// **************************************************************************
// InvokerGenerator
// **************************************************************************

class _$TestClassInvoker {
  static invoke(Invocation invocation, TestClass target) {
    if ( // check if invocation is applicable
        'simpleMethod' == invocation.memberName.toString()) {
      //method call
      return target.simpleMethod();
    }

    if ( // check if invocation is applicable
        'methodWithArg' == invocation.memberName.toString()) {
      //method call
      return target.methodWithArg(
        invocation.positionalArguments[0],
      );
    }

    if ( // check if invocation is applicable
        'methodWithArgs' == invocation.memberName.toString()) {
      //method call
      return target.methodWithArgs(
        invocation.positionalArguments[0],
        invocation.positionalArguments[1],
      );
    }

    if ( // check if invocation is applicable
        'methodWithNamedArg' == invocation.memberName.toString()) {
      //method call
      return target.methodWithNamedArg(
          namedArg: invocation.namedArguments[#namedArg]);
    }

    if ( // check if invocation is applicable
        'methodWithNamedArgs' == invocation.memberName.toString()) {
      //method call
      return target.methodWithNamedArgs(
          namedArg: invocation.namedArguments[#namedArg],
          namedArg2: invocation.namedArguments[#namedArg2]);
    }

    if ( // check if invocation is applicable
        'methodWithPosArg' == invocation.memberName.toString()) {
      //method call
      return target.methodWithPosArg(
        invocation.positionalArguments[0],
      );
    }

    if ( // check if invocation is applicable
        'methodWithPosArgs' == invocation.memberName.toString()) {
      //method call
      return target.methodWithPosArgs(
        invocation.positionalArguments[0],
        invocation.positionalArguments[1],
      );
    }

    if ( // check if invocation is applicable
        'methodWithMixedPositional' == invocation.memberName.toString()) {
      //method call
      return target.methodWithMixedPositional(
        invocation.positionalArguments[0],
        invocation.positionalArguments[1],
      );
    }

    if ( // check if invocation is applicable
        'methodWithMixedRequired' == invocation.memberName.toString()) {
      //method call
      return target.methodWithMixedRequired(invocation.positionalArguments[0],
          named: invocation.namedArguments[#named]);
    }

    if ( // check if invocation is applicable
        'methodWithReturn' == invocation.memberName.toString()) {
      //method call
      return target.methodWithReturn();
    }
  }
}

// **************************************************************************
// ProxyGenerator
// **************************************************************************

class _$HasOptionalPosZeroArgConstrClassProxy
    implements HasOptionalPosZeroArgConstrClass {
  ProxyHandler _handler;

  _$HasOptionalPosZeroArgConstrClassProxy(this._handler) : super();

  dynamic HasOptionalZeroArgConstrClass([num arg]) {
    List<Object> arguments = [];
    arguments.add(arg);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation = Invocation.method(
        #HasOptionalZeroArgConstrClass, arguments, namedArguments);

    return _handler.handle(_$invocation);
  }
}

class _$HasOptionalNameZeroArgConstrClassProxy
    implements HasOptionalNameZeroArgConstrClass {
  ProxyHandler _handler;

  _$HasOptionalNameZeroArgConstrClassProxy(this._handler) : super();

  dynamic HasOptionalZeroArgConstrClass({num arg}) {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};
    namedArguments.putIfAbsent(#arg, () => arg);
    Invocation _$invocation = Invocation.method(
        #HasOptionalZeroArgConstrClass, arguments, namedArguments);

    return _handler.handle(_$invocation);
  }
}

class _$TestClassProxy implements TestClass {
  ProxyHandler _handler;

  _$TestClassProxy(this._handler) : super();

  get aField {
    Invocation invocation = Invocation.getter(#aField);

    return _handler.handle(invocation);
  }

  set aField(num _aField) {
    Invocation invocation = Invocation.setter(#aField, _aField);

    _handler.handle(invocation);
  }

  get aGetter {
    Invocation invocation = Invocation.getter(#aGetter);

    return _handler.handle(invocation);
  }

  set aSetter(num arg) {
    Invocation invocation = Invocation.setter(#aSetter, arg);

    _handler.handle(invocation);
  }

  void simpleMethod() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#simpleMethod, arguments, namedArguments);

    _handler.handle(_$invocation);
  }

  void methodWithArg(num numArg) {
    List<Object> arguments = [];
    arguments.add(numArg);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#methodWithArg, arguments, namedArguments);

    _handler.handle(_$invocation);
  }

  void methodWithArgs(num numArg, String second) {
    List<Object> arguments = [];
    arguments.add(numArg);
    arguments.add(second);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#methodWithArgs, arguments, namedArguments);

    _handler.handle(_$invocation);
  }

  void methodWithNamedArg({num namedArg}) {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};
    namedArguments.putIfAbsent(#namedArg, () => namedArg);
    Invocation _$invocation =
        Invocation.method(#methodWithNamedArg, arguments, namedArguments);

    _handler.handle(_$invocation);
  }

  void methodWithNamedArgs({num namedArg, String namedArg2}) {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};
    namedArguments.putIfAbsent(#namedArg, () => namedArg);
    namedArguments.putIfAbsent(#namedArg2, () => namedArg2);
    Invocation _$invocation =
        Invocation.method(#methodWithNamedArgs, arguments, namedArguments);

    _handler.handle(_$invocation);
  }

  void methodWithPosArg([num arg]) {
    List<Object> arguments = [];
    arguments.add(arg);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#methodWithPosArg, arguments, namedArguments);

    _handler.handle(_$invocation);
  }

  void methodWithPosArgs([num arg1, String arg2]) {
    List<Object> arguments = [];
    arguments.add(arg1);
    arguments.add(arg2);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#methodWithPosArgs, arguments, namedArguments);

    _handler.handle(_$invocation);
  }

  void methodWithMixedPositional(num required, [num positional]) {
    List<Object> arguments = [];
    arguments.add(required);
    arguments.add(positional);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation = Invocation.method(
        #methodWithMixedPositional, arguments, namedArguments);

    _handler.handle(_$invocation);
  }

  void methodWithMixedRequired(num required, {num named}) {
    List<Object> arguments = [];
    arguments.add(required);
    Map<Symbol, Object> namedArguments = {};
    namedArguments.putIfAbsent(#named, () => named);
    Invocation _$invocation =
        Invocation.method(#methodWithMixedRequired, arguments, namedArguments);

    _handler.handle(_$invocation);
  }

  num methodWithReturn() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#methodWithReturn, arguments, namedArguments);

    return _handler.handle(_$invocation);
  }

  Object invoke(Invocation invocation) {
    List<Object> arguments = [];
    arguments.add(invocation);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#invoke, arguments, namedArguments);

    return _handler.handle(_$invocation);
  }
}
