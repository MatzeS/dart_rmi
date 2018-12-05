library proxy;

/// Annotate or implement this to generate a proxy implementation
///
/// Add a proxy-factory redirecting to the generated code
/// ```
/// class ExampleClass implements Proxy {
///   factory ExampleClass.proxy(InvocationHandlerFunction handler)
///     => _$ExampleClassProxy(handler);
/// }
/// ```
class Proxy {
  const Proxy();
}

/// Provide this function to handle the invocation
typedef Object InvocationHandlerFunction(Invocation invocation);
