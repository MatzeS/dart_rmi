library remote_method_invocation;

import 'package:invoker/invoker.dart';
import 'package:proxy/proxy.dart';
import 'package:built_value/serializer.dart';
import 'dart:async';

import 'src/implementation.dart';

export 'src/serializable_invocation.dart';
export 'src/symbol_serializer.dart';
export 'src/implementation.dart';
import 'src/packets.dart';

abstract class RmiTarget implements Invocable, Proxy {
  Provision provideRemote(Context context);
}

class Context {
  Map<String, RemoteStubConstructor> remoteStubConstructors = {};
  Stream<String> input;
  StreamSink<String> output;
  Context(this.input, this.output);

  Object getRemote(RemoteStub stub) => internalGetRemoteFromStub(stub, this);

  void registerRemoteStubConstructor(
      String type, RemoteStubConstructor constructor) {
    remoteStubConstructors.putIfAbsent(type, () => constructor);
  }
}

typedef Object RemoteStubConstructor(Context context, String uuid);

class Provision {
  Context context;
  String uuid;
  // void terminate();
}

Provision rmiProvideRemote(Context context, Invocable target) =>
    internalProvideRemote(context, target);

void rmiRegisterSerializers(List<Serializer> serializers) =>
    internalRegisterSerializers(serializers);
