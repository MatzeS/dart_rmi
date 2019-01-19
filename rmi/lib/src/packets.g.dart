// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferredObject _$TransferredObjectFromJson(Map<String, dynamic> json) {
  return TransferredObject()
    ..serializedObject = json['serializedObject'] as String
    ..remote = json['remote'] == null
        ? null
        : RemoteStub.fromJson(json['remote'] as Map<String, dynamic>)
    ..future = json['future'] as String
    ..stream = json['stream'] as String;
}

Map<String, dynamic> _$TransferredObjectToJson(TransferredObject instance) =>
    <String, dynamic>{
      'serializedObject': instance.serializedObject,
      'remote': instance.remote,
      'future': instance.future,
      'stream': instance.stream,
      'json_serializable.className':
          "asset:rmi/lib/src/packets.dart#TransferredObject",
    };

Resolution _$ResolutionFromJson(Map<String, dynamic> json) {
  return Resolution(
      object: json['object'] == null
          ? null
          : TransferredObject.fromJson(json['object'] as Map<String, dynamic>),
      exception: json['exception'] == null
          ? null
          : TransferredException.fromJson(
              json['exception'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ResolutionToJson(Resolution instance) =>
    <String, dynamic>{
      'object': instance.object,
      'exception': instance.exception,
      'json_serializable.className':
          "asset:rmi/lib/src/packets.dart#Resolution",
    };

FutureResolution _$FutureResolutionFromJson(Map<String, dynamic> json) {
  return FutureResolution()
    ..uuid = json['uuid'] as String
    ..resolution = json['resolution'] == null
        ? null
        : Resolution.fromJson(json['resolution'] as Map<String, dynamic>);
}

Map<String, dynamic> _$FutureResolutionToJson(FutureResolution instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'resolution': instance.resolution,
      'json_serializable.className':
          "asset:rmi/lib/src/packets.dart#FutureResolution",
    };

TransferredException _$TransferredExceptionFromJson(Map<String, dynamic> json) {
  return TransferredException()..message = json['message'] as String;
}

Map<String, dynamic> _$TransferredExceptionToJson(
        TransferredException instance) =>
    <String, dynamic>{
      'message': instance.message,
      'json_serializable.className':
          "asset:rmi/lib/src/packets.dart#TransferredException",
    };

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
      'namedArguments': instance.namedArguments,
      'json_serializable.className': "asset:rmi/lib/src/packets.dart#Query",
    };

Response _$ResponseFromJson(Map<String, dynamic> json) {
  return Response(json['query'] as String)
    ..resolution = json['resolution'] == null
        ? null
        : Resolution.fromJson(json['resolution'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'query': instance.query,
      'resolution': instance.resolution,
      'json_serializable.className': "asset:rmi/lib/src/packets.dart#Response",
    };

RemoteStub _$RemoteStubFromJson(Map<String, dynamic> json) {
  return RemoteStub(json['uuid'] as String, json['type'] as String);
}

Map<String, dynamic> _$RemoteStubToJson(RemoteStub instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'type': instance.type,
      'json_serializable.className':
          "asset:rmi/lib/src/packets.dart#RemoteStub",
    };
