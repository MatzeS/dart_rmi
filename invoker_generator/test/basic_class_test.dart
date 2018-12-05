import 'package:test/test.dart';
import 'package:invoker/invoker.dart';

import 'package:rmi_test/basic_class.dart' as Test;

part 'basic_class_test.g.dart';

const int significantNumber = 123456789;
const String significantString = 'asdf';

abstract class BasicClass extends Test.BasicClass implements Invocable {}

class LoggingClass implements BasicClass {
  Map<Symbol, int> log = {};
  List<Object> arguments = [];
  void _log(Symbol key) {
    if (log.containsKey(key)) {
      int count = log[key];
      log.remove(key);
      log.putIfAbsent(key, () => count + 1);
    } else {
      log.putIfAbsent(key, () => 1);
    }
  }

  void _arg(Object arg) {
    arguments.add(arg);
  }

  int triggered(Symbol key) => log[key] ?? 0;

  bool triggeredOnce(Symbol key) => triggered(key) == 1;

  void simpleMethod() {
    _log(#simpleMethod);
  }

  void methodWithArg(num numArg) {
    _log(#methodWithArg);
    _arg(numArg);
  }

  void methodWithArgs(num numArg, String second) {
    _log(#methodWithArgs);
    _arg(numArg);
    _arg(second);
  }

  void methodWithNamedArg({num namedArg}) {
    _log(#methodWithNamedArg);
    _arg(namedArg);
  }

  void methodWithNamedArgs({num namedArg, String namedArg2}) {
    _log(#methodWithNamedArgs);
    _arg(namedArg);
    _arg(namedArg2);
  }

  void methodWithPosArg([num arg]) {
    _log(#methodWithPosArg);
    _arg(arg);
  }

  void methodWithPosArgs([num arg1, String arg2]) {
    _log(#methodWithPosArgs);
    _arg(arg1);
    _arg(arg2);
  }

  void methodWithMixedPositional(num required, [num positional]) {
    _log(#methodWithMixedPositional);
    _arg(required);
    _arg(positional);
  }

  void methodWithMixedNamed(num required, {num named}) {
    _log(#methodWithMixedNamed);
    _arg(required);
    _arg(named);
  }

  num methodWithReturn() {
    _log(#methodWithReturn);
  }

  num get aGetter {
    _log(#aGetter);
    return significantNumber;
  }

  set aSetter(num arg) {
    _log(#aSetter);
    _arg(arg);
  }

  num get aField {
    _log(#aField);
    return significantNumber;
  }

  set aField(num aField) {
    _log(#aField);
    _arg(aField);
  }

  @override
  Object invoke(Invocation invocation) =>
      _$LoggingClassInvoker.invoke(invocation, this);
}

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
}
