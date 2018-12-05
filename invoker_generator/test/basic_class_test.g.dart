// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_class_test.dart';

// **************************************************************************
// InvokerGenerator
// **************************************************************************

class _$BasicClassInvoker {
  static invoke(Invocation invocation, BasicClass target) {}
}

class _$LoggingClassInvoker {
  static invoke(Invocation invocation, LoggingClass target) {
    if (#_log == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target._log(
        positionalArguments[0],
      );
    }
    if (#_arg == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target._arg(
        positionalArguments[0],
      );
    }
    if (#triggered == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.triggered(
        positionalArguments[0],
      );
    }
    if (#triggeredOnce == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.triggeredOnce(
        positionalArguments[0],
      );
    }
    if (#simpleMethod == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.simpleMethod();
    }
    if (#methodWithArg == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.methodWithArg(
        positionalArguments[0],
      );
    }
    if (#methodWithArgs == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 2; i++)
        positionalArguments.add(null);

      return target.methodWithArgs(
        positionalArguments[0],
        positionalArguments[1],
      );
    }
    if (#methodWithNamedArg == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.methodWithNamedArg(
          namedArg: invocation.namedArguments[#namedArg]);
    }
    if (#methodWithNamedArgs == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.methodWithNamedArgs(
          namedArg: invocation.namedArguments[#namedArg],
          namedArg2: invocation.namedArguments[#namedArg2]);
    }
    if (#methodWithPosArg == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.methodWithPosArg(
        positionalArguments[0],
      );
    }
    if (#methodWithPosArgs == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 2; i++)
        positionalArguments.add(null);

      return target.methodWithPosArgs(
        positionalArguments[0],
        positionalArguments[1],
      );
    }
    if (#methodWithMixedPositional == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 2; i++)
        positionalArguments.add(null);

      return target.methodWithMixedPositional(
        positionalArguments[0],
        positionalArguments[1],
      );
    }
    if (#methodWithMixedNamed == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 1; i++)
        positionalArguments.add(null);

      return target.methodWithMixedNamed(positionalArguments[0],
          named: invocation.namedArguments[#named]);
    }
    if (#methodWithReturn == invocation.memberName) {
      List<Object> positionalArguments =
          List.from(invocation.positionalArguments);
      for (int i = invocation.positionalArguments.length; i < 0; i++)
        positionalArguments.add(null);

      return target.methodWithReturn();
    }
  }
}
