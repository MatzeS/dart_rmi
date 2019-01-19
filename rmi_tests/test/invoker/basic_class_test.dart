import 'package:test/test.dart';

import '../basic_class.dart';
import '../logging_class.dart';

void main() {
  LoggingClass testObject;
  setUp(() {
    testObject = new LoggingClass();
  });
  group('general', () {
    test('simple method call', () {
      testObject.invoke(Invocation.method(#simpleMethod, []));
      expect(testObject.triggeredOnce(#simpleMethod), true);
      testObject.invoke(Invocation.method(#simpleMethod, []));
      expect(testObject.triggered(#simpleMethod), 2);
    });
  });
  group('arguments', () {
    test('single arg', () {
      testObject.invoke(Invocation.method(#methodWithArg, [significantNumber]));

      expect(testObject.triggeredOnce(#methodWithArg), true);
      expect(testObject.arguments.length, 1);
      expect(testObject.arguments.first, significantNumber);
    });
    test('two args', () {
      testObject.invoke(Invocation.method(
          #methodWithArgs, [significantNumber, significantString]));

      expect(testObject.triggeredOnce(#methodWithArgs), true);
      expect(testObject.arguments.length, 2);
      expect(testObject.arguments[0], significantNumber);
      expect(testObject.arguments[1], significantString);
    });
  });
  group('named arguments', () {
    test('single named arg', () {
      testObject.invoke(Invocation.method(
          #methodWithNamedArg, [], {#namedArg: significantNumber}));

      expect(testObject.triggeredOnce(#methodWithNamedArg), true);
      expect(testObject.arguments.length, 1);
      expect(testObject.arguments[0], significantNumber);
    });
    test('two named args', () {
      testObject.invoke(Invocation.method(#methodWithNamedArgs, [],
          {#namedArg: significantNumber, #namedArg2: significantString}));

      expect(testObject.triggeredOnce(#methodWithNamedArgs), true);
      expect(testObject.arguments.length, 2);
      expect(testObject.arguments[0], significantNumber);
      expect(testObject.arguments[1], significantString);
    });
    test('one required, one optional (not set)', () {
      testObject.invoke(
          Invocation.method(#methodWithMixedNamed, [significantNumber]));

      expect(testObject.triggeredOnce(#methodWithMixedNamed), true);
      expect(testObject.arguments.length, 2);
      expect(testObject.arguments[0], significantNumber);
      expect(testObject.arguments[1], null);
    });
    test('one required, one optional (set)', () {
      testObject.invoke(Invocation.method(#methodWithMixedNamed,
          [significantNumber], {#named: significantNumber + 1}));

      expect(testObject.triggeredOnce(#methodWithMixedNamed), true);
      expect(testObject.arguments.length, 2);
      expect(testObject.arguments[0], significantNumber);
      expect(testObject.arguments[1], significantNumber + 1);
    });
  });
  group('positional optional arguments', () {
    test('one positional arg', () {
      testObject
          .invoke(Invocation.method(#methodWithPosArg, [significantNumber]));

      expect(testObject.triggeredOnce(#methodWithPosArg), true);
      expect(testObject.arguments.length, 1);
      expect(testObject.arguments[0], significantNumber);
    });
    test('two positional args', () {
      testObject.invoke(Invocation.method(
          #methodWithPosArgs, [significantNumber, significantString]));

      expect(testObject.triggeredOnce(#methodWithPosArgs), true);
      expect(testObject.arguments.length, 2);
      expect(testObject.arguments[0], significantNumber);
      expect(testObject.arguments[1], significantString);
    });
    test('one required, one optional (not set)', () {
      testObject.invoke(
          Invocation.method(#methodWithMixedPositional, [significantNumber]));

      expect(testObject.triggeredOnce(#methodWithMixedPositional), true);
      expect(testObject.arguments.length, 2);
      expect(testObject.arguments[0], significantNumber);
      expect(testObject.arguments[1], null);
    });
    test('one required, one optional (set)', () {
      testObject.invoke(Invocation.method(#methodWithMixedPositional,
          [significantNumber, significantNumber + 1]));

      expect(testObject.triggeredOnce(#methodWithMixedPositional), true);
      expect(testObject.arguments.length, 2);
      expect(testObject.arguments[0], significantNumber);
      expect(testObject.arguments[1], significantNumber + 1);
    });
  });
  group('accessor', () {
    test('getter', () {
      num val = testObject.invoke(Invocation.getter(#aGetter));

      expect(testObject.triggeredOnce(#aGetter), true);
      expect(testObject.arguments.length, 0);
      expect(val, significantNumber);
    });
    test('setter', () {
      testObject.invoke(Invocation.setter(#aSetter, significantNumber));

      expect(testObject.triggeredOnce(#aSetter), true);
      expect(testObject.arguments.length, 1);
      expect(testObject.arguments[0], significantNumber);
    });
  });
  group('field', () {
    test('getter', () {
      num val = testObject.invoke(Invocation.getter(#aField));

      expect(testObject.triggeredOnce(#aField), true);
      expect(testObject.arguments.length, 0);
      expect(val, significantNumber);
    });
    test('setter', () {
      testObject.invoke(Invocation.setter(#aField, significantNumber));

      expect(testObject.triggeredOnce(#aField), true);
      expect(testObject.arguments.length, 1);
      expect(testObject.arguments[0], significantNumber);
    });
  });

  group('operators', () {
    test('<', () {
      testObject.invoke(Invocation.method(#<, [significantNumber]));
      expect(testObject.triggered(#<), 1);
      expect(testObject.arguments.length, 1);
      expect(testObject.arguments[0], significantNumber);
    });

    test('[]', () {
      testObject.invoke(Invocation.method(#[], [significantNumber]));
      expect(testObject.triggered(#[]), 1);
      expect(testObject.arguments.length, 1);
      expect(testObject.arguments[0], significantNumber);
    });
    test('[]=', () {
      testObject.invoke(
          Invocation.method(#[]=, [significantNumber, significantString]));
      expect(testObject.triggered(#[]=), 1);
      expect(testObject.arguments.length, 2);
      expect(testObject.arguments[0], significantNumber);
      expect(testObject.arguments[1], significantString);
    });
  });

  group('generator', () {
    test('generator method', () {
      testObject.invoke(Invocation.method(#someGenerator, []));

      expect(testObject.triggered(#someGenerator), 1);
      expect(testObject.arguments.length, 0);
    });
    test('generator getter', () {
      testObject.invoke(Invocation.getter(#someGetterGenerator));

      expect(testObject.triggered(#someGetterGenerator), 1);
      expect(testObject.arguments.length, 0);
    });
  });
}
