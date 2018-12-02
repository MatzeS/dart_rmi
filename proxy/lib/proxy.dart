library proxy;

/// Annotate a class with this to generate a proxy implementation
///
/// Add a factory redirecting to the generated proxy, this also takes the invocation handler
/// TODO write example here
class Proxy {
  const Proxy();
}

abstract class ProxyHandler {
  Object handle(Invocation invocation);
}
