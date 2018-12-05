library remote_method_invocation;

import 'package:invoker/invoker.dart';
import 'package:proxy/proxy.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';
import 'serializable_invocation.dart';
import 'dart:async';
import 'dart:convert';

part 'remote_method_invocation.g.dart';

abstract class RmiTarget implements Invocable, Proxy {}

class Connection {
  Stream<String> input;
  StreamSink<String> output;
  Connection(this.input, this.output);
}

@SerializersFor(const [SerializableInvocation])
Serializers defaultSerializers = _$defaultSerializers;
SerializersBuilder serializersBuilder = defaultSerializers.toBuilder();
void prepareSerializers() {
  serializersBuilder.add(new SymbolSerializer());
  serializersBuilder.addPlugin(new StandardJsonPlugin());
}

class RmiProxyHandler extends ProxyHandler {
  Connection connection;
  RmiProxyHandler(this.connection);
  @override
  Object handle(Invocation invocation) {
    //TODO serialize sub parameters

    prepareSerializers();
    Serializers serializers = serializersBuilder.build();

    SerializableInvocation sInvocation = convertInvocation(invocation);
    Object serialized = serializers.serialize(sInvocation);
    String send = json.encode(serialized);
    connection.output.add(send);
  }
}

void rmiExposeRemote(Connection connection, Invocable target) {
  connection.input.listen((onData) {
    prepareSerializers();
    Serializers serializers = serializersBuilder.build();

    SerializableInvocation sInvoc =
        serializers.deserialize(json.decode(onData));
    Invocation invocation = convertSerializableInvocation(sInvoc);
    target.invoke(invocation);
  });
}
