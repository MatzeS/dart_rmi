library rmi;

import 'proxy.dart';
import 'invoker.dart';
import 'src/packets.dart';
import 'dart:async';
import 'src/json_serialization.dart';

import 'src/implementation.dart';

export 'src/implementation.dart';

abstract class RmiTarget implements Invocable, Proxy {
  Provision provideRemote(Context context);

  /// Also provides a
  ///     getRemote(Context context, String uuid);
}

/// Translates a serializable object from string to object
typedef Object Deserializer(dynamic serialized);

/// Acquires a remote object
typedef Object RemoteStubConstructor(Context context, String uuid);

abstract class Serialization {
  dynamic serialize(Object object);
  Object deserialize(dynamic data);
  void registerDeserializer(String key, Deserializer deserializers);
}

class Context {
  Serialization serialization = new JsonSerialization();
  Map<String, RemoteStubConstructor> remoteStubConstructors = {};

  Stream<String> input;
  StreamSink<String> output;
  Context(this.input, this.output);

  Object getRemote(RemoteStub stub) => internalGetRemoteFromStub(stub, this);

  void registerRemoteStubConstructor(
      String type, RemoteStubConstructor constructor) {
    remoteStubConstructors[type] = constructor;
  }

  void registerDeserializer(String key, Deserializer deserializer) =>
      serialization.registerDeserializer(key, deserializer);
}

class Provision {
  Context context;
  String uuid;
  String classAssetPath;
  // void terminate(); TODO
}

//TODO remove
Provision rmiProvideRemote(
        Context context, Invocable target, String classAssetPath) =>
    internalProvideRemote(context, target, classAssetPath);
