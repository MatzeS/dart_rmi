import 'dart:async';
import 'dart:convert';
import '../remote_method_invocation.dart';
import 'package:uuid/uuid.dart';
import 'packets.dart';
import '../invoker.dart';

import 'package:json_annotation/json_annotation.dart';

part 'json_serialization.g.dart';

@JsonSerializable()
class PrimitiveWrapper {
  Object wrapped;

  PrimitiveWrapper();

  Map<String, dynamic> toJson() => _$PrimitiveWrapperToJson(this);
  static PrimitiveWrapper fromJson(Map<String, dynamic> json) =>
      _$PrimitiveWrapperFromJson(json);
}

typedef Object FromJson(Map<String, dynamic> json);
Map<String, FromJson> fromJsonFunctions = {
  'asset:rmi/lib/src/packets.dart#Query': Query.fromJson,
  'asset:rmi/lib/src/packets.dart#Response': Response.fromJson,
  'asset:rmi/lib/src/packets.dart#RemoteStub': RemoteStub.fromJson,
  'asset:rmi/lib/src/packets.dart#TransferredObject':
      TransferredObject.fromJson,
  "asset:rmi/lib/src/json_serialization.dart#PrimitiveWrapper":
      PrimitiveWrapper.fromJson
};

void addDeserialize(String className, FromJson deserialize) {
  fromJsonFunctions.putIfAbsent(className, () => deserialize);
}

class JsonSerialization extends Serialization {
  Map<String, Deserializer> deserializers = {};

  JsonSerialization() {
    fromJsonFunctions.forEach((k, v) => deserializers[k] = (x) => v(x));
  }

  void registerDeserializer(String key, Deserializer deserializer) {
    deserializers.putIfAbsent(key, () => deserializer);
  }

  @override
  String serialize(Object object) {
    Object transfer = object;
    if (object == null ||
        object is num ||
        object is String ||
        object is Map ||
        object is Iterable) {
      PrimitiveWrapper wrapper = new PrimitiveWrapper();
      wrapper.wrapped = object;
      transfer = wrapper;
    }

    return const JsonEncoder.withIndent(' ').convert(transfer);

    // Map<String, String> result = {};
    // result['object'] = objectString;
    // result['class'] = object.runtimeType.toString();
    // return json.encode(result);
  }

  @override
  Object deserialize(dynamic data) {
    Map<String, dynamic> decoded = json.decode(data);

    String key = decoded['json_serializable.className'];
    Deserializer deserialize = deserializers[key];
    if (deserialize == null) {
      throw new Exception(
          "cannot deserialize $data, no deserializer registered");
    }

    Object deserialized = deserialize(decoded);
    if (deserialized is PrimitiveWrapper) return deserialized.wrapped;
    return deserialized;

    // String className = result['class'];
    // String objectString = result['object'];

    // if (className == 'Null') return null;

    // Object decoded = json.decode(objectString);
    // if (decoded is Map) {
    //   Map<String, dynamic> objectMap = decoded;
    //   return fromJsonFunctions[className](objectMap);
    // } else {
    //   //TODO cleanup
    //   return decoded;
    // }
  }
}
