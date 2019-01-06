import 'package:json_annotation/json_annotation.dart';
part 'packets.g.dart';

@JsonSerializable()
class TransferredObject {
  String json;

  RemoteStub stub;

  bool get isStub => stub != null;

  TransferredObject();
  factory TransferredObject.forStub(RemoteStub stub) =>
      new TransferredObject()..stub = stub;
  factory TransferredObject.forJson(String json) =>
      new TransferredObject()..json = json;

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

class InvocationConverter
    implements JsonConverter<Invocation, Map<String, dynamic>> {
  const InvocationConverter();

  static SymbolConverter _symbolConverter = new SymbolConverter();

  @override
  Invocation fromJson(Map<String, dynamic> json) {
    Symbol memberName = _symbolConverter.fromJson(json['memberName']);
    if (json['isGetter']) {
      return new Invocation.getter(memberName);
    } else if (json['isSetter']) {
      return new Invocation.setter(
          memberName, json['positionalArguments'].first);
    } else {
      Map<Symbol, Object> namedArguments = {};
      (json['namedArguments'] as Map<String, dynamic>).forEach((k, v) {
        namedArguments[_symbolConverter.fromJson(k)] = v as Object;
      });

      return new Invocation.method(
          memberName, json['positionalArguments'], namedArguments);
    }
  }

  @override
  Map<String, dynamic> toJson(Invocation object) {
    Map<String, dynamic> result = {};

    result['memberName'] = _symbolConverter.toJson(object.memberName);
    result['positionalArguments'] = object.positionalArguments;
    result['namedArguments'] = object.namedArguments;
    result['isGetter'] = object.isGetter;
    result['isSetter'] = object.isSetter;

    return result;
  }
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
