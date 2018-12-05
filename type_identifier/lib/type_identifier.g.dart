// GENERATED CODE - DO NOT MODIFY BY HAND

part of type_identifier;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals

Serializer<TypeIdentifier> _$typeIdentifierSerializer =
    new _$TypeIdentifierSerializer();

class _$TypeIdentifierSerializer
    implements StructuredSerializer<TypeIdentifier> {
  @override
  final Iterable<Type> types = const [TypeIdentifier, _$TypeIdentifier];
  @override
  final String wireName = 'TypeIdentifier';

  @override
  Iterable serialize(Serializers serializers, TypeIdentifier object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  TypeIdentifier deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new TypeIdentifierBuilder().build();
  }
}

class _$TypeIdentifier extends TypeIdentifier {
  factory _$TypeIdentifier([void updates(TypeIdentifierBuilder b)]) =>
      (new TypeIdentifierBuilder()..update(updates)).build();

  _$TypeIdentifier._() : super._();

  @override
  TypeIdentifier rebuild(void updates(TypeIdentifierBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TypeIdentifierBuilder toBuilder() =>
      new TypeIdentifierBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TypeIdentifier;
  }

  @override
  int get hashCode {
    return 199832848;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('TypeIdentifier').toString();
  }
}

class TypeIdentifierBuilder
    implements Builder<TypeIdentifier, TypeIdentifierBuilder> {
  _$TypeIdentifier _$v;

  TypeIdentifierBuilder();

  @override
  void replace(TypeIdentifier other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TypeIdentifier;
  }

  @override
  void update(void updates(TypeIdentifierBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$TypeIdentifier build() {
    final _$result = _$v ?? new _$TypeIdentifier._();
    replace(_$result);
    return _$result;
  }
}
