import 'package:invoker/invoker.dart';
import 'package:proxy/proxy.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';
import 'serializable_invocation.dart';
import 'dart:async';
import 'dart:convert';
import '../remote_method_invocation.dart';
import 'symbol_serializer.dart';

import 'package:uuid/uuid.dart';
import 'packets.dart';

part 'implementation.g.dart';

String generateUUID() => new Uuid().v1();

@SerializersFor(const [SerializableInvocation, Query, Response, RemoteStub])
Serializers serializers = (_$serializers.toBuilder()
      ..add(new SymbolSerializer())
      ..addPlugin(new StandardJsonPlugin()))
    .build();

void _addSerializer(Serializer serializer) {
  serializers = (serializers.toBuilder()..add(serializer)).build();
}

class RmiProxyHandler {
  Context context;
  String targetUuid;
  RmiProxyHandler(this.context, this.targetUuid);

  Object handle(Invocation invocation) async {
    List positionalArguments = [];
    for (int i = 0; i < invocation.positionalArguments.length; i++) {
      Object arg = invocation.positionalArguments[i];
      if (arg is RmiTarget) {
        Provision argumentProvision = arg.provideRemote(this.context);
        RemoteStub stub = (RemoteStubBuilder()
              ..uuid = argumentProvision.uuid
              ..type = arg.runtimeType.toString())
            .build();
        positionalArguments.add(stub);
      } else {
        positionalArguments.add(arg);
      }
    }

    SerializableInvocation serializableInvocation =
        convertInvocation(invocation, positionalArguments, {}); //TODO named

    Query query = Query((b) => b
      ..uuid = generateUUID()
      ..targetUuid = targetUuid
      ..invocation = serializableInvocation.toBuilder());

    String serializedJson = json.encode(serializers.serialize(query));

    Future answer = context.input
        .map((data) => serializers.deserialize(json.decode(data)))
        .where((p) => p is Response)
        .map((p) => p as Response)
        .where((r) => r.query == query.uuid)
        .first;

    context.output.add(serializedJson);

    Response response = await answer;
    if (response.exception != null) {
      throw new Exception(response.exception);
    } else if (response.returnedNull || response.returnValue != null) {
      var returnValue = response.returnValue;
      if (returnValue is RemoteStub) {
        returnValue = context.getRemote(returnValue);
      }
      return returnValue;
    } else {
      throw new Exception(
          'response contains no exception or return value'); //TODO
    }
  }
}

Provision internalProvideRemote(Context context, Invocable target) {
  Provision provision = new Provision();
  provision.context = context;
  provision.uuid = generateUUID();

  context.input.listen((onData) async {
    Object packet = serializers.deserialize(json.decode(onData));
    if (packet is! Query) return;
    Query query = packet;
    if (query.targetUuid != provision.uuid) return;

    List<Object> positionalArguments = [];
    for (int i = 0; i < query.invocation.positionalArguments.length; i++) {
      Object arg = query.invocation.positionalArguments[i];
      if (arg is RemoteStub) {
        Object proxy = context.getRemote(arg);
        positionalArguments.add(proxy);
      } else {
        positionalArguments.add(arg);
      }
    }
    Invocation invocation = convertSerializableInvocation(
        query.invocation, positionalArguments, {}); //TODO

    ResponseBuilder response = new ResponseBuilder();
    response.query = query.uuid;

    try {
      var returnValue = target.invoke(invocation);
      if (returnValue is Future) {
        returnValue = await returnValue;
      }

      if (returnValue is RmiTarget) {
        Provision argumentProvision =
            (returnValue as RmiTarget).provideRemote(context);
        RemoteStub stub = (RemoteStubBuilder()
              ..uuid = argumentProvision.uuid
              ..type = returnValue.runtimeType.toString())
            .build();
        returnValue = stub;
      }

      response.returnValue = returnValue;
      response.returnedNull = returnValue == null;
    } catch (exception, stack) {
      response.exception = exception.toString();
      response.returnedNull = true;
    }
    context.output.add(json.encode(serializers.serialize(response.build())));
  });

  return provision;
}

void internalRegisterSerializers(List<Serializer> serializers) {
  serializers.forEach((s) {
    _addSerializer(s);
  });
}

Object internalGetRemoteFromStub(RemoteStub stub, Context context) {
  RemoteStubConstructor constructor = context.remoteStubConstructors[stub.type];
  return constructor(context, stub.uuid);
}
