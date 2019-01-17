// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logging_class.dart';

// **************************************************************************
// InvokerGenerator
// **************************************************************************

class _$LoggingClassInvoker {
  static dynamic invoke(Invocation invocation, LoggingClass target) {
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
    if (invocation.isMethod && #basicNoProxyMethod == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.basicNoProxyMethod();
    }
    if (invocation.isMethod && #basicNoProxyMethod2 == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.basicNoProxyMethod2();
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
    if (invocation.isSetter && #aSetter == invocation.memberName) {
      target.aSetter = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #aField == invocation.memberName) {
      return target.aField;
    }
    if (invocation.isSetter && #aField == invocation.memberName) {
      target.aField = invocation.positionalArguments[0];
      return null;
    }
    if (invocation.isGetter && #hashCode == invocation.memberName) {
      return target.hashCode;
    }
    if (invocation.isGetter && #runtimeType == invocation.memberName) {
      return target.runtimeType;
    }
    if (invocation.isSetter && #aField == invocation.memberName) {
      target.aField = invocation.positionalArguments[0];
      return null;
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

class _$AsyncLoggingClassInvoker {
  static dynamic invoke(Invocation invocation, AsyncLoggingClass target) {
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
