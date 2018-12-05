library type_identifier;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'type_identifier.g.dart';

abstract class TypeIdentifier
    implements Built<TypeIdentifier, TypeIdentifierBuilder> {
  static Serializer<TypeIdentifier> get serializer =>
      _$typeIdentifierSerializer;
  factory TypeIdentifier([updates(TypeIdentifierBuilder b)]) = _$TypeIdentifier;
  TypeIdentifier._();
}

abstract class RegisteredType {
  TypeIdentifier get typeIdentifier;
}
