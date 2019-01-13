import 'package:json_annotation/json_annotation.dart';
part 'packets.g.dart';

@JsonSerializable()
class TransferredObject {
  String serialized;

  RemoteStub stub;

  bool get isStub => stub != null;

  TransferredObject();
  factory TransferredObject.forStub(RemoteStub stub) =>
      new TransferredObject()..stub = stub;
  factory TransferredObject.forSerialized(String serialized) =>
      new TransferredObject()..serialized = serialized;

  Map<String, dynamic> toJson() => _$TransferredObjectToJson(this);
  static TransferredObject fromJson(Map<String, dynamic> json) =>
      _$TransferredObjectFromJson(json);
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

  // `true` if the invocation returned null or an exception was raised
  bool returnedNull;
  TransferredObject returnValue;
  String exception; // TODO might serialize exception

  Response([this.query, this.returnValue, this.returnedNull, this.exception]);

  // reduce to exception != null
  factory Response.returned(String query, TransferredObject returnValue) =>
      new Response(query, returnValue, returnValue == null, null);
  factory Response.exeception(String query, String exception) =>
      new Response(query, null, false, exception);

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
