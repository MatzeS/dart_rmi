// GENERATED CODE - DO NOT MODIFY BY HAND

part of remote_method_invocation;

// **************************************************************************
// InvokerGenerator
// **************************************************************************

class _$RmiTargetInvoker {
  static dynamic invoke(Invocation invocation, RmiTarget target) {}
}

// **************************************************************************
// ProxyGenerator
// **************************************************************************

class _$RmiTargetProxy implements RmiTarget {
  InvocationHandlerFunction _handle;

  _$RmiTargetProxy(this._handle) : super();

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
}
