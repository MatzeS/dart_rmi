// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serialize_parameters_test.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

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

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

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
    if (invocation.isMethod && #provideRemote == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.provideRemote(
        positionalArguments[0],
      );
    }
  }
}

// **************************************************************************
// ProxyGenerator
// **************************************************************************

class _$TargetClassProxy implements TargetClass {
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

  Object invoke(Invocation invocation) {
    List<Object> arguments = [];
    arguments.add(invocation);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#invoke, arguments, namedArguments);

    return _handle(_$invocation);
  }

  Provision provideRemote(Context context) {
    List<Object> arguments = [];
    arguments.add(context);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#provideRemote, arguments, namedArguments);

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
  _$TargetClassProxy(this._handle) : super();

  Future<SomeParameter> get aGetter async {
    Invocation invocation = Invocation.getter(#aGetter);

    return await _handle(invocation);
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

  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor('TargetClass', getRemote);
  }

  static TargetClass getRemote(Context context, String uuid) {
    _registerSerializers();
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$TargetClassProxy(handler.handle);
  }

  static Provision provideRemote(Context context, TargetClass target) {
    _registerSerializers();
    _registerStubConstructors(context);
    return rmiProvideRemote(context, target);
  }
}
