// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packets.dart';

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

Serializer<Query> _$querySerializer = new _$QuerySerializer();
Serializer<Response> _$responseSerializer = new _$ResponseSerializer();

class _$QuerySerializer implements StructuredSerializer<Query> {
  @override
  final Iterable<Type> types = const [Query, _$Query];
  @override
  final String wireName = 'Query';

  @override
  Iterable serialize(Serializers serializers, Query object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'uuid',
      serializers.serialize(object.uuid, specifiedType: const FullType(String)),
      'invocation',
      serializers.serialize(object.invocation,
          specifiedType: const FullType(SerializableInvocation)),
    ];

    return result;
  }

  @override
  Query deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QueryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'uuid':
          result.uuid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'invocation':
          result.invocation.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SerializableInvocation))
              as SerializableInvocation);
          break;
      }
    }

    return result.build();
  }
}

class _$ResponseSerializer implements StructuredSerializer<Response> {
  @override
  final Iterable<Type> types = const [Response, _$Response];
  @override
  final String wireName = 'Response';

  @override
  Iterable serialize(Serializers serializers, Response object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'query',
      serializers.serialize(object.query,
          specifiedType: const FullType(String)),
    ];
    if (object.returnValue != null) {
      result
        ..add('returnValue')
        ..add(serializers.serialize(object.returnValue,
            specifiedType: const FullType(Object)));
    }
    if (object.exception != null) {
      result
        ..add('exception')
        ..add(serializers.serialize(object.exception,
            specifiedType: const FullType(Object)));
    }

    return result;
  }

  @override
  Response deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'query':
          result.query = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'returnValue':
          result.returnValue = serializers.deserialize(value,
              specifiedType: const FullType(Object));
          break;
        case 'exception':
          result.exception = serializers.deserialize(value,
              specifiedType: const FullType(Object));
          break;
      }
    }

    return result.build();
  }
}

class _$Query extends Query {
  @override
  final String uuid;
  @override
  final SerializableInvocation invocation;

  factory _$Query([void updates(QueryBuilder b)]) =>
      (new QueryBuilder()..update(updates)).build();

  _$Query._({this.uuid, this.invocation}) : super._() {
    if (uuid == null) {
      throw new BuiltValueNullFieldError('Query', 'uuid');
    }
    if (invocation == null) {
      throw new BuiltValueNullFieldError('Query', 'invocation');
    }
  }

  @override
  Query rebuild(void updates(QueryBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  QueryBuilder toBuilder() => new QueryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Query &&
        uuid == other.uuid &&
        invocation == other.invocation;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, uuid.hashCode), invocation.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Query')
          ..add('uuid', uuid)
          ..add('invocation', invocation))
        .toString();
  }
}

class QueryBuilder implements Builder<Query, QueryBuilder> {
  _$Query _$v;

  String _uuid;
  String get uuid => _$this._uuid;
  set uuid(String uuid) => _$this._uuid = uuid;

  SerializableInvocationBuilder _invocation;
  SerializableInvocationBuilder get invocation =>
      _$this._invocation ??= new SerializableInvocationBuilder();
  set invocation(SerializableInvocationBuilder invocation) =>
      _$this._invocation = invocation;

  QueryBuilder();

  QueryBuilder get _$this {
    if (_$v != null) {
      _uuid = _$v.uuid;
      _invocation = _$v.invocation?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Query other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Query;
  }

  @override
  void update(void updates(QueryBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Query build() {
    _$Query _$result;
    try {
      _$result =
          _$v ?? new _$Query._(uuid: uuid, invocation: invocation.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'invocation';
        invocation.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Query', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Response extends Response {
  @override
  final String query;
  @override
  final Object returnValue;
  @override
  final Object exception;

  factory _$Response([void updates(ResponseBuilder b)]) =>
      (new ResponseBuilder()..update(updates)).build();

  _$Response._({this.query, this.returnValue, this.exception}) : super._() {
    if (query == null) {
      throw new BuiltValueNullFieldError('Response', 'query');
    }
  }

  @override
  Response rebuild(void updates(ResponseBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ResponseBuilder toBuilder() => new ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Response &&
        query == other.query &&
        returnValue == other.returnValue &&
        exception == other.exception;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, query.hashCode), returnValue.hashCode), exception.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Response')
          ..add('query', query)
          ..add('returnValue', returnValue)
          ..add('exception', exception))
        .toString();
  }
}

class ResponseBuilder implements Builder<Response, ResponseBuilder> {
  _$Response _$v;

  String _query;
  String get query => _$this._query;
  set query(String query) => _$this._query = query;

  Object _returnValue;
  Object get returnValue => _$this._returnValue;
  set returnValue(Object returnValue) => _$this._returnValue = returnValue;

  Object _exception;
  Object get exception => _$this._exception;
  set exception(Object exception) => _$this._exception = exception;

  ResponseBuilder();

  ResponseBuilder get _$this {
    if (_$v != null) {
      _query = _$v.query;
      _returnValue = _$v.returnValue;
      _exception = _$v.exception;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Response other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Response;
  }

  @override
  void update(void updates(ResponseBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Response build() {
    final _$result = _$v ??
        new _$Response._(
            query: query, returnValue: returnValue, exception: exception);
    replace(_$result);
    return _$result;
  }
}
