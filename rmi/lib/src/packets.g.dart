// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferredObject _$TransferredObjectFromJson(Map<String, dynamic> json) {
  return TransferredObject()
    ..json = json['json'] as String
    ..stub = json['stub'] == null
        ? null
        : RemoteStub.fromJson(json['stub'] as Map<String, dynamic>);
}

Map<String, dynamic> _$TransferredObjectToJson(TransferredObject instance) =>
    <String, dynamic>{'json': instance.json, 'stub': instance.stub};

Query _$QueryFromJson(Map<String, dynamic> json) {
  return Query()
    ..uuid = json['uuid'] as String
    ..targetUuid = json['targetUuid'] as String
    ..memberName = json['memberName'] == null
        ? null
        : const SymbolConverter().fromJson(json['memberName'] as String)
    ..isGetter = json['isGetter'] as bool
    ..isSetter = json['isSetter'] as bool
    ..positionalArguments = (json['positionalArguments'] as List)
        ?.map((e) => e == null
            ? null
            : TransferredObject.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..namedArguments = (json['namedArguments'] as Map<String, dynamic>)?.map(
        (k, e) => MapEntry(
            k,
            e == null
                ? null
                : TransferredObject.fromJson(e as Map<String, dynamic>)));
}

Map<String, dynamic> _$QueryToJson(Query instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'targetUuid': instance.targetUuid,
      'memberName': instance.memberName == null
          ? null
          : const SymbolConverter().toJson(instance.memberName),
      'isGetter': instance.isGetter,
      'isSetter': instance.isSetter,
      'positionalArguments': instance.positionalArguments,
      'namedArguments': instance.namedArguments
    };

Response _$ResponseFromJson(Map<String, dynamic> json) {
  return Response(
      json['query'] as String,
      json['returnValue'] == null
          ? null
          : TransferredObject.fromJson(
              json['returnValue'] as Map<String, dynamic>),
      json['returnedNull'] as bool,
      json['exception'] as String);
}

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'query': instance.query,
      'returnedNull': instance.returnedNull,
      'returnValue': instance.returnValue,
      'exception': instance.exception
    };

RemoteStub _$RemoteStubFromJson(Map<String, dynamic> json) {
  return RemoteStub(json['uuid'] as String, json['type'] as String);
}

Map<String, dynamic> _$RemoteStubToJson(RemoteStub instance) =>
    <String, dynamic>{'uuid': instance.uuid, 'type': instance.type};
