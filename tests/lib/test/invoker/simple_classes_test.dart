import 'package:test/test.dart';
import '../../proxy/classes.dart';
import 'package:invoker/invoker.dart';

@notInvocable
class LoggingClass implements TestClass {
  Map<String, int> log = {};
  List<Object> arguments = [];

  void _log(String key) {
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

  int triggered(String key) => log[key] ?? 0;

  bool triggeredOnce(String key) => triggered(key) == 1;

  void simpleMethod() {
    _log('simpleMethod');
  }

  void methodWithArg(num numArg) {
    _log('methodWithArg');
    _arg(numArg);
  }

  void methodWithArgs(num numArg, String second) {
    _log('methodWithArgs');
    _arg(numArg);
    _arg(numArg);
  }

  void methodWithNamedArg({num namedArg}) {
    _log('methodWithNamedArg');
    _arg(namedArg);
  }

  void methodWithNamedArgs({num namedArg, String namedArg2}) {
    _log('methodWithNamedArgs');
    _arg(namedArg);
    _arg(namedArg2);
  }

  void methodWithPosArg([num arg]) {
    _log('methodWithPosArg');
    _arg(arg);
  }

  void methodWithPosArgs([num arg1, String arg2]) {
    _log('methodWithPosArgs');
    _arg(arg1);
    _arg(arg2);
  }

  void methodWithMixedPositional(num required, [num positional]) {
    _log('methodWithMixedPositional');
    _arg(required);
    _arg(positional);
  }

  void methodWithMixedRequired(num required, {num named}) {
    _log('methodWithMixedRequired');
    _arg(required);
    _arg(named);
  }

  num methodWithReturn() {
    _log('methodWithReturn');
  }

  num get aGetter {
    _log('aGetter');
  }

  set aSetter(num arg) {
    _log('aSetter');
    _arg(arg);
  }

  num aField; //TODO

  @override
  Object invoke(Invocation invocation) {
    return null; //TODO think about this
  }
}

void main() {
  group('invoker tests', () {
    setUp(() {});
    test('simple method test', () {});
  });
}
