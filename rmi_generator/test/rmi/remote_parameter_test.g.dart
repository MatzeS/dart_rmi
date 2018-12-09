// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_parameter_test.dart';

// **************************************************************************
// InvokerGenerator
// **************************************************************************

class _$ASubParameterInvoker {
  static dynamic invoke(Invocation invocation, ASubParameter target) {
    if (invocation.isGetter && #triggered == invocation.memberName) {
      return target.triggered;
    }
    if (invocation.isSetter && #triggered == invocation.memberName) {
      target.triggered = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #aField == invocation.memberName) {
      return target.aField;
    }
    if (invocation.isSetter && #aField == invocation.memberName) {
      target.aField = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #someStringGetter == invocation.memberName) {
      return target.someStringGetter;
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

class _$AParameterInvoker {
  static dynamic invoke(Invocation invocation, AParameter target) {
    if (invocation.isGetter && #value == invocation.memberName) {
      return target.value;
    }
    if (invocation.isSetter && #value == invocation.memberName) {
      target.value = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #triggered == invocation.memberName) {
      return target.triggered;
    }
    if (invocation.isSetter && #triggered == invocation.memberName) {
      target.triggered = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #sub == invocation.memberName) {
      return target.sub;
    }
    if (invocation.isSetter && #sub == invocation.memberName) {
      target.sub = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #getSub == invocation.memberName) {
      return target.getSub;
    }
    if (invocation.isMethod && #parameterMethod == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.parameterMethod();
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

class _$TargetClassInvoker {
  static dynamic invoke(Invocation invocation, TargetClass target) {
    if (invocation.isMethod && #someMethod == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.someMethod(
        positionalArguments[0],
      );
    }
    if (invocation.isMethod && #subElementCheck == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.subElementCheck(
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

class _$ASubParameterProxy implements ASubParameter {
  InvocationHandlerFunction _handle;
  _$ASubParameterProxy(this._handle) : super();

  bool get triggered {
    Invocation invocation = Invocation.getter(#triggered);

    return _handle(invocation);
  }

  set triggered(bool _triggered) {
    Invocation invocation = Invocation.setter(#triggered, _triggered);

    _handle(invocation);
  }

  String get aField {
    Invocation invocation = Invocation.getter(#aField);

    return _handle(invocation);
  }

  set aField(String _aField) {
    Invocation invocation = Invocation.setter(#aField, _aField);

    _handle(invocation);
  }

  Future<String> get someStringGetter async {
    Invocation invocation = Invocation.getter(#someStringGetter);

    return await _handle(invocation);
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

  int get hashCode {
    Invocation invocation = Invocation.getter(#hashCode);

    return _handle(invocation);
  }

  Type get runtimeType {
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
}

class _$AParameterProxy implements AParameter {
  InvocationHandlerFunction _handle;
  _$AParameterProxy(this._handle) : super();

  num get value {
    Invocation invocation = Invocation.getter(#value);

    return _handle(invocation);
  }

  set value(num _value) {
    Invocation invocation = Invocation.setter(#value, _value);

    _handle(invocation);
  }

  bool get triggered {
    Invocation invocation = Invocation.getter(#triggered);

    return _handle(invocation);
  }

  set triggered(bool _triggered) {
    Invocation invocation = Invocation.setter(#triggered, _triggered);

    _handle(invocation);
  }

  ASubParameter get sub {
    Invocation invocation = Invocation.getter(#sub);

    return _handle(invocation);
  }

  set sub(ASubParameter _sub) {
    Invocation invocation = Invocation.setter(#sub, _sub);

    _handle(invocation);
  }

  Future<ASubParameter> get getSub async {
    Invocation invocation = Invocation.getter(#getSub);

    return await _handle(invocation);
  }

  Future<num> parameterMethod() async {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#parameterMethod, arguments, namedArguments);

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

  int get hashCode {
    Invocation invocation = Invocation.getter(#hashCode);

    return _handle(invocation);
  }

  Type get runtimeType {
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
}

class _$TargetClassProxy implements TargetClass {
  InvocationHandlerFunction _handle;
  _$TargetClassProxy(this._handle) : super();

  Future<num> someMethod(AParameter parameter) async {
    List<Object> arguments = [];
    arguments.add(parameter);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#someMethod, arguments, namedArguments);

    return await _handle(_$invocation);
  }

  Future<String> subElementCheck(AParameter parameter) async {
    List<Object> arguments = [];
    arguments.add(parameter);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#subElementCheck, arguments, namedArguments);

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

  int get hashCode {
    Invocation invocation = Invocation.getter(#hashCode);

    return _handle(invocation);
  }

  Type get runtimeType {
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
}

// **************************************************************************
// RmiGenerator
// **************************************************************************

class _$ASubParameterRmi {
  static bool _registered = false;
  static void _registerSerializers() {
    if (_registered) return;
    _registered = true;

    rmiRegisterSerializers([]);
  }

  static void _registerStubConstructors(Context context) {}
  static ASubParameter getRemote(Context context, String uuid) {
    _registerSerializers();
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$ASubParameterProxy(handler.handle);
  }

  static Provision provideRemote(Context context, ASubParameter target) {
    _registerSerializers();
    _registerStubConstructors(context);
    return rmiProvideRemote(context, target);
  }
}

class _$AParameterRmi {
  static bool _registered = false;
  static void _registerSerializers() {
    if (_registered) return;
    _registered = true;

    rmiRegisterSerializers([]);
  }

  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor(
        'ASubParameter', _$ASubParameterRmi.getRemote);
  }

  static AParameter getRemote(Context context, String uuid) {
    _registerSerializers();
    _registerStubConstructors(context);
    RmiProxyHandler handler = RmiProxyHandler(context, uuid);
    return _$AParameterProxy(handler.handle);
  }

  static Provision provideRemote(Context context, AParameter target) {
    _registerSerializers();
    _registerStubConstructors(context);
    return rmiProvideRemote(context, target);
  }
}

class _$TargetClassRmi {
  static bool _registered = false;
  static void _registerSerializers() {
    if (_registered) return;
    _registered = true;

    rmiRegisterSerializers([]);
  }

  static void _registerStubConstructors(Context context) {
    context.registerRemoteStubConstructor(
        'AParameter', _$AParameterRmi.getRemote);
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
