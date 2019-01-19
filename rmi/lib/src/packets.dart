import 'package:json_annotation/json_annotation.dart';
part 'packets.g.dart';

@JsonSerializable()
class TransferredObject {
  String serializedObject;

  RemoteStub remote;

  String future;

  String stream;

  bool get isObject => serializedObject != null;
  bool get isRemote => remote != null;
  bool get isFuture => future != null;
  bool get isStream => stream != null;

  TransferredObject();
  factory TransferredObject.forRemote(RemoteStub remote) =>
      new TransferredObject()..remote = remote;
  factory TransferredObject.forObject(String serializedObject) =>
      new TransferredObject()..serializedObject = serializedObject;
  factory TransferredObject.forStream(String stream) =>
      new TransferredObject()..stream = stream;
  factory TransferredObject.forFuture(String future) =>
      new TransferredObject()..future = future;

  Map<String, dynamic> toJson() => _$TransferredObjectToJson(this);
  static TransferredObject fromJson(Map<String, dynamic> json) =>
      _$TransferredObjectFromJson(json);
}

@JsonSerializable()
class Resolution {
  TransferredObject object;
  TransferredException exception;

  Resolution({this.object, this.exception});

  bool get isException => exception != null;

  Map<String, dynamic> toJson() => _$ResolutionToJson(this);
  static Resolution fromJson(Map<String, dynamic> json) =>
      _$ResolutionFromJson(json);
}

@JsonSerializable()
class FutureResolution {
  String uuid;
  Resolution resolution;

  Map<String, dynamic> toJson() => _$FutureResolutionToJson(this);
  static FutureResolution fromJson(Map<String, dynamic> json) =>
      _$FutureResolutionFromJson(json);
}

@JsonSerializable()
class TransferredException {
  String message;

  TransferredException();
  factory TransferredException.fromException(Exception exception) =>
      new TransferredException()..message = exception.toString();

  Map<String, dynamic> toJson() => _$TransferredExceptionToJson(this);
  static TransferredException fromJson(Map<String, dynamic> json) =>
      _$TransferredExceptionFromJson(json);
}

@JsonSerializable()
class Query {
  String uuid;
  String targetUuid;

  @SymbolConverter()
  Symbol memberName;

  bool isGetter;
  bool isSetter;
  List<TransferredObject> positionalArguments = [];
  Map<String, TransferredObject> namedArguments = {};

  Query();

  Map<String, dynamic> toJson() => _$QueryToJson(this);
  static Query fromJson(Map<String, dynamic> json) => _$QueryFromJson(json);
}

@JsonSerializable()
class Response {
  /// uuid of the query this responds to
  String query;

  Resolution resolution;

  Response(this.query);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
  static Response fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
}

/// Not directly a packet but a argument replacement for a remote object
@JsonSerializable()
class RemoteStub {
  String uuid;
  String type;

  RemoteStub(this.uuid, this.type);

  Map<String, dynamic> toJson() => _$RemoteStubToJson(this);
  static RemoteStub fromJson(Map<String, dynamic> json) =>
      _$RemoteStubFromJson(json);
}

class SymbolConverter implements JsonConverter<Symbol, String> {
  const SymbolConverter();

  @override
  Symbol fromJson(String json) {
    int start = json.indexOf('"');
    int end = json.lastIndexOf('"');
    String stripped = json.substring(start + 1, end);
    return new Symbol(stripped);
  }

  @override
  String toJson(Symbol object) {
    return object.toString();
  }
}
