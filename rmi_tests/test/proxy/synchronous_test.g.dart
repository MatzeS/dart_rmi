// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'synchronous_test.dart';

// **************************************************************************
// ProxyGenerator
// **************************************************************************

class _$TestClassProxy implements TestClass {
  Future<num> someMethod() async {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#someMethod, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  bool operator ==(dynamic other) {
    List<Object> arguments = [];
    arguments.add(other);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation = Invocation.method(#==, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  String toString() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#toString, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

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
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  InvocationHandlerFunction _handle;
  _$TestClassProxy(this._handle) : super();

  Future<num> get someGetter async {
    Invocation invocation = Invocation.getter(#someGetter);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return await _handle(invocation, metadata);
  }

  int get hashCode {
    Invocation invocation = Invocation.getter(#hashCode);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  Type get runtimeType {
    Invocation invocation = Invocation.getter(#runtimeType);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }
}
