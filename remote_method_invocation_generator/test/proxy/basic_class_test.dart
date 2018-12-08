import 'package:test/test.dart';
import 'package:rmi/proxy.dart';
import '../basic_class.dart';

part 'basic_class_test.g.dart';

const num significantNumber = 123456789;
const String significantString = 'asdf';

class RecordingHandler {
  List<Invocation> invocations = [];

  Object handle(Invocation invocation) {
    invocations.add(invocation);
    return null;
  }
}

class ReturnValueHandler {
  Object returnValue;
  ReturnValueHandler(this.returnValue);
  List<Invocation> invocations = [];

  Object handle(Invocation invocation) {
    invocations.add(invocation);
    return returnValue;
  }
}

class ExceptionHandler {
  List<Invocation> invocations = [];
  Exception toThrow;
  ExceptionHandler(this.toThrow);

  Object handle(Invocation invocation) {
    invocations.add(invocation);
    throw toThrow;
  }
}

class TestClass extends BasicClass implements Proxy {
  factory TestClass.proxy(InvocationHandlerFunction handler) =>
      _$TestClassProxy(handler);
}

void main() {
  TestClass testObject;

  group('method argument tests', () {
    RecordingHandler handler;
    setUp(() {
      handler = new RecordingHandler();
      testObject = TestClass.proxy(handler.handle);
    });
    test('simple method', () {
      testObject.simpleMethod();

      expect(handler.invocations.length, 1);
      expect(handler.invocations.first != null, true);
      expect(handler.invocations.first.isMethod, true);
      expect(handler.invocations.first.memberName, #simpleMethod);
      expect(handler.invocations.first.positionalArguments.length, 0);
    });

    test('single argument', () {
      testObject.methodWithArg(significantNumber);

      expect(handler.invocations.first.namedArguments.isEmpty, true);
      expect(handler.invocations.first.positionalArguments.length, 1);
      expect(handler.invocations.first.positionalArguments.first,
          significantNumber);
    });

    test('two arguments', () {
      testObject.methodWithArgs(significantNumber, significantString);

      expect(handler.invocations.first.positionalArguments.length, 2);
      expect(
          handler.invocations.first.positionalArguments[0], significantNumber);
      expect(
          handler.invocations.first.positionalArguments[1], significantString);
    });

    test('one positional argument (not set)', () {
      testObject.methodWithPosArg();

      expect(handler.invocations.first.namedArguments.isEmpty, true);
      expect(handler.invocations.first.positionalArguments.length, 1);
      expect(handler.invocations.first.positionalArguments.first, null);
    });
    test('one positioanl argument (set)', () {
      testObject.methodWithPosArg(significantNumber);

      expect(handler.invocations.first.positionalArguments.length, 1);
      expect(handler.invocations.first.positionalArguments.first,
          significantNumber);
    });

    test('two positional arguments (none set)', () {
      testObject.methodWithPosArgs();

      expect(handler.invocations.first.positionalArguments.length, 2);
      expect(handler.invocations.first.positionalArguments[0], null);
      expect(handler.invocations.first.positionalArguments[1], null);
    });

    test('two positional arguments (one set)', () {
      testObject.methodWithPosArgs(significantNumber);

      expect(handler.invocations.first.positionalArguments.length, 2);
      expect(
          handler.invocations.first.positionalArguments[0], significantNumber);
      expect(handler.invocations.first.positionalArguments[1], null);
    });

    test('two positional arguments (two set)', () {
      testObject.methodWithPosArgs(significantNumber, significantString);

      expect(handler.invocations.first.positionalArguments.length, 2);
      expect(
          handler.invocations.first.positionalArguments[0], significantNumber);
      expect(
          handler.invocations.first.positionalArguments[1], significantString);
    });

    test('one named arguments (not set)', () {
      testObject.methodWithNamedArg();

      expect(handler.invocations.first.positionalArguments.isEmpty, true);
      expect(handler.invocations.first.namedArguments.length, 1);
      expect(handler.invocations.first.namedArguments['namedArg'], null);
    });

    test('one named arguments (set)', () {
      testObject.methodWithNamedArg(namedArg: 1234);

      expect(handler.invocations.first.positionalArguments.isEmpty, true);
      expect(handler.invocations.first.namedArguments.length, 1);
      expect(handler.invocations.first.namedArguments[#namedArg], 1234);
    });

    test('two named arguments (none set)', () {
      testObject.methodWithNamedArgs();

      expect(handler.invocations.first.positionalArguments.isEmpty, true);
      expect(handler.invocations.first.namedArguments.length, 2);
      expect(handler.invocations.first.namedArguments[#namedArg], null);
      expect(handler.invocations.first.namedArguments[#namedArg2], null);
    });

    test('two named arguments (first set)', () {
      testObject.methodWithNamedArgs(namedArg: 1234);

      expect(handler.invocations.first.positionalArguments.isEmpty, true);
      expect(handler.invocations.first.namedArguments.length, 2);
      expect(handler.invocations.first.namedArguments[#namedArg], 1234);
      expect(handler.invocations.first.namedArguments[#namedArg2], null);
    });

    test('two named arguments (second set)', () {
      testObject.methodWithNamedArgs(namedArg2: significantString);

      expect(handler.invocations.first.positionalArguments.isEmpty, true);
      expect(handler.invocations.first.namedArguments.length, 2);
      expect(handler.invocations.first.namedArguments[#namedArg], null);
      expect(handler.invocations.first.namedArguments[#namedArg2],
          significantString);
    });

    test('two named arguments (both set)', () {
      testObject.methodWithNamedArgs(
          namedArg: 1234, namedArg2: significantString);

      expect(handler.invocations.first.positionalArguments.isEmpty, true);
      expect(handler.invocations.first.namedArguments.length, 2);
      expect(handler.invocations.first.namedArguments[#namedArg], 1234);
      expect(handler.invocations.first.namedArguments[#namedArg2],
          significantString);
    });
  });
  group('return value', () {
    ReturnValueHandler handler;
    setUp(() {
      handler = new ReturnValueHandler(significantNumber);
      testObject = TestClass.proxy(handler.handle);
    });
    test('general call test', () {
      testObject.methodWithReturn();

      expect(handler.invocations.length, 1);
      expect(handler.invocations.first != null, true);
      expect(handler.invocations.first.isMethod, true);
      expect(handler.invocations.first.memberName, #methodWithReturn);
      expect(handler.invocations.first.positionalArguments.isEmpty, true);
      expect(handler.invocations.first.namedArguments.isEmpty, true);
    });

    test('correct return value', () {
      var returned = testObject.methodWithReturn();
      expect(returned, significantNumber);
    });
  });

  group('getter', () {
    ReturnValueHandler handler;
    setUp(() {
      handler = new ReturnValueHandler(significantNumber);
      testObject = TestClass.proxy(handler.handle);
    });
    test('general call test', () {
      testObject.aGetter;

      expect(handler.invocations.length, 1);
      expect(handler.invocations.first != null, true);
      expect(handler.invocations.first.isGetter, true);
      expect(handler.invocations.first.memberName, #aGetter);
      expect(handler.invocations.first.positionalArguments.isEmpty, true);
      expect(handler.invocations.first.namedArguments.isEmpty, true);
    });

    test('correct return value', () {
      var returned = testObject.methodWithReturn();
      expect(returned, significantNumber);
    });
  });

  group('setter', () {
    RecordingHandler handler;
    setUp(() {
      handler = new RecordingHandler();
      testObject = TestClass.proxy(handler.handle);
    });
    test('general call test', () {
      testObject.aSetter = 1;

      expect(handler.invocations.length, 1);
      expect(handler.invocations.first != null, true);
      expect(handler.invocations.first.isSetter, true);
      expect(handler.invocations.first.memberName, #aSetter);
      expect(handler.invocations.first.positionalArguments.length, 1);
      expect(handler.invocations.first.namedArguments.isEmpty, true);
    });

    test('arg passing', () {
      testObject.aSetter = significantNumber;

      expect(handler.invocations.first.positionalArguments.first,
          significantNumber);
    });
  });

  group('exception tests', () {
    ExceptionHandler handler;
    Exception exception = new Exception('well this is an exception');
    setUp(() {
      handler = new ExceptionHandler(exception);
      testObject = TestClass.proxy(handler.handle);
    });
    test('general call test', () {
      try {
        testObject.simpleMethod();
      } on Exception {}

      expect(handler.invocations.length, 1);
      expect(handler.invocations.first != null, true);
      expect(handler.invocations.first.isMethod, true);
      expect(handler.invocations.first.memberName, #simpleMethod);
      expect(handler.invocations.first.positionalArguments.isEmpty, true);
      expect(handler.invocations.first.namedArguments.isEmpty, true);
    });

    test('threw excpetion', () {
      expect(new Future(() {
        testObject.simpleMethod();
      }), throwsA(exception));
    });
  });
}
