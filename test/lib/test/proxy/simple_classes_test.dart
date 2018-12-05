import 'package:test/test.dart';

import 'package:rmi_tests/proxy/classes.dart';
import 'package:proxy/proxy.dart';

class RecordingHandler extends ProxyHandler {
  List<Invocation> invocations = [];
  @override
  Object handle(Invocation invocation) {
    invocations.add(invocation);
  }
}

class ReturnValueHandler extends ProxyHandler {
  List<Invocation> invocations = [];
  @override
  Object handle(Invocation invocation) {
    invocations.add(invocation);
    return 123456789;
  }
}

class ExceptionHandler extends ProxyHandler {
  List<Invocation> invocations = [];
  Exception get thrownException => new Exception("well this is a exception");

  @override
  Object handle(Invocation invocation) {
    invocations.add(invocation);
    throw thrownException;
  }
}

void main() {
  TestClass testObject;

  group('method argument tests', () {
    RecordingHandler handler;
    setUp(() {
      handler = new RecordingHandler();
      testObject = TestClass.proxy(handler);
    });
    test('TestClass.simpleMethod generation', () {
      testObject.simpleMethod();

      expect(handler.invocations.length, 1);
      expect(handler.invocations.first != null, true);
      expect(handler.invocations.first.isMethod, true);
      expect(handler.invocations.first.memberName, #simpleMethod);
      expect(handler.invocations.first.positionalArguments.length, 0);
    });

    test('TestClass single argument passing', () {
      testObject.methodWithArg(123456789);

      expect(handler.invocations.first.namedArguments.isEmpty, true);
      expect(handler.invocations.first.positionalArguments.length, 1);
      expect(handler.invocations.first.positionalArguments.first, 123456789);
    });

    test('TestClass two arguments passing', () {
      testObject.methodWithArgs(123456789, 'asdf');

      expect(handler.invocations.first.positionalArguments.length, 2);
      expect(handler.invocations.first.positionalArguments[0], 123456789);
      expect(handler.invocations.first.positionalArguments[1], 'asdf');
    });

    test('TestClass one positional arg empty', () {
      testObject.methodWithPosArg();

      expect(handler.invocations.first.namedArguments.isEmpty, true);
      expect(handler.invocations.first.positionalArguments.length, 1);
      expect(handler.invocations.first.positionalArguments.first, null);
    });
    test('TestClass one positional arg set', () {
      testObject.methodWithPosArg(123456789);

      expect(handler.invocations.first.positionalArguments.length, 1);
      expect(handler.invocations.first.positionalArguments.first, 123456789);
    });

    test('TestClass two positional arg both empty', () {
      testObject.methodWithPosArgs();

      expect(handler.invocations.first.positionalArguments.length, 2);
      expect(handler.invocations.first.positionalArguments[0], null);
      expect(handler.invocations.first.positionalArguments[1], null);
    });

    test('TestClass two positional arg one empty one set', () {
      testObject.methodWithPosArgs(123456789);

      expect(handler.invocations.first.positionalArguments.length, 2);
      expect(handler.invocations.first.positionalArguments[0], 123456789);
      expect(handler.invocations.first.positionalArguments[1], null);
    });

    test('TestClass two positional arg both set', () {
      testObject.methodWithPosArgs(123456789, 'asdf');

      expect(handler.invocations.first.positionalArguments.length, 2);
      expect(handler.invocations.first.positionalArguments[0], 123456789);
      expect(handler.invocations.first.positionalArguments[1], 'asdf');
    });

    test('TestClass one named arg empty', () {
      testObject.methodWithNamedArg();

      expect(handler.invocations.first.positionalArguments.isEmpty, true);
      expect(handler.invocations.first.namedArguments.length, 1);
      expect(handler.invocations.first.namedArguments['namedArg'], null);
    });

    test('TestClass one named arg set', () {
      testObject.methodWithNamedArg(namedArg: 1234);

      expect(handler.invocations.first.positionalArguments.isEmpty, true);
      expect(handler.invocations.first.namedArguments.length, 1);
      expect(handler.invocations.first.namedArguments[#namedArg], 1234);
    });

    test('TestClass tow named arg both empty', () {
      testObject.methodWithNamedArgs();

      expect(handler.invocations.first.positionalArguments.isEmpty, true);
      expect(handler.invocations.first.namedArguments.length, 2);
      expect(handler.invocations.first.namedArguments[#namedArg], null);
      expect(handler.invocations.first.namedArguments[#namedArg2], null);
    });

    test('TestClass tow named arg only first set', () {
      testObject.methodWithNamedArgs(namedArg: 1234);

      expect(handler.invocations.first.positionalArguments.isEmpty, true);
      expect(handler.invocations.first.namedArguments.length, 2);
      expect(handler.invocations.first.namedArguments[#namedArg], 1234);
      expect(handler.invocations.first.namedArguments[#namedArg2], null);
    });

    test('TestClass tow named arg only second set', () {
      testObject.methodWithNamedArgs(namedArg2: 'asdf');

      expect(handler.invocations.first.positionalArguments.isEmpty, true);
      expect(handler.invocations.first.namedArguments.length, 2);
      expect(handler.invocations.first.namedArguments[#namedArg], null);
      expect(handler.invocations.first.namedArguments[#namedArg2], 'asdf');
    });

    test('TestClass tow named arg both set', () {
      testObject.methodWithNamedArgs(namedArg: 1234, namedArg2: 'asdf');

      expect(handler.invocations.first.positionalArguments.isEmpty, true);
      expect(handler.invocations.first.namedArguments.length, 2);
      expect(handler.invocations.first.namedArguments[#namedArg], 1234);
      expect(handler.invocations.first.namedArguments[#namedArg2], 'asdf');
    });
  });

  group('return value tests', () {
    ReturnValueHandler handler;
    setUp(() {
      handler = new ReturnValueHandler();
      testObject = TestClass.proxy(handler);
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
      expect(returned, 123456789);
    });
  });

  group('getter /', () {
    ReturnValueHandler handler;
    setUp(() {
      handler = new ReturnValueHandler();
      testObject = TestClass.proxy(handler);
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
      expect(returned, 123456789);
    });
  });

  group('setter /', () {
    RecordingHandler handler;
    setUp(() {
      handler = new RecordingHandler();
      testObject = TestClass.proxy(handler);
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
      testObject.aSetter = 123456789;

      expect(handler.invocations.first.positionalArguments.first, 123456789);
    });
  });

  group('exception tests', () {
    ExceptionHandler handler;
    setUp(() {
      handler = new ExceptionHandler();
      testObject = TestClass.proxy(handler);
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
      bool thrown = false;
      try {
        testObject.simpleMethod();
      } on Exception catch (e) {
        thrown = true;
      }
      expect(thrown, true);
    });
  });
}
