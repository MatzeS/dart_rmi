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
    if ( // check if invocation is applicable
        #_log == invocation.memberName) {
      //method call
      if (invocation.positionalArguments.length == 1) {
        return target._log(
          invocation.positionalArguments[0],
        );
      }
    }

    if ( // check if invocation is applicable
        #_arg == invocation.memberName) {
      //method call
      if (invocation.positionalArguments.length == 1) {
        return target._arg(
          invocation.positionalArguments[0],
        );
      }
    }

    if ( // check if invocation is applicable
        #triggered == invocation.memberName) {
      //method call
      if (invocation.positionalArguments.length == 1) {
        return target.triggered(
          invocation.positionalArguments[0],
        );
      }
    }

    if ( // check if invocation is applicable
        #triggeredOnce == invocation.memberName) {
      //method call
      if (invocation.positionalArguments.length == 1) {
        return target.triggeredOnce(
          invocation.positionalArguments[0],
        );
      }
    }

    if ( // check if invocation is applicable
        #simpleMethod == invocation.memberName) {
      //method call
      if (invocation.positionalArguments.length == 0) {
        return target.simpleMethod();
      }
    }

    if ( // check if invocation is applicable
        #methodWithArg == invocation.memberName) {
      //method call
      if (invocation.positionalArguments.length == 1) {
        return target.methodWithArg(
          invocation.positionalArguments[0],
        );
      }
    }

    if ( // check if invocation is applicable
        #methodWithArgs == invocation.memberName) {
      //method call
      if (invocation.positionalArguments.length == 2) {
        return target.methodWithArgs(
          invocation.positionalArguments[0],
          invocation.positionalArguments[1],
        );
      }
    }

    if ( // check if invocation is applicable
        #methodWithNamedArg == invocation.memberName) {
      //method call
      if (invocation.positionalArguments.length == 0) {
        return target.methodWithNamedArg(
            namedArg: invocation.namedArguments[#namedArg]);
      }
    }

    if ( // check if invocation is applicable
        #methodWithNamedArgs == invocation.memberName) {
      //method call
      if (invocation.positionalArguments.length == 0) {
        return target.methodWithNamedArgs(
            namedArg: invocation.namedArguments[#namedArg],
            namedArg2: invocation.namedArguments[#namedArg2]);
      }
    }

    if ( // check if invocation is applicable
        #methodWithPosArg == invocation.memberName) {
      //method call
      if (invocation.positionalArguments.length == 0) {
        return target.methodWithPosArg();
      }

      if (invocation.positionalArguments.length == 1) {
        return target.methodWithPosArg(
          invocation.positionalArguments[0],
        );
      }
    }

    if ( // check if invocation is applicable
        #methodWithPosArgs == invocation.memberName) {
      //method call
      if (invocation.positionalArguments.length == 0) {
        return target.methodWithPosArgs();
      }

      if (invocation.positionalArguments.length == 1) {
        return target.methodWithPosArgs(
          invocation.positionalArguments[0],
        );
      }

      if (invocation.positionalArguments.length == 2) {
        return target.methodWithPosArgs(
          invocation.positionalArguments[0],
          invocation.positionalArguments[1],
        );
      }
    }

    if ( // check if invocation is applicable
        #methodWithMixedPositional == invocation.memberName) {
      //method call
      if (invocation.positionalArguments.length == 1) {
        return target.methodWithMixedPositional(
          invocation.positionalArguments[0],
        );
      }

      if (invocation.positionalArguments.length == 2) {
        return target.methodWithMixedPositional(
          invocation.positionalArguments[0],
          invocation.positionalArguments[1],
        );
      }
    }

    if ( // check if invocation is applicable
        #methodWithMixedNamed == invocation.memberName) {
      //method call
      if (invocation.positionalArguments.length == 1) {
        return target.methodWithMixedNamed(invocation.positionalArguments[0],
            named: invocation.namedArguments[#named]);
      }
    }

    if ( // check if invocation is applicable
        #methodWithReturn == invocation.memberName) {
      //method call
      if (invocation.positionalArguments.length == 0) {
        return target.methodWithReturn();
      }
    }
  }
}
