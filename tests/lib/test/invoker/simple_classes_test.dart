import 'package:test/test.dart';
import '../../proxy/classes.dart';
import 'package:invoker/invoker.dart';

part 'simple_classes_test.g.dart';

const int significantNumber = 123456789;
const String significantString = 'asdf';

class LoggingClass implements TestClass {
  Map<Symbol, int> log = {};
  List<Object> arguments = [];
  int get argCount => arguments.where((e) => e != null).toList().length;
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
  }

  set aSetter(num arg) {
    _log(#aSetter);
    _arg(arg);
  }

  num aField; //TODO

  @override
  Object invoke(Invocation invocation) =>
      _$LoggingClassInvoker.invoke(invocation, this);
}

void main() {
  group('invoker tests', () {
    LoggingClass testObject;
    setUp(() {
      testObject = new LoggingClass();
    });
    test('simple method test', () {
      testObject.invoke(Invocation.method(#simpleMethod, []));
      expect(testObject.triggeredOnce(#simpleMethod), true);
      testObject.invoke(Invocation.method(#simpleMethod, []));
      expect(testObject.triggered(#simpleMethod), 2);
    });
    test('single arg test', () {
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

    test('named arg', () {
      testObject.invoke(Invocation.method(
          #methodWithNamedArg, [], {#namedArg: significantNumber}));

      expect(testObject.triggeredOnce(#methodWithNamedArg), true);
      expect(testObject.arguments.length, 1);
      expect(testObject.arguments[0], significantNumber);
    });

    test('named args', () {
      testObject.invoke(Invocation.method(#methodWithNamedArgs, [],
          {#namedArg: significantNumber, #namedArg2: significantString}));

      expect(testObject.triggeredOnce(#methodWithNamedArgs), true);
      expect(testObject.arguments.length, 2);
      expect(testObject.arguments[0], significantNumber);
      expect(testObject.arguments[1], significantString);
    });

    test('pos args', () {
      testObject.invoke(Invocation.method(
          #methodWithPosArgs, [significantNumber, significantString]));

      expect(testObject.triggeredOnce(#methodWithPosArgs), true);
      expect(testObject.arguments.length, 2);
      expect(testObject.arguments[0], significantNumber);
      expect(testObject.arguments[1], significantString);
    });

    test('pos mixed, no optional', () {
      testObject.invoke(
          Invocation.method(#methodWithMixedPositional, [significantNumber]));

      expect(testObject.triggeredOnce(#methodWithMixedPositional), true);
      expect(testObject.argCount, 1);
      expect(testObject.arguments[0], significantNumber);
    });

    test('pos mixed, with optional', () {
      testObject.invoke(Invocation.method(#methodWithMixedPositional,
          [significantNumber, significantNumber + 1]));

      expect(testObject.triggeredOnce(#methodWithMixedPositional), true);
      expect(testObject.arguments.length, 2);
      expect(testObject.arguments[0], significantNumber);
      expect(testObject.arguments[1], significantNumber + 1);
    });

    test('named mixed, no optional', () {
      testObject.invoke(
          Invocation.method(#methodWithMixedNamed, [significantNumber]));

      expect(testObject.triggeredOnce(#methodWithMixedNamed), true);
      expect(testObject.argCount, 1);
      expect(testObject.arguments[0], significantNumber);
    });

    test('named mixed, with optional', () {
      testObject.invoke(Invocation.method(#methodWithMixedNamed,
          [significantNumber], {#named: significantNumber + 1}));

      expect(testObject.triggeredOnce(#methodWithMixedNamed), true);
      expect(testObject.arguments.length, 2);
      expect(testObject.arguments[0], significantNumber);
      expect(testObject.arguments[1], significantNumber + 1);
    });
  });
}
