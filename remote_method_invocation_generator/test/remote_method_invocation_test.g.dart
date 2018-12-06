// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_method_invocation_test.dart';

// **************************************************************************
// InvokerGenerator
// **************************************************************************

class _$TargetClassInvoker {
  static dynamic invoke(Invocation invocation, TargetClass target) {
    if (invocation.isGetter && #value == invocation.memberName) {
      return target.value;
    }
    if (invocation.isSetter && #value == invocation.memberName) {
      target.value = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isMethod && #someMethod == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.someMethod();
    }
    if (invocation.isMethod &&
        #methodWithReturnValue == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.methodWithReturnValue();
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

  get value {
    Invocation invocation = Invocation.getter(#value);

    return _handle(invocation);
  }

  set value(num _value) {
    Invocation invocation = Invocation.setter(#value, _value);

    _handle(invocation);
  }

  void someMethod() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#someMethod, arguments, namedArguments);

    _handle(_$invocation);
  }

  Future<num> methodWithReturnValue() async {
    List<Object> arguments = [];

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

    rmiRegisterSerializers([]);
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
