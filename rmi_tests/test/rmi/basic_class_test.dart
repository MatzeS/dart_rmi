import 'package:test/test.dart';
import '../logging_class.dart';
import 'dart:async';
import 'package:rmi/rmi.dart';
import '../bound_context.dart';
part 'basic_class_test.g.dart';

class TestClass extends AsyncLoggingClass implements RmiTarget {
  Provision provideRemote(Context context) =>
      _$TestClassRmi.provideRemote(context, this);

  static TestClass getRemote(Context context, String uuid) =>
      _$TestClassRmi.getRemote(context, uuid);

  @override
  Object invoke(Invocation invocation) =>
      _$TestClassInvoker.invoke(invocation, this);

  Stream<num> returnStream;

  @override
  Stream<num> someGenerator() {
    super.someGenerator().listen(
        (x) {}); // without listen, the super generator method is actually not executed
    return returnStream;
  }
}

main() {
  TestClass target;
  TestClass testObject;
  setUp(() {
    target = new TestClass();
    var contexts = createBoundContexts();
    var provision = target.provideRemote(contexts.item1);
    testObject = TestClass.getRemote(contexts.item2, provision.uuid);
  });

  group('general', () {
    test('simple method call', () async {
      await testObject.simpleMethod();
      expect(target.triggeredOnce(#simpleMethod), true);
      await testObject.simpleMethod();
      expect(target.triggered(#simpleMethod), 2);
    });
  });
  group('arguments', () {
    test('single arg', () async {
      await testObject.methodWithArg(significantNumber);

      expect(target.triggeredOnce(#methodWithArg), true);
      expect(target.arguments.length, 1);
      expect(target.arguments.first, significantNumber);
    });
    test('two args', () async {
      await testObject.methodWithArgs(significantNumber, significantString);

      expect(target.triggeredOnce(#methodWithArgs), true);
      expect(target.arguments.length, 2);
      expect(target.arguments[0], significantNumber);
      expect(target.arguments[1], significantString);
    });
  });
  group('named arguments', () {
    test('single named arg', () async {
      await testObject.methodWithNamedArg(namedArg: significantNumber);

      expect(target.triggeredOnce(#methodWithNamedArg), true);
      expect(target.arguments.length, 1);
      expect(target.arguments[0], significantNumber);
    });
    test('two named args', () async {
      await testObject.methodWithNamedArgs(
          namedArg: significantNumber, namedArg2: significantString);

      expect(target.triggeredOnce(#methodWithNamedArgs), true);
      expect(target.arguments.length, 2);
      expect(target.arguments[0], significantNumber);
      expect(target.arguments[1], significantString);
    });
    test('one required, one optional (not set)', () async {
      await testObject.methodWithMixedNamed(significantNumber);

      expect(target.triggeredOnce(#methodWithMixedNamed), true);
      expect(target.arguments.length, 2);
      expect(target.arguments[0], significantNumber);
      expect(target.arguments[1], null);
    });
    test('one required, one optional (set)', () async {
      await testObject.methodWithMixedNamed(significantNumber,
          named: significantNumber + 1);

      expect(target.triggeredOnce(#methodWithMixedNamed), true);
      expect(target.arguments.length, 2);
      expect(target.arguments[0], significantNumber);
      expect(target.arguments[1], significantNumber + 1);
    });
  });
  group('positional optional arguments', () {
    test('one positional arg', () async {
      await testObject.methodWithPosArg(significantNumber);

      expect(target.triggeredOnce(#methodWithPosArg), true);
      expect(target.arguments.length, 1);
      expect(target.arguments[0], significantNumber);
    });
    test('two positional args', () async {
      await testObject.methodWithPosArgs(significantNumber, significantString);

      expect(target.triggeredOnce(#methodWithPosArgs), true);
      expect(target.arguments.length, 2);
      expect(target.arguments[0], significantNumber);
      expect(target.arguments[1], significantString);
    });
    test('one required, one optional (not set)', () async {
      await testObject.methodWithMixedPositional(significantNumber);

      expect(target.triggeredOnce(#methodWithMixedPositional), true);
      expect(target.arguments.length, 2);
      expect(target.arguments[0], significantNumber);
      expect(target.arguments[1], null);
    });
    test('one required, one optional (set)', () async {
      await testObject.methodWithMixedPositional(
          significantNumber, significantNumber + 1);

      expect(target.triggeredOnce(#methodWithMixedPositional), true);
      expect(target.arguments.length, 2);
      expect(target.arguments[0], significantNumber);
      expect(target.arguments[1], significantNumber + 1);
    });
  });
  group('accessor', () {
    test('getter', () async {
      num val = await testObject.aGetter;

      expect(target.triggeredOnce(#aGetter), true);
      expect(target.arguments.length, 0);
      expect(val, significantNumber);
    });
  });

  group('operators', () {
    test('<', () async {
      await (testObject < significantNumber);
      expect(target.triggeredOnce(#<), true);
      expect(target.arguments.length, 1);
      expect(target.arguments[0], significantNumber);
    });

    test('[]', () async {
      await (testObject[significantNumber]);
      expect(target.triggeredOnce(#[]), true);
      expect(target.arguments.length, 1);
      expect(target.arguments[0], significantNumber);
    });
    test('[]=', () async {
      await (testObject[significantNumber] = significantString);
      expect(target.triggeredOnce(#[]=), true);
      expect(target.arguments.length, 2);
      expect(target.arguments[0], significantNumber);
      expect(target.arguments[1], significantString);
    });
  });
  group('generator', () {
    test('invocation', () async {
      // TODO rename generator to stream
      testObject.someGenerator();
      await Future.delayed(Duration(seconds: 1));
      expect(target.triggeredOnce(#someGenerator), true);
    });
    test('value passing', () async {
      var sc = new StreamController<num>();

      target.returnStream = sc.stream;

      var sink = sc.sink;
      var stream = testObject.someGenerator();

      Completer<void> triggered = new Completer<void>();
      stream.listen((e) {
        expect(e, 1);
        triggered.complete();
      });
      sink.add(1);
      await triggered.future;
    });
  });
}
