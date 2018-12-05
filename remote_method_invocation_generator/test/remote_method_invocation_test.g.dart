// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_method_invocation_test.dart';

// **************************************************************************
// InvokerGenerator
// **************************************************************************

class _$TargetClassInvoker {
  static invoke(Invocation invocation, TargetClass target) {
    if ( // check if invocation is applicable
        #someMethod == invocation.memberName) {
      //method call
      if (invocation.positionalArguments.length == 0) {
        return target.someMethod();
      }
    }
  }
}

// **************************************************************************
// ProxyGenerator
// **************************************************************************

class _$TargetClassProxy implements TargetClass {
  ProxyHandler _handler;

  _$TargetClassProxy(this._handler) : super();

  Object invoke(Invocation invocation) {
    List<Object> arguments = [];
    arguments.add(invocation);
    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#invoke, arguments, namedArguments);

    return _handler.handle(_$invocation);
  }

  void someMethod() {
    List<Object> arguments = [];

    Map<Symbol, Object> namedArguments = {};

    Invocation _$invocation =
        Invocation.method(#someMethod, arguments, namedArguments);

    _handler.handle(_$invocation);
  }
}

// **************************************************************************
// RpcGenerator
// **************************************************************************

class _$TargetClassRpc {
  static TargetClass getRemote(Connection connection) {
    ProxyHandler handler = RpcProxyHandler(connection);
    return _$TargetClassProxy(handler);
  }
}
