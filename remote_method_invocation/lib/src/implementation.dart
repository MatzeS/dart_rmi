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

part 'implementation.g.dart';

@SerializersFor(const [SerializableInvocation])
Serializers serializers = (_$serializers.toBuilder()
      ..add(new SymbolSerializer())
      ..addPlugin(new StandardJsonPlugin()))
    .build();

class RmiProxyHandler {
  Connection connection;
  RmiProxyHandler(this.connection);
  @override
  Object handle(Invocation invocation) {
    //TODO serialize sub parameters

    SerializableInvocation serializableInvocation =
        convertInvocation(invocation);
    Object serialized = serializers.serialize(serializableInvocation);
    String serializedJson = json.encode(serialized);
    connection.output.add(serializedJson);
  }
}

void internalExposeRemote(Connection connection, Invocable target) {
  connection.input.listen((onData) {
    SerializableInvocation serializableInvocation =
        serializers.deserialize(json.decode(onData));
    Invocation invocation =
        convertSerializableInvocation(serializableInvocation);
    target.invoke(invocation);
  });
}
