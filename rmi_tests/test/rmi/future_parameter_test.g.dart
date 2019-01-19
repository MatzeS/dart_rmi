// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'future_parameter_test.dart';

// **************************************************************************
// InvokerGenerator
// **************************************************************************

class _$TestClassInvoker {
  static dynamic invoke(Invocation invocation, TestClass target) {
    if (invocation.isMethod && #provideRemote == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.provideRemote(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #futureMethod == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.futureMethod(
        (positionalArguments[0] as Future).then((v) => v as String),
      );
    }
    if (invocation.isMethod && #streamMethod == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.streamMethod(positionalArguments[0] != null
          ? ((positionalArguments[0] as Stream).cast())
          : null);
      return 3;
    }
    if (invocation.isGetter && #hashCode == invocation.memberName) {
      return target.hashCode;
    }
    if (invocation.isGetter && #runtimeType == invocation.memberName) {
      return target.runtimeType;
    }
    if (invocation.isMethod && #== == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target == positionalArguments[0];
    }
    if (invocation.isMethod && #toString == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.toString();
    }
    if (invocation.isMethod && #noSuchMethod == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.noSuchMethod(
        positionalArguments[0],
      );
    }
  }
}

// **************************************************************************
// ProxyGenerator
// **************************************************************************

class _$TestClassProxy implements TestClass {
  Provision provideRemote(Context context) {
    List<Object> arguments = [];
    arguments.add(context);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#provideRemote, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
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
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Future<num> futureMethod(Future aParameter) async {
    List<Object> arguments = [];
    arguments.add(aParameter);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#futureMethod, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Future<num> streamMethod(Stream aParameter) async {
    List<Object> arguments = [];
    arguments.add(aParameter);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#streamMethod, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
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

// **************************************************************************
// RmiGenerator
// **************************************************************************

class _$TestClassRmi {
  static void _registerSerializers(Context context) {}
  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor(
        'asset:rmi_tests/test/rmi/future_parameter_test.dart#TestClass',
        getRemote);
  }

  static TestClass getRemote(Context context, String uuid) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$TestClassProxy(handler.handle);
  }

  static Provision provideRemote(Context context, TestClass target) {
    _registerSerializers(context);
    _registerStubConstructors(context);
    return rmiProvideRemote(context, target,
        'asset:rmi_tests/test/rmi/future_parameter_test.dart#TestClass');
  }
}
