// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serialize_parameters_test.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals

Serializer<SomeParameter> _$someParameterSerializer =
    new _$SomeParameterSerializer();

class _$SomeParameterSerializer implements StructuredSerializer<SomeParameter> {
  @override
  final Iterable<Type> types = const [SomeParameter, _$SomeParameter];
  @override
  final String wireName = 'SomeParameter';

  @override
  Iterable serialize(Serializers serializers, SomeParameter object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'wrapped',
      serializers.serialize(object.wrapped, specifiedType: const FullType(num)),
    ];

    return result;
  }

  @override
  SomeParameter deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SomeParameterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'wrapped':
          result.wrapped = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
      }
    }

    return result.build();
  }
}

class _$SomeParameter extends SomeParameter {
  @override
  final num wrapped;

  factory _$SomeParameter([void updates(SomeParameterBuilder b)]) =>
      (new SomeParameterBuilder()..update(updates)).build();

  _$SomeParameter._({this.wrapped}) : super._() {
    if (wrapped == null) {
      throw new BuiltValueNullFieldError('SomeParameter', 'wrapped');
    }
  }

  @override
  SomeParameter rebuild(void updates(SomeParameterBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SomeParameterBuilder toBuilder() => new SomeParameterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SomeParameter && wrapped == other.wrapped;
  }

  @override
  int get hashCode {
    return $jf($jc(0, wrapped.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SomeParameter')
          ..add('wrapped', wrapped))
        .toString();
  }
}

class SomeParameterBuilder
    implements Builder<SomeParameter, SomeParameterBuilder> {
  _$SomeParameter _$v;

  num _wrapped;
  num get wrapped => _$this._wrapped;
  set wrapped(num wrapped) => _$this._wrapped = wrapped;

  SomeParameterBuilder();

  SomeParameterBuilder get _$this {
    if (_$v != null) {
      _wrapped = _$v.wrapped;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SomeParameter other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SomeParameter;
  }

  @override
  void update(void updates(SomeParameterBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SomeParameter build() {
    final _$result = _$v ?? new _$SomeParameter._(wrapped: wrapped);
    replace(_$result);
    return _$result;
  }
}

// **************************************************************************
// InvokerGenerator
// **************************************************************************

class _$TargetClassInvoker {
  static dynamic invoke(Invocation invocation, TargetClass target) {
    if (invocation.isGetter && #aGetter == invocation.memberName) {
      return target.aGetter;
    }
    if (invocation.isMethod && #someMethod == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.someMethod(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod &&
        #methodWithReturnValue == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.methodWithReturnValue(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #exposeRemote == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.exposeRemote(
        positionalArguments[0],
      );
    }
  }
}

// **************************************************************************
// ProxyGenerator
// **************************************************************************

class _$TargetClassProxy implements TargetClass {
  InvocationHandlerFunction _handle;

  _$TargetClassProxy(this._handle) : super();

  get hashCode {
    Invocation invocation = Invocation.getter(#hashCode);

    return _handle(invocation);
  }

  get runtimeType {
    Invocation invocation = Invocation.getter(#runtimeType);

    return _handle(invocation);
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

  Object invoke(Invocation invocation) {
    List<Object> arguments = [];
    arguments.add(invocation);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#invoke, arguments, namedArguments);

    return _handle(_$invocation);
  }

  get aGetter async {
    Invocation invocation = Invocation.getter(#aGetter);

    return await _handle(invocation);
  }

  void someMethod(SomeParameter parameter) async {
    List<Object> arguments = [];
    arguments.add(parameter);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#someMethod, arguments, namedArguments);

    await _handle(_$invocation);
  }

  Future<num> methodWithReturnValue(SomeParameter parameter) async {
    List<Object> arguments = [];
    arguments.add(parameter);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#methodWithReturnValue, arguments, namedArguments);

    return await _handle(_$invocation);
  }

  void exposeRemote(Connection connection) {
    List<Object> arguments = [];
    arguments.add(connection);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#exposeRemote, arguments, namedArguments);

    _handle(_$invocation);
  }
}

// **************************************************************************
// RmiGenerator
// **************************************************************************

class _$TargetClassRmi {
  static bool _registered = false;
  static void _registerSerializers() {
    if (_registered) return;
    _registered = true;

    rmiRegisterSerializers([SomeParameter.serializer]);
  }

  static TargetClass getRemote(Connection connection) {
    _registerSerializers();
    RmiProxyHandler handler = RmiProxyHandler(connection);
    return _$TargetClassProxy(handler.handle);
  }

  static void exposeRemote(Connection connection, TargetClass target) {
    _registerSerializers();
    return rmiExposeRemote(connection, target);
  }
}
