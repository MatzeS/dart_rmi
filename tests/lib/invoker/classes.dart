import 'package:invoker/invoker.dart';

part 'classes.g.dart';

class InvokerTestClass implements Invocable {
  void simpleMethod() {}

  @override
  invoke(Invocation invocation) =>
      _$InvokerTestClassInvoker.invoke(invocation, this);
}
