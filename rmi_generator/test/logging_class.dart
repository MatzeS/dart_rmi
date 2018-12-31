import 'basic_class.dart';
import 'package:rmi/invoker.dart';

part 'logging_class.g.dart';

class LoggingClass implements BasicClass, Invocable {
  @override
  Object invoke(Invocation invocation) =>
      _$LoggingClassInvoker.invoke(invocation, this);

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
    return -1;
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

  operator <(Object other) {
    _log(#<);
    _arg(other);
  }
}
