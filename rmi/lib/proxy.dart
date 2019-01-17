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

class NoProxy {
  final List<Symbol> methods;
  const NoProxy([this.methods]);
}

/// Provide this function to handle the invocation
typedef Object InvocationHandlerFunction(
    Invocation invocation, InvocationMetadata meta);

//TODO namedarguments
class InvocationMetadata {
  List<Object> elementMetadata = [];
  List<List<Object>> positionalArgumentMetadata = [];
  Map<Symbol, List<Object>> namedArgumentMetadata = {};
}
