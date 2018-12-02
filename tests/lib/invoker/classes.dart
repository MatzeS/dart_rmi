import 'package:invoker/invoker.dart';

part 'classes.g.dart';

class InvokerTestClass implements Invocable {
  @override
  invoke(Invocation invocation) =>
      _$InvokerTestClassInvoker.invoke(invocation, this);
}
