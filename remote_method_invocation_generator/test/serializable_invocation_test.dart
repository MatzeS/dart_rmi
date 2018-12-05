import 'package:test/test.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:remote_method_invocation/remote_method_invocation.dart';

part 'serializable_invocation_test.g.dart';

@SerializersFor(const [
  SerializableInvocation,
])
Serializers serializers = _$serializers;

main() {
  group('serializable invocation tests', () {
    test('works without error or exception', () {
      SerializableInvocation invoc = SerializableInvocation((b) => b
        ..isGetter = false
        ..isSetter = false
        ..isMethod = true
        ..namedArguments =
            BuiltMap<Symbol, String>.from({#asdf: 'asdf'}).toBuilder()
        ..positionalArguments =
            BuiltList<Object>.from([0, 123, 'asdf']).toBuilder()
        ..memberName = #asdf);
      // print(invoc);
      Serializer customSerializer = new SymbolSerializer();
      SerializersBuilder serializersBuilder = serializers.toBuilder();
      serializersBuilder.add(customSerializer);
      serializersBuilder.addPlugin(new StandardJsonPlugin());
      serializers = serializersBuilder.build();
      Object serialized = serializers.serialize(invoc);
      // print(serialized);
      SerializableInvocation serializableInvocation =
          serializers.deserialize(serialized);

      Invocation invocation =
          convertSerializableInvocation(serializableInvocation);
    });
  });
}
