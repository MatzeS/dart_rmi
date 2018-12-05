import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'serializable_invocation.g.dart';

/// copy of Invocation class in order to make it serializable
abstract class SerializableInvocation
    implements Built<SerializableInvocation, SerializableInvocationBuilder> {
  static Serializer<SerializableInvocation> get serializer =>
      _$serializableInvocationSerializer;

  Symbol get memberName;
  BuiltList<Object> get positionalArguments;
  BuiltMap<Symbol, Object> get namedArguments;
  bool get isMethod;
  bool get isGetter;
  bool get isSetter;

  SerializableInvocation._();
  factory SerializableInvocation([updates(SerializableInvocationBuilder b)]) =
      _$SerializableInvocation;
}

SerializableInvocation convertInvocation(Invocation invocation) {
  return SerializableInvocation((b) => b
    ..memberName = invocation.memberName
    ..positionalArguments = new ListBuilder(invocation.positionalArguments)
    ..namedArguments = new MapBuilder(invocation.namedArguments)
    ..isMethod = invocation.isMethod
    ..isSetter = invocation.isSetter
    ..isGetter = invocation.isGetter);
}

Invocation convertSerializableInvocation(SerializableInvocation invocation) {
  if (invocation.isSetter) {
    return Invocation.setter(
        invocation.memberName, invocation.positionalArguments.first);
  } else if (invocation.isGetter) {
    return Invocation.getter(invocation.memberName);
  } else if (invocation.isMethod) {
    // if (invocation.typeArguments.isEmpty) { //TODO
    return Invocation.method(
        invocation.memberName, invocation.positionalArguments);
    // } else {
    //   return Invocation.genericMethod(invocation.memberName,
    //       invocation.typeArguments, invocation.positionalArguments);
    // }
  } else {
    throw new Exception("could not identify invocation type");
  }
}
