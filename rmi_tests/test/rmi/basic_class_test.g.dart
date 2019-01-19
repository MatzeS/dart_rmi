// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_class_test.dart';

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
    if (invocation.isMethod && #someGenerator == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.someGenerator();
    }
    if (invocation.isGetter && #returnStream == invocation.memberName) {
      return target.returnStream;
    }
    if (invocation.isSetter && #returnStream == invocation.memberName) {
      target.returnStream = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #log == invocation.memberName) {
      return target.log;
    }
    if (invocation.isSetter && #log == invocation.memberName) {
      target.log = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #arguments == invocation.memberName) {
      return target.arguments;
    }
    if (invocation.isSetter && #arguments == invocation.memberName) {
      target.arguments = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #aGetter == invocation.memberName) {
      return target.aGetter;
    }
    if (invocation.isGetter && #someGetterGenerator == invocation.memberName) {
      return target.someGetterGenerator;
    }
    if (invocation.isGetter && #hashCode == invocation.memberName) {
      return target.hashCode;
    }
    if (invocation.isGetter && #runtimeType == invocation.memberName) {
      return target.runtimeType;
    }
    if (invocation.isMethod && #triggered == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.triggered(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #triggeredOnce == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.triggeredOnce(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #simpleMethod == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.simpleMethod();
    }
    if (invocation.isMethod && #methodWithArg == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.methodWithArg(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #methodWithArgs == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 2; i++)
        positionalArguments.add(null);

      return target.methodWithArgs(
        positionalArguments[0],
        positionalArguments[1],
      );
    }
    if (invocation.isMethod && #methodWithNamedArg == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.methodWithNamedArg(
          namedArg: invocation.namedArguments[#namedArg]);
    }
    if (invocation.isMethod && #methodWithNamedArgs == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.methodWithNamedArgs(
          namedArg: invocation.namedArguments[#namedArg],
          namedArg2: invocation.namedArguments[#namedArg2]);
    }
    if (invocation.isMethod && #methodWithPosArg == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.methodWithPosArg(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #methodWithPosArgs == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 2; i++)
        positionalArguments.add(null);

      return target.methodWithPosArgs(
        positionalArguments[0],
        positionalArguments[1],
      );
    }
    if (invocation.isMethod &&
        #methodWithMixedPositional == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 2; i++)
        positionalArguments.add(null);

      return target.methodWithMixedPositional(
        positionalArguments[0],
        positionalArguments[1],
      );
    }
    if (invocation.isMethod && #methodWithMixedNamed == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.methodWithMixedNamed(positionalArguments[0],
          named: invocation.namedArguments[#named]);
    }
    if (invocation.isMethod && #methodWithReturn == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.methodWithReturn();
    }
    if (invocation.isMethod && #< == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target < positionalArguments[0];
    }
    if (invocation.isMethod && #[] == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      target[positionalArguments[0]];
    }
    if (invocation.isMethod && #[]= == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 2; i++)
        positionalArguments.add(null);

      target[positionalArguments[0]] = positionalArguments[1];
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

  Stream<num> someGenerator() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#someGenerator, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.elementMetadata.add(override);
    metadata.isStream = true;

    return (_handle(_$invocation, metadata) as Stream).cast();
  }

  int triggered(Symbol key) {
    List<Object> arguments = [];
    arguments.add(key);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#triggered, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  bool triggeredOnce(Symbol key) {
    List<Object> arguments = [];
    arguments.add(key);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#triggeredOnce, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return _handle(_$invocation, metadata);
  }

  Future<void> simpleMethod() async {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#simpleMethod, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Future<void> methodWithArg(num numArg) async {
    List<Object> arguments = [];
    arguments.add(numArg);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#methodWithArg, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Future<void> methodWithArgs(num numArg, String second) async {
    List<Object> arguments = [];
    arguments.add(numArg);
    arguments.add(second);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#methodWithArgs, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Future<void> methodWithNamedArg({num namedArg}) async {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};
    namedArguments.putIfAbsent(#namedArg, () => namedArg);
    Invocation _$invocation =
        Invocation.method(#methodWithNamedArg, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.namedArgumentMetadata[#namedArg] = [];
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Future<void> methodWithNamedArgs({num namedArg, String namedArg2}) async {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};
    namedArguments.putIfAbsent(#namedArg, () => namedArg);
    namedArguments.putIfAbsent(#namedArg2, () => namedArg2);
    Invocation _$invocation =
        Invocation.method(#methodWithNamedArgs, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.namedArgumentMetadata[#namedArg] = [];
    metadata.namedArgumentMetadata[#namedArg2] = [];
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Future<void> methodWithPosArg([num arg]) async {
    List<Object> arguments = [];
    arguments.add(arg);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#methodWithPosArg, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Future<void> methodWithPosArgs([num arg1, String arg2]) async {
    List<Object> arguments = [];
    arguments.add(arg1);
    arguments.add(arg2);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#methodWithPosArgs, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Future<void> methodWithMixedPositional(num required, [num positional]) async {
    List<Object> arguments = [];
    arguments.add(required);
    arguments.add(positional);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation = Invocation.method(
        #methodWithMixedPositional, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Future<void> methodWithMixedNamed(num required, {num named}) async {
    List<Object> arguments = [];
    arguments.add(required);
    Map<Symbol, Object> namedArguments = {};
    namedArguments.putIfAbsent(#named, () => named);
    Invocation _$invocation =
        Invocation.method(#methodWithMixedNamed, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.namedArgumentMetadata[#named] = [];
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  Future<num> methodWithReturn() async {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#methodWithReturn, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  dynamic operator <(Object other) async {
    List<Object> arguments = [];
    arguments.add(other);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation = Invocation.method(#<, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  dynamic operator [](Object key) async {
    List<Object> arguments = [];
    arguments.add(key);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation = Invocation.method(#[], arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    return await _handle(_$invocation, metadata);
  }

  void operator []=(Object key, Object value) async {
    List<Object> arguments = [];
    arguments.add(key);
    arguments.add(value);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#[]=, arguments, namedArguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.positionalArgumentMetadata.add([]);
    metadata.positionalArgumentMetadata.add([]);
    metadata.isStream = false;

    await _handle(_$invocation, metadata);
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

  Stream<num> get returnStream {
    Invocation invocation = Invocation.getter(#returnStream);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = true;

    return _handle(invocation, metadata);
  }

  Map<Symbol, int> get log {
    Invocation invocation = Invocation.getter(#log);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  List<Object> get arguments {
    Invocation invocation = Invocation.getter(#arguments);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return _handle(invocation, metadata);
  }

  Future<num> get aGetter async {
    Invocation invocation = Invocation.getter(#aGetter);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = false;

    return await _handle(invocation, metadata);
  }

  Stream<num> get someGetterGenerator {
    Invocation invocation = Invocation.getter(#someGetterGenerator);

    InvocationMetadata metadata = new InvocationMetadata();
    metadata.isStream = true;

    return _handle(invocation, metadata);
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

// **************************************************************************
// RmiGenerator
// **************************************************************************

class _$TestClassRmi {
  static void _registerSerializers(Context context) {}
  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor(
        'asset:rmi_tests/test/rmi/basic_class_test.dart#TestClass', getRemote);
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
        'asset:rmi_tests/test/rmi/basic_class_test.dart#TestClass');
  }
}
