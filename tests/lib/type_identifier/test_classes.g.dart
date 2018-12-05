// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_classes.dart';

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

Serializer<Test> _$testSerializer = new _$TestSerializer();

class _$TestSerializer implements StructuredSerializer<Test> {
  @override
  final Iterable<Type> types = const [Test, _$Test];
  @override
  final String wireName = 'Test';

  @override
  Iterable serialize(Serializers serializers, Test object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'aString',
      serializers.serialize(object.aString,
          specifiedType: const FullType(String)),
      'aNum',
      serializers.serialize(object.aNum, specifiedType: const FullType(num)),
    ];

    return result;
  }

  @override
  Test deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'aString':
          result.aString = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'aNum':
          result.aNum = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
      }
    }

    return result.build();
  }
}

class _$Test extends Test {
  @override
  final String aString;
  @override
  final num aNum;

  factory _$Test([void updates(TestBuilder b)]) =>
      (new TestBuilder()..update(updates)).build();

  _$Test._({this.aString, this.aNum}) : super._() {
    if (aString == null) {
      throw new BuiltValueNullFieldError('Test', 'aString');
    }
    if (aNum == null) {
      throw new BuiltValueNullFieldError('Test', 'aNum');
    }
  }

  @override
  Test rebuild(void updates(TestBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TestBuilder toBuilder() => new TestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Test && aString == other.aString && aNum == other.aNum;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, aString.hashCode), aNum.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Test')
          ..add('aString', aString)
          ..add('aNum', aNum))
        .toString();
  }
}

class TestBuilder implements Builder<Test, TestBuilder> {
  _$Test _$v;

  String _aString;
  String get aString => _$this._aString;
  set aString(String aString) => _$this._aString = aString;

  num _aNum;
  num get aNum => _$this._aNum;
  set aNum(num aNum) => _$this._aNum = aNum;

  TestBuilder();

  TestBuilder get _$this {
    if (_$v != null) {
      _aString = _$v.aString;
      _aNum = _$v.aNum;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Test other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Test;
  }

  @override
  void update(void updates(TestBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Test build() {
    final _$result = _$v ?? new _$Test._(aString: aString, aNum: aNum);
    replace(_$result);
    return _$result;
  }
}
