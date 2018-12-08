/// Implement this and delegate [invoke] to the generated code
///
/// Example:
///
/// ```
/// class ExampleClass implements Invocable {
///   @override
///   Object invoke(Invocation invocation) =>
///       _$ExampleClassInvoker.invoke(invocation, this);
/// }
/// ```
abstract class Invocable {
  Object invoke(Invocation invocation);
}

/// Implement or annotate with this when no code should be generated
abstract class NotInvocable {
  const NotInvocable();
}
