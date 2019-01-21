import 'package:rmi/proxy.dart';

class RecordingHandler {
  List<Invocation> invocations = [];

  Object handle(Invocation invocation, InvocationMetadata meta) {
    invocations.add(invocation);
    return null;
  }
}

class ReturnValueHandler {
  Object returnValue;
  ReturnValueHandler(this.returnValue);
  List<Invocation> invocations = [];

  Object handle(Invocation invocation, InvocationMetadata meta) {
    if (invocation.memberName == #noSuchMethod) return null;

    invocations.add(invocation);
    return returnValue;
  }
}

class ExceptionHandler {
  List<Invocation> invocations = [];
  Exception toThrow;
  ExceptionHandler(this.toThrow);

  Object handle(Invocation invocation, InvocationMetadata meta) {
    invocations.add(invocation);
    throw toThrow;
  }
}
