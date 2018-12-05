import 'serializable_invocation.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'packets.g.dart';

abstract class Query implements Built<Query, QueryBuilder> {
  String get uuid;
  SerializableInvocation get invocation;

  static Serializer<Query> get serializer => _$querySerializer;
  Query._();
  factory Query([updates(QueryBuilder b)]) = _$Query;
}

abstract class Response implements Built<Response, ResponseBuilder> {
  /// uuid of the query this responds to
  String get query;

  @nullable
  Object get returnValue;
  @nullable
  Object get exception;

  static Serializer<Response> get serializer => _$responseSerializer;
  Response._();
  factory Response([updates(ResponseBuilder b)]) = _$Response;
}
