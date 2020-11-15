library rmi;

import 'proxy.dart';
import 'invoker.dart';
import 'src/packets.dart';
import 'dart:async';
import 'package:json_serialization/json_serialization.dart';

import 'src/implementation.dart';

export 'src/implementation.dart';

abstract class RmiTarget implements Invocable, Proxy {
  Provision provideRemote(Context context);

  /// Also provides a
  ///     getRemote(Context context, String uuid);
}

class NotAsRmi {
  const NotAsRmi();
}

/// Acquires a remote object
typedef Object RemoteStubConstructor(Context context, String uuid);

class RemoteStubProvider {
  Map<String, RemoteStubConstructor> _remoteStubConstructors = {};

  Object proxify(Context context, RemoteStub stub) {
    RemoteStubConstructor constructor = _remoteStubConstructors[stub.type];
    if (constructor == null) throw new Exception("cannot proxify ${stub.type}");
    return constructor(context, stub.uuid);
  }

  void registerRemoteStubConstructor(
      String type, RemoteStubConstructor constructor) {
    _remoteStubConstructors[type] = constructor;
  }
}

typedef Object FromJson(Map<String, dynamic> json);
Map<String, FromJson> _fromJsonFunctions = {
  'asset:rmi/lib/src/packets.dart#Query': Query.fromJson,
  'asset:rmi/lib/src/packets.dart#Response': Response.fromJson,
  'asset:rmi/lib/src/packets.dart#RemoteStub': RemoteStub.fromJson,
  'asset:rmi/lib/src/packets.dart#TransferredObject':
      TransferredObject.fromJson,
  'asset:rmi/lib/src/packets.dart#FutureResolution': FutureResolution.fromJson,
};

class Context {
  JsonSerialization serialization;
  RemoteStubProvider remoteStubProvider;

  Context(Stream<String> input, this.output,
      {this.serialization, this.remoteStubProvider}) {
    this.input = input.asBroadcastStream();

    if (serialization == null) serialization = new JsonSerialization();
    if (remoteStubProvider == null)
      remoteStubProvider = new RemoteStubProvider();

    //TODO cleanup
    _fromJsonFunctions
        .forEach((k, v) => serialization.registerDeserializer(k, (x) => v(x)));
  }

  Stream<String> input;
  StreamSink<String> output;

  Object getRemote(RemoteStub stub) => internalGetRemoteFromStub(stub, this);

  void registerRemoteStubConstructor(
      String type, RemoteStubConstructor constructor) {
    remoteStubProvider.registerRemoteStubConstructor(type, constructor);
  }

  void registerDeserializer(String key, Deserializer deserializer) =>
      serialization.registerDeserializer(key, deserializer);

  Object proxifyRemoteStub(RemoteStub stub) {
    return remoteStubProvider.proxify(this, stub);
  }
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
