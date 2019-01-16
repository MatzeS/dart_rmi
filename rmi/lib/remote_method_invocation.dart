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

/// Acquires a remote object
typedef Object RemoteStubConstructor(Context context, String uuid);

typedef Object FromJson(Map<String, dynamic> json);
Map<String, FromJson> _fromJsonFunctions = {
  'asset:rmi/lib/src/packets.dart#Query': Query.fromJson,
  'asset:rmi/lib/src/packets.dart#Response': Response.fromJson,
  'asset:rmi/lib/src/packets.dart#RemoteStub': RemoteStub.fromJson,
  'asset:rmi/lib/src/packets.dart#TransferredObject':
      TransferredObject.fromJson,
};

class Context {
  JsonSerialization serialization = new JsonSerialization();
  Map<String, RemoteStubConstructor> remoteStubConstructors = {};

  Context(this.input, this.output) {
    _fromJsonFunctions
        .forEach((k, v) => serialization.registerDeserializer(k, (x) => v(x)));
  }

  Stream<String> input;
  StreamSink<String> output;

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
