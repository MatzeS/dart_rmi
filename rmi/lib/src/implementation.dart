import 'dart:async';
import 'dart:convert';
import '../remote_method_invocation.dart';
import 'package:uuid/uuid.dart';
import 'packets.dart';
import '../invoker.dart';
import 'package:json_serialization/json_serialization.dart';
import 'package:rmi/proxy.dart';
import 'standard_object.dart';

String generateUUID() => new Uuid().v1();

class RmiProxyHandler {
  Context context;
  String targetUuid;
  RmiProxyHandler(this.context, this.targetUuid);

  Object handle(Invocation invocation, InvocationMetadata meta) {
    Query query = Query();
    query.uuid = generateUUID();
    query.targetUuid = targetUuid;
    query.memberName = invocation.memberName;
    query.isGetter = invocation.isGetter;
    query.isSetter = invocation.isSetter;

    List<TransferredObject> positionalArguments = [];
    for (int i = 0; i < invocation.positionalArguments.length; i++) {
      Object arg = invocation.positionalArguments[i];
      TransferredObject transfer = _generateTransferable(
          arg, meta.positionalArgumentMetadata[i], context);
      positionalArguments.add(transfer);
    }
    query.positionalArguments = positionalArguments;

    Map<String, TransferredObject> namedArguments = {};
    invocation.namedArguments.forEach((k, v) {
      Object arg = v;
      TransferredObject transfer =
          _generateTransferable(arg, meta.namedArgumentMetadata[k], context);
      namedArguments[SymbolConverter().toJson(k)] = transfer;
    });
    query.namedArguments = namedArguments;

    String serializedQuery = context.serialization.serialize(query);

    Future<Response> answer = context.input
        .map((data) => context.serialization.deserialize(data))
        .where((p) => p is Response)
        .map((p) => p as Response)
        .where((r) => r.query == query.uuid)
        .first;
    context.output.add(serializedQuery);

    if (meta.isStream) {
      var sc = new StreamController();
      answer.then((response) {
        //TODO more chekcs
        if (response.resolution.object.isObject &&
            _reconstructTransferredObject(
                    response.resolution.object, context) ==
                null) {
          sc.close();
        } else if (!response.resolution.object.isStream) {
          throw new Exception(
              'did not receive expected stream ${response.resolution.object.future}');
        } else {
          //TODO
          (_reconstructTransferredObject(response.resolution.object, context)
                  as Stream)
              .pipe(sc.sink);
        }
      });
      return sc.stream;
    } else {
      return answer.then((response) {
        if (response.resolution.isException) {
          print('>>>>>>>>>>>>>>>>.remote exceptoin raised');
          throw new Exception('REMOTE EXCEPTOIN RAISED' +
              response.resolution.exception.message);
        } else if (response.resolution != null) {
          //illegal
          var x = _reconstructTransferredObject(
              response.resolution.object, context);
          return x;
        } else {
          throw new Exception(
              'response contains no exception or return value'); //TODO
        }
      });
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
      TransferredObject transferred = query.positionalArguments[i];

      positionalArguments
          .add(_reconstructTransferredObject(transferred, context));
    }
    Map<Symbol, Object> namedArguments = {};
    query.namedArguments.forEach((k, v) {
      TransferredObject transferred = v;
      Symbol symbol = SymbolConverter().fromJson(k);
      namedArguments[symbol] =
          _reconstructTransferredObject(transferred, context);
    });

    Response response = Response(query.uuid);

    Invocation invocation;
    if (query.isGetter) {
      invocation = Invocation.getter(query.memberName);
    } else if (query.isSetter) {
      invocation =
          Invocation.setter(query.memberName, positionalArguments.first);
    } else {
      invocation = Invocation.method(
          query.memberName, positionalArguments, namedArguments);
    }

    try {
      print('invoking ${invocation.memberName}');
      var returnValue = await target.invoke(invocation);
      response.resolution =
          Resolution(object: _generateTransferable(returnValue, null, context));
    } catch (exception, stack) {
      // print(stack);
      //TODO test
      response.resolution =
          Resolution(exception: TransferredException.fromException(exception));
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

//TODO rename to transferobject
TransferredObject _generateTransferable(
    Object object, List<Object> metadata, Context context) {
  if (object is Stream) {
    var uuid = generateUUID();
    object.listen((value) {
      var resolution = new FutureResolution();
      resolution.uuid = uuid;
      resolution.resolution =
          Resolution(object: _generateTransferable(value, null, context));
      context.output.add(context.serialization.serialize(resolution));
    });
    return TransferredObject.forStream(uuid);
  } else if (object is Future) {
    // RemoteFuture remote = new RemoteFuture(object);
    // var provision = remote.provideRemote(context);
    var uuid = generateUUID();
    object
      ..then((value) {
        var resolution = new FutureResolution();
        resolution.uuid = uuid;
        resolution.resolution =
            Resolution(object: _generateTransferable(value, null, context));
        context.output.add(context.serialization.serialize(resolution));
      })
      ..catchError((error) {
        //TOOD check if necessary
        print('>>>>>>>>>>>>>>>>>>>>>>>>>catched error $error');
        var resolution = new FutureResolution();
        resolution.uuid = uuid;
        resolution.resolution =
            Resolution(exception: TransferredException.fromException(error));
        context.output.add(context.serialization.serialize(resolution));
      });
    return TransferredObject.forFuture(uuid);
  } else if (object is RmiTarget &&
      (metadata == null || !metadata.any((e) => e is NotAsRmi))) {
    Provision provision = object.provideRemote(context);
    RemoteStub stub = RemoteStub(provision.uuid, provision.classAssetPath);
    return TransferredObject.forRemote(stub);
  } else {
    // assume its serializable
    String serialized = context.serialization.serialize(object);
    return TransferredObject.forObject(serialized);
  }
}

Object _reconstructTransferredObject(
    TransferredObject transferred, Context context) {
  if (transferred.isFuture) {
    var future = FutureImplementation();
    future.context = context;
    future.uuid = transferred.future;
    print('well');
    return future;
    // return RemoteFuture.getRemote(context, transferred.future);
  } else if (transferred.isStream) {
    var stream = StreamImplementation();
    stream.uuid = transferred.stream;
    stream.context = context;
    return stream;
  } else if (transferred.isRemote) {
    RemoteStub stub = transferred.remote;
    Object proxy = context.getRemote(stub);
    return proxy;
  } else {
    // assume its serializable
    Object deserialized =
        context.serialization.deserialize(transferred.serializedObject);
    return deserialized;
  }
}

class FutureImplementation implements Future<dynamic> {
  Context context;
  String uuid;

  @override
  Stream asStream() {
    // TODO: implement asStream
    print('as stream');
    return null;
  }

  @override
  Future timeout(Duration timeLimit, {FutureOr Function() onTimeout}) {
    // TODO: implement timeout
    print('timeout');

    return null;
  }

  @override
  Future<R> then<R>(FutureOr<R> onValue(dynamic value), {Function onError}) {
    return context.input
        .map((data) => context.serialization.deserialize(data))
        .where((p) => p is FutureResolution)
        .map((p) => p as FutureResolution)
        .where((r) => r.uuid == uuid)
        .first
        .then((fr) {
      if (fr.resolution.isException) {
        onError(new Exception(fr.resolution.exception.message));
      } else
        return onValue(
            _reconstructTransferredObject(fr.resolution.object, context));

      return null;
    });
  }

  @override
  Future catchError(Function onError, {bool Function(Object error) test}) {
    // TODO: implement catchError
    print(
        'asdfkljas;lfdjas;ldkjf;lasdkjfs;lakjfl;asjfl;aksdjf;laskjfl;ajs;lfkjasl;fkj; catchError');
    // throw new Exception('asdf');
    // return context.input
    //     .map((data) => context.serialization.deserialize(data))
    //     .where((p) => p is FutureResolution)
    //     .map((p) => p as FutureResolution)
    //     .where((r) => r.uuid == uuid)
    //     .first
    //     .then((fr) {
    //   if (!fr.resolution.isException)
    //     // onError();

    //     ;
    // }).then(onValue);
  }

  @override
  Future whenComplete(FutureOr Function() action) {
    // TODO: implement whenComplete
    print('whenComplete');

    return null;
  }
}

class StreamImplementation extends Stream {
  Context context;
  String uuid;

  @override
  StreamSubscription listen(void Function(dynamic event) onData,
      {Function onError, void Function() onDone, bool cancelOnError}) {
    context.input
        .map((data) => context.serialization.deserialize(data))
        .where((p) => p is FutureResolution)
        .map((p) => p as FutureResolution)
        .where((r) => r.uuid == uuid)
        .listen((fr) {
      var object = _reconstructTransferredObject(fr.resolution.object, context);
      onData(object);
    });
    return null; //TODO
  }
}
