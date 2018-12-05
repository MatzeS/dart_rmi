import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';

class SymbolSerializer implements PrimitiveSerializer<Symbol> {
  final bool structured = false;

  @override
  final Iterable<Type> types = new BuiltList<Type>([Symbol]);
  @override
  final String wireName = 'Symbol';

  @override
  Object serialize(Serializers serializers, Symbol symbol,
      {FullType specifiedType = FullType.unspecified}) {
    return symbol.toString();
  }

  @override
  Symbol deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    String serializedStr = serialized as String;
    int start = serializedStr.indexOf('"');
    int end = serializedStr.lastIndexOf('"');
    String stripped = serializedStr.substring(start + 1, end);
    return new Symbol(stripped);
  }
}
