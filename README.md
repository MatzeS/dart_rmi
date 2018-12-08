# Remote Method Invocation for dart
[![Build Status](https://travis-ci.org/MatzeS/dart_rmi.svg?branch=master)](https://travis-ci.org/MatzeS/dart_rmi)

This project provides an solution for remote method invocation in dart without the use of reflection. Since reflection is only available on the Dart VM but not on a JS VM, this solution is entirely based on code generation instead.

## Getting Started

Let's say you want to invoke methods of an `ExampleClass` looking like this:

```dart
// in example.dart
part 'example.g.dart';
class ExampleClass implements RmiTarget {
  void someMethod() {
	print('some stuff');
  }

  ExampleClass();
  // required boilerplate for code generation
  @override
  Object invoke(Invocation invocation) =>
      _$ExampleClassInvoker.invoke(invocation, this);
  factory ExampleClass.getRemote(Context context, String uuid) =>
      _$ExampleClassRmi.getRemote(context, uuid);
  Provision provideRemote(Context context) =>
      _$ExampleClassRmi.provideRemote(context, this);
}
```

And you have the actual object present on machine A:

```dart
ExampleClass exampleObject = new ExampleClass();
/// ...setup some network connection, get a Stream and a StreamSink from it
Stream input = ...
StreamSink output = ...
Provision provision = exampleObject.provideRemote(new Context(input, output));
/// provision contains the uuid which identifies the object on this machine
```

On machine B:

```dart
/// Again we have the input and output you get from your network 
/// and additionally you have to provide the uuid from before
Stream input = ...
StreamSink output = ...
String uuid = ... provision.uuid // from above
ExampleClass remoteObject = ExampleClass.getRemote(new Context(input, output), uuid);
remoteObject.someMethod(); // prints 'some stuff' on the other machine
```

## TODO
- generator warning when no factory was implemented
- also for part ...
- not invocable, not proxied method annotation
-  operators
- think about object methods, tostring hashcode
- check lang spec for other members what else could be here
- Serialize exceptions
- send stack on exception
- Add else clause to invoker to provide an error message
- write doc
- cleanup exports
- write install script