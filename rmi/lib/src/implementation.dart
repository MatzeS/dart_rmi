import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';
import 'dart:async';
import 'dart:convert';
import '../remote_method_invocation.dart';
import 'package:uuid/uuid.dart';
import 'packets.dart';
import '../invoker.dart';

String _serialize(Object object) {
  String objectString = const JsonEncoder.withIndent(' ').convert(object);

  Map<String, String> result = {};
  result['object'] = objectString;
  result['class'] = object.runtimeType.toString();
  return json.encode(result);
}

typedef Object FromJson(Map<String, dynamic> json);
Map<String, FromJson> fromJsonFunctions = {
  'Query': Query.fromJson,
  'Response': Response.fromJson,
  'RemoteStub': RemoteStub.fromJson,
  'TransferredObject': TransferredObject.fromJson,
};

Object _deserialize(dynamic serialized) {
  if (serialized is! String)
    throw new Exception('seririalized $serialized is not a string');

// TODO restrict to string
  Map<String, dynamic> result = json.decode(serialized);
  String className = result['class'];
  String objectString = result['object'];

  if (className == 'Null') return null;

  Object decoded = json.decode(objectString);
  if (decoded is Map) {
    Map<String, dynamic> objectMap = decoded;
    return fromJsonFunctions[className](objectMap);
  } else {
    //TODO cleanup
    return decoded;
  }
}

void addDeserialize(String className, FromJson deserialize) {
  fromJsonFunctions.putIfAbsent(className, () => deserialize);
}

String generateUUID() => new Uuid().v1();

class RmiProxyHandler {
  Context context;
  String targetUuid;
  RmiProxyHandler(this.context, this.targetUuid);

  Object handle(Invocation invocation) async {
    List<TransferredObject> positionalArguments = [];
    for (int i = 0; i < invocation.positionalArguments.length; i++) {
      Object arg = invocation.positionalArguments[i];
      if (arg is RmiTarget) {
        Provision argumentProvision = arg.provideRemote(this.context);
        RemoteStub stub = RemoteStub(argumentProvision.uuid,
            arg.runtimeType.toString()); //TODO type? suspicious
        positionalArguments.add(TransferredObject.forStub(stub));
      } else {
        positionalArguments.add(TransferredObject.forJson(_serialize(arg)));
      }
    }

    Query query = Query();
    query.uuid = generateUUID();
    query.targetUuid = targetUuid;
    query.memberName = invocation.memberName;
    query.isGetter = invocation.isGetter;
    query.isSetter = invocation.isSetter;
    query.positionalArguments = positionalArguments;
    //TODO named

    String serializedJson = _serialize(query);

    Future answer = context.input
        .map((data) => _deserialize(data))
        .where((p) => p is Response)
        .map((p) => p as Response)
        .where((r) => r.query == query.uuid)
        .first;

    context.output.add(serializedJson);

    Response response = await answer;
    if (response.exception != null) {
      throw new Exception('REMOTE EXCEPTOIN RAISED' + response.exception);
    } else if (response.returnedNull || response.returnValue != null) {
      var returnValue = response.returnValue;

      if (returnValue.isStub) {
        return context.getRemote(returnValue.stub);
      }

      return _deserialize(returnValue.json);
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
    Object packet = _deserialize(onData);
    if (packet is! Query) return;
    Query query = packet;
    if (query.targetUuid != provision.uuid) return;

    // TODO Named arguments
    List<Object> positionalArguments = [];
    for (int i = 0; i < query.positionalArguments.length; i++) {
      TransferredObject arg = query.positionalArguments[i];

      if (arg.isStub) {
        // not very safe
        RemoteStub stub = arg.stub;
        Object proxy = context.getRemote(stub);
        positionalArguments.add(proxy);
      } else {
        positionalArguments.add(_deserialize(arg.json));
      }
    }

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

      if (returnValue is RmiTarget) {
        // rename
        Provision argumentProvision =
            (returnValue as RmiTarget).provideRemote(context);
        RemoteStub stub = new RemoteStub(
            argumentProvision.uuid, returnValue.runtimeType.toString());
        returnValue = TransferredObject.forStub(stub);
      } else {
        //TODO new variable
        returnValue = TransferredObject.forJson(_serialize(returnValue));
      }

      response.returnValue = returnValue;
      response.returnedNull = returnValue == null;
    } catch (exception, stack) {
      response.exception = exception.toString();
      response.returnedNull = true;
    }
    context.output.add(_serialize(response));
  });

  return provision;
}

void internalRegisterSerializers(Map<String, FromJson> deserializer) {
  fromJsonFunctions.addAll(deserializer);
}

Object internalGetRemoteFromStub(RemoteStub stub, Context context) {
  RemoteStubConstructor constructor = context.remoteStubConstructors[stub.type];
  return constructor(context, stub.uuid);
}

Invocation _replaceInvocationArguments(
    Invocation invocation, List<Object> positionalArguments) {
  if (invocation.isGetter) {
    return new Invocation.getter(invocation.memberName);
  } else if (invocation.isSetter) {
    return new Invocation.setter(
        invocation.memberName, positionalArguments.first);
  } else {
    return new Invocation.method(invocation.memberName, positionalArguments);
  }
}
