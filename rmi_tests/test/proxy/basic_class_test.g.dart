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

    InvocationMetadata metadata = new InvocationMetadata();

    _handle(_$invocation, metadata);
  }

  void methodWithArg(num numArg) {
    List<Object> arguments = [];
    arguments.add(numArg);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#methodWithArg, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);

    _handle(_$invocation, metadata);
  }

  void methodWithArgs(num numArg, String second) {
    List<Object> arguments = [];
    arguments.add(numArg);
    arguments.add(second);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#methodWithArgs, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);

    _handle(_$invocation, metadata);
  }

  void methodWithNamedArg({num namedArg}) {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};
    namedArguments.putIfAbsent(#namedArg, () => namedArg);
    Invocation _$invocation =
        Invocation.method(#methodWithNamedArg, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.namedArgumentMetadata[#namedArg] = [];

    _handle(_$invocation, metadata);
  }

  void methodWithNamedArgs({num namedArg, String namedArg2}) {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};
    namedArguments.putIfAbsent(#namedArg, () => namedArg);
    namedArguments.putIfAbsent(#namedArg2, () => namedArg2);
    Invocation _$invocation =
        Invocation.method(#methodWithNamedArgs, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.namedArgumentMetadata[#namedArg] = [];
    metadata.namedArgumentMetadata[#namedArg2] = [];

    _handle(_$invocation, metadata);
  }

  void methodWithPosArg([num arg]) {
    List<Object> arguments = [];
    arguments.add(arg);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#methodWithPosArg, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);

    _handle(_$invocation, metadata);
  }

  void methodWithPosArgs([num arg1, String arg2]) {
    List<Object> arguments = [];
    arguments.add(arg1);
    arguments.add(arg2);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#methodWithPosArgs, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);

    _handle(_$invocation, metadata);
  }

  void methodWithMixedPositional(num required, [num positional]) {
    List<Object> arguments = [];
    arguments.add(required);
    arguments.add(positional);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation = Invocation.method(
        #methodWithMixedPositional, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);

    _handle(_$invocation, metadata);
  }

  void methodWithMixedNamed(num required, {num named}) {
    List<Object> arguments = [];
    arguments.add(required);
    Map<Symbol, Object> namedArguments = {};
    namedArguments.putIfAbsent(#named, () => named);
    Invocation _$invocation =
        Invocation.method(#methodWithMixedNamed, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.namedArgumentMetadata[#named] = [];

    _handle(_$invocation, metadata);
  }

  num methodWithReturn() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#methodWithReturn, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();

    return _handle(_$invocation, metadata);
  }

  dynamic operator <(Object other) {
    List<Object> arguments = [];
    arguments.add(other);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation = Invocation.method(#<, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);

    return _handle(_$invocation, metadata);
  }

  dynamic operator [](Object key) {
    List<Object> arguments = [];
    arguments.add(key);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation = Invocation.method(#[], arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);

    return _handle(_$invocation, metadata);
  }

  void operator []=(Object key, Object value) {
    List<Object> arguments = [];
    arguments.add(key);
    arguments.add(value);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#[]=, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);

    _handle(_$invocation, metadata);
  }

  bool operator ==(dynamic other) {
    List<Object> arguments = [];
    arguments.add(other);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation = Invocation.method(#==, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);

    return _handle(_$invocation, metadata);
  }

  String toString() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toString, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();

    return _handle(_$invocation, metadata);
  }

  dynamic noSuchMethod(Invocation invocation) {
    List<Object> arguments = [];
    arguments.add(invocation);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#noSuchMethod, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(pragma('vm:entry-point'));

    return _handle(_$invocation, metadata);
  }

  InvocationHandlerFunction _handle;
  _$TestClassProxy(this._handle) : super();

  num get aField {
    Invocation invocation = Invocation.getter(#aField);

    InvocationMetadata metadata = new InvocationMetadata();

    return _handle(invocation, metadata);
  }

  num get aGetter {
    Invocation invocation = Invocation.getter(#aGetter);

    InvocationMetadata metadata = new InvocationMetadata();

    return _handle(invocation, metadata);
  }

  set aSetter(num arg) {
    Invocation invocation = Invocation.setter(#aSetter, arg);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);

    _handle(invocation, metadata);
  }

  int get hashCode {
    Invocation invocation = Invocation.getter(#hashCode);

    InvocationMetadata metadata = new InvocationMetadata();

    return _handle(invocation, metadata);
  }

  Type get runtimeType {
    Invocation invocation = Invocation.getter(#runtimeType);

    InvocationMetadata metadata = new InvocationMetadata();

    return _handle(invocation, metadata);
  }
}
