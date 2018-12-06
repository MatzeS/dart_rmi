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

var uuid = new Uuid();
String generateUUID() => uuid.v1();

@SerializersFor(const [SerializableInvocation, Query, Response])
Serializers serializers = (_$serializers.toBuilder()
      ..add(new SymbolSerializer())
      ..addPlugin(new StandardJsonPlugin()))
    .build();

void _addSerializer(Serializer serializer) {
  serializers = (serializers.toBuilder()..add(serializer)).build();
}

class RmiProxyHandler {
  Connection connection;
  RmiProxyHandler(this.connection);
  @override
  Object handle(Invocation invocation) async {
    SerializableInvocation serializableInvocation =
        convertInvocation(invocation);
    Query query = Query((b) => b
      ..uuid = generateUUID()
      ..invocation = serializableInvocation.toBuilder());

    String serializedJson = json.encode(serializers.serialize(query));

    Future answer = connection.input
        .map((data) => serializers.deserialize(json.decode(data)) as Response)
        .firstWhere((r) => r.query == query.uuid);

    connection.output.add(serializedJson);

    Response response = await answer;
    if (response.returnIsNull || response.returnValue != null) {
      return response.returnValue;
    } else if (response.exception != null) {
      throw new Exception(response.exception);
    } else {
      throw new Exception(
          'response contains no exception or return value'); //TODO
    }
  }
}

void internalExposeRemote(Connection connection, Invocable target) {
  connection.input.listen((onData) async {
    Query query = serializers.deserialize(json.decode(onData));
    Invocation invocation = convertSerializableInvocation(query.invocation);

    bool returnedNull = false;
    String exception = null;
    var returnValue;
    try {
      returnValue = target.invoke(invocation);
      if (returnValue == null) returnedNull = true;
    } on Exception catch (e) {
      exception = e.toString();
    }
    if (returnValue is Future) {
      returnValue = await returnValue;
      if (returnValue == null) returnedNull = true;
    }
    Response response = Response((b) => b
      ..query = query.uuid
      ..returnValue = returnValue
      ..returnIsNull = returnedNull
      ..exception = exception);
    connection.output.add(json.encode(serializers.serialize(response)));
  });
}

void internalRegisterSerializers(List<Serializer> serializers) {
  serializers.forEach((s) {
    _addSerializer(s);
  });
}
