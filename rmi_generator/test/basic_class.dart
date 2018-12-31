const int significantNumber = 123456789;
const String significantString = 'asdf';

class BasicClass {
  void simpleMethod() {}
  void methodWithArg(num numArg) {}
  void methodWithArgs(num numArg, String second) {}
  void methodWithNamedArg({num namedArg}) {}
  void methodWithNamedArgs({num namedArg, String namedArg2}) {}
  void methodWithPosArg([num arg]) {}
  void methodWithPosArgs([num arg1, String arg2]) {}
  void methodWithMixedPositional(num required, [num positional]) {}
  void methodWithMixedNamed(num required, {num named}) {}
  num methodWithReturn() => -1;

  num get aGetter => -1;

  set aSetter(num arg) {}

  num aField;

  operator <(Object other) {}
}
