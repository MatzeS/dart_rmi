// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializable_invocation.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SerializableInvocation> _$serializableInvocationSerializer =
    new _$SerializableInvocationSerializer();

class _$SerializableInvocationSerializer
    implements StructuredSerializer<SerializableInvocation> {
  @override
  final Iterable<Type> types = const [
    SerializableInvocation,
    _$SerializableInvocation
  ];
  @override
  final String wireName = 'SerializableInvocation';

  @override
  Iterable serialize(Serializers serializers, SerializableInvocation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'memberName',
      serializers.serialize(object.memberName,
          specifiedType: const FullType(Symbol)),
      'positionalArguments',
      serializers.serialize(object.positionalArguments,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Object)])),
      'namedArguments',
      serializers.serialize(object.namedArguments,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(Symbol), const FullType(Object)])),
      'isMethod',
      serializers.serialize(object.isMethod,
          specifiedType: const FullType(bool)),
      'isGetter',
      serializers.serialize(object.isGetter,
          specifiedType: const FullType(bool)),
      'isSetter',
      serializers.serialize(object.isSetter,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  SerializableInvocation deserialize(
      Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SerializableInvocationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'memberName':
          result.memberName = serializers.deserialize(value,
              specifiedType: const FullType(Symbol)) as Symbol;
          break;
        case 'positionalArguments':
          result.positionalArguments.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Object)]))
              as BuiltList);
          break;
        case 'namedArguments':
          result.namedArguments.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(Symbol),
                const FullType(Object)
              ])) as BuiltMap);
          break;
        case 'isMethod':
          result.isMethod = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isGetter':
          result.isGetter = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isSetter':
          result.isSetter = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$SerializableInvocation extends SerializableInvocation {
  @override
  final Symbol memberName;
  @override
  final BuiltList<Object> positionalArguments;
  @override
  final BuiltMap<Symbol, Object> namedArguments;
  @override
  final bool isMethod;
  @override
  final bool isGetter;
  @override
  final bool isSetter;

  factory _$SerializableInvocation(
          [void updates(SerializableInvocationBuilder b)]) =>
      (new SerializableInvocationBuilder()..update(updates)).build();

  _$SerializableInvocation._(
      {this.memberName,
      this.positionalArguments,
      this.namedArguments,
      this.isMethod,
      this.isGetter,
      this.isSetter})
      : super._() {
    if (memberName == null) {
      throw new BuiltValueNullFieldError(
          'SerializableInvocation', 'memberName');
    }
    if (positionalArguments == null) {
      throw new BuiltValueNullFieldError(
          'SerializableInvocation', 'positionalArguments');
    }
    if (namedArguments == null) {
      throw new BuiltValueNullFieldError(
          'SerializableInvocation', 'namedArguments');
    }
    if (isMethod == null) {
      throw new BuiltValueNullFieldError('SerializableInvocation', 'isMethod');
    }
    if (isGetter == null) {
      throw new BuiltValueNullFieldError('SerializableInvocation', 'isGetter');
    }
    if (isSetter == null) {
      throw new BuiltValueNullFieldError('SerializableInvocation', 'isSetter');
    }
  }

  @override
  SerializableInvocation rebuild(
          void updates(SerializableInvocationBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SerializableInvocationBuilder toBuilder() =>
      new SerializableInvocationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SerializableInvocation &&
        memberName == other.memberName &&
        positionalArguments == other.positionalArguments &&
        namedArguments == other.namedArguments &&
        isMethod == other.isMethod &&
        isGetter == other.isGetter &&
        isSetter == other.isSetter;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc(0, memberName.hashCode),
                        positionalArguments.hashCode),
                    namedArguments.hashCode),
                isMethod.hashCode),
            isGetter.hashCode),
        isSetter.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SerializableInvocation')
          ..add('memberName', memberName)
          ..add('positionalArguments', positionalArguments)
          ..add('namedArguments', namedArguments)
          ..add('isMethod', isMethod)
          ..add('isGetter', isGetter)
          ..add('isSetter', isSetter))
        .toString();
  }
}

class SerializableInvocationBuilder
    implements Builder<SerializableInvocation, SerializableInvocationBuilder> {
  _$SerializableInvocation _$v;

  Symbol _memberName;
  Symbol get memberName => _$this._memberName;
  set memberName(Symbol memberName) => _$this._memberName = memberName;

  ListBuilder<Object> _positionalArguments;
  ListBuilder<Object> get positionalArguments =>
      _$this._positionalArguments ??= new ListBuilder<Object>();
  set positionalArguments(ListBuilder<Object> positionalArguments) =>
      _$this._positionalArguments = positionalArguments;

  MapBuilder<Symbol, Object> _namedArguments;
  MapBuilder<Symbol, Object> get namedArguments =>
      _$this._namedArguments ??= new MapBuilder<Symbol, Object>();
  set namedArguments(MapBuilder<Symbol, Object> namedArguments) =>
      _$this._namedArguments = namedArguments;

  bool _isMethod;
  bool get isMethod => _$this._isMethod;
  set isMethod(bool isMethod) => _$this._isMethod = isMethod;

  bool _isGetter;
  bool get isGetter => _$this._isGetter;
  set isGetter(bool isGetter) => _$this._isGetter = isGetter;

  bool _isSetter;
  bool get isSetter => _$this._isSetter;
  set isSetter(bool isSetter) => _$this._isSetter = isSetter;

  SerializableInvocationBuilder();

  SerializableInvocationBuilder get _$this {
    if (_$v != null) {
      _memberName = _$v.memberName;
      _positionalArguments = _$v.positionalArguments?.toBuilder();
      _namedArguments = _$v.namedArguments?.toBuilder();
      _isMethod = _$v.isMethod;
      _isGetter = _$v.isGetter;
      _isSetter = _$v.isSetter;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SerializableInvocation other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SerializableInvocation;
  }

  @override
  void update(void updates(SerializableInvocationBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SerializableInvocation build() {
    _$SerializableInvocation _$result;
    try {
      _$result = _$v ??
          new _$SerializableInvocation._(
              memberName: memberName,
              positionalArguments: positionalArguments.build(),
              namedArguments: namedArguments.build(),
              isMethod: isMethod,
              isGetter: isGetter,
              isSetter: isSetter);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'positionalArguments';
        positionalArguments.build();
        _$failedField = 'namedArguments';
        namedArguments.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SerializableInvocation', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
