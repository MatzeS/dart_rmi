import 'dart:async';
import 'dart:convert';
import '../remote_method_invocation.dart';
import 'package:uuid/uuid.dart';
import 'packets.dart';
import '../invoker.dart';
import 'package:json_serialization/json_serialization.dart';

String generateUUID() => new Uuid().v1();

class RmiProxyHandler {
  Context context;
  String targetUuid;
  RmiProxyHandler(this.context, this.targetUuid);

  Object handle(Invocation invocation) async {
    Query query = Query();
    query.uuid = generateUUID();
    query.targetUuid = targetUuid;
    query.memberName = invocation.memberName;
    query.isGetter = invocation.isGetter;
    query.isSetter = invocation.isSetter;

    List<TransferredObject> positionalArguments = [];
    for (int i = 0; i < invocation.positionalArguments.length; i++) {
      Object arg = invocation.positionalArguments[i];
      TransferredObject transfer;

      if (arg is RmiTarget) {
        Provision argumentProvision = arg.provideRemote(this.context);
        RemoteStub stub = RemoteStub(argumentProvision.uuid,
            argumentProvision.classAssetPath); //TODO type? suspicious
        transfer = TransferredObject.forStub(stub);
      } else {
        String serialized = context.serialization.serialize(arg);
        transfer = TransferredObject.forSerialized(serialized);
      }

      positionalArguments.add(transfer);
    }
    query.positionalArguments = positionalArguments;

    //TODO named

    String serializedQuery = context.serialization.serialize(query);

    Future answer = context.input
        .map((data) => context.serialization.deserialize(data))
        .where((p) => p is Response)
        .map((p) => p as Response)
        .where((r) => r.query == query.uuid)
        .first;
    context.output.add(serializedQuery);

    Response response = await answer;
    if (response.exception != null) {
      throw new Exception('REMOTE EXCEPTOIN RAISED' + response.exception);
    } else if (response.returnedNull || response.returnValue != null) {
      var returnValue = response.returnValue;

      if (returnValue.isStub) {
        return context.getRemote(returnValue.stub);
      } else {
        return context.serialization.deserialize(returnValue.serialized);
      }
    } else {
      throw new Exception(
          'response contains no exception or return value'); //TODO
    }
  }
}

Provision internalProvideRemote(
    Context context, Invocable target, String classAssetPath) {
  Provision provision = new Provision();
  provision.context = context;
  provision.classAssetPath = classAssetPath;
  provision.uuid = generateUUID();

  context.input.listen((onData) async {
    Object packet = context.serialization.deserialize(onData);
    if (packet is! Query) return;
    Query query = packet;
    if (query.targetUuid != provision.uuid) return;

    List<Object> positionalArguments = [];
    for (int i = 0; i < query.positionalArguments.length; i++) {
      TransferredObject arg = query.positionalArguments[i];

      if (arg.isStub) {
        // not very safe
        RemoteStub stub = arg.stub;
        Object proxy = context.getRemote(stub);
        positionalArguments.add(proxy);
      } else {
        Object deserialized = context.serialization.deserialize(arg.serialized);
        positionalArguments.add(deserialized);
      }
    }
    // TODO Named arguments

    //TODO replace with function
    Invocation invocation;
    if (!query.isGetter && !query.isSetter) {
      invocation = Invocation.method(query.memberName, positionalArguments);
    } else if (query.isGetter) {
      invocation = Invocation.getter(query.memberName);
    } else if (query.isSetter) {
      invocation =
          Invocation.setter(query.memberName, positionalArguments.first);
    }

    Response response = Response();
    response.query = query.uuid;

    try {
      var returnValue = target.invoke(invocation);

      if (returnValue is Future) {
        returnValue = await returnValue;
      }

      TransferredObject transfer;
      if (returnValue is RmiTarget) {
        Provision returnValueProvision = returnValue.provideRemote(context);
        RemoteStub stub = new RemoteStub(
            returnValueProvision.uuid, returnValueProvision.classAssetPath);

        transfer = TransferredObject.forStub(stub);
      } else {
        String serialized = context.serialization.serialize(returnValue);
        transfer = TransferredObject.forSerialized(serialized);
      }

      response.returnValue = transfer;
      response.returnedNull = returnValue == null;
    } catch (exception, stack) {
      response.exception = exception.toString();
      response.returnedNull = true;
    }
    context.output.add(context.serialization.serialize(response));
  });

  return provision;
}

// void internalRegisterSerializers(Map<String, Deserializer> deserializer) {
//   fromJsonFunctions.addAll(deserializer);
// }

Object internalGetRemoteFromStub(RemoteStub stub, Context context) {
  RemoteStubConstructor constructor = context.remoteStubConstructors[stub.type];
  return constructor(context, stub.uuid);
}

// Invocation _replaceInvocationArguments(
//     Invocation invocation, List<Object> positionalArguments) {
//   if (invocation.isGetter) {
//     return new Invocation.getter(invocation.memberName);
//   } else if (invocation.isSetter) {
//     return new Invocation.setter(
//         invocation.memberName, positionalArguments.first);
//   } else {
//     return new Invocation.method(invocation.memberName, positionalArguments);
//   }
// }
