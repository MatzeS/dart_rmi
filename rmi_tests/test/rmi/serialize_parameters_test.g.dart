// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serialize_parameters_test.dart';

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
// JsonSerializableGenerator
// **************************************************************************

SomeParameter _$SomeParameterFromJson(Map<String, dynamic> json) {
  return SomeParameter(wrapped: json['wrapped'] as num);
}

Map<String, dynamic> _$SomeParameterToJson(SomeParameter instance) =>
    <String, dynamic>{
      'wrapped': instance.wrapped,
      'json_serializable.className':
          "asset:rmi_tests/test/rmi/serialize_parameters_test.dart#SomeParameter",
    };

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

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);

    await _handle(_$invocation, metadata);
  }

  Future<num> methodWithReturnValue(SomeParameter parameter) async {
    List<Object> arguments = [];
    arguments.add(parameter);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#methodWithReturnValue, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);

    return await _handle(_$invocation, metadata);
  }

  Object invoke(Invocation invocation) {
    List<Object> arguments = [];
    arguments.add(invocation);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#invoke, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.elementMetadata.add(override);

    return _handle(_$invocation, metadata);
  }

  Provision provideRemote(Context context) {
    List<Object> arguments = [];
    arguments.add(context);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#provideRemote, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);

    return _handle(_$invocation, metadata);
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
  _$TargetClassProxy(this._handle) : super();

  Future<SomeParameter> get aGetter async {
    Invocation invocation = Invocation.getter(#aGetter);

    InvocationMetadata metadata = new InvocationMetadata();

    return await _handle(invocation, metadata);
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

// **************************************************************************
// RmiGenerator
// **************************************************************************

class _$TargetClassRmi {
  static void _registerSerializers(Context context) {
    context.registerDeserializer(
        "asset:rmi_tests/test/rmi/serialize_parameters_test.dart#SomeParameter",
        (d) => SomeParameter.fromJson(d));
  }

  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor(
        'asset:rmi_tests/test/rmi/serialize_parameters_test.dart#TargetClass',
        getRemote);
  }

  static TargetClass getRemote(Context context, String uuid) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$TargetClassProxy(handler.handle);
  }

  static Provision provideRemote(Context context, TargetClass target) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    return rmiProvideRemote(context, target,
        'asset:rmi_tests/test/rmi/serialize_parameters_test.dart#TargetClass');
  }
}
