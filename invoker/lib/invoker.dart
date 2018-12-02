library invoker;

/// Implement this class with this to generate an invoker implementation
///
/// TODO write example here
abstract class Invocable {
  Object invoke(Invocation invocation);
}
