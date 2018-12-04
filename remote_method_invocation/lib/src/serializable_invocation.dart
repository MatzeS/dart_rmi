import 'package:serializable/serializable.dart';

part 'serializable_invocation.g.dart';

/// copy of Invocation class in order to make it serializable
@serializable
class SerializableInvocation extends _$SerializableInvocationSerializable {
  Symbol memberName;
  List<Type> typeArguments;
  List<dynamic> positionalArguments;
  Map<Symbol, dynamic> namedArguments;
  bool isMethod;

  bool isGetter;

  bool isSetter;

  SerializableInvocation(
      this.memberName,
      this.typeArguments,
      this.positionalArguments,
      this.namedArguments,
      this.isMethod,
      this.isGetter);
}

SerializableInvocation convertInvocation(Invocation invocation) {
  return new SerializableInvocation(
      invocation.memberName,
      invocation.typeArguments,
      invocation.positionalArguments,
      invocation.namedArguments,
      invocation.isMethod,
      invocation.isGetter);
}

Invocation convertSerializableInvocation(SerializableInvocation invocation) {
  if (invocation.isSetter) {
    return Invocation.setter(
        invocation.memberName, invocation.positionalArguments.first);
  } else if (invocation.isGetter) {
    return Invocation.getter(invocation.memberName);
  } else if (invocation.isMethod) {
    if (invocation.typeArguments.isEmpty) {
      return Invocation.method(
          invocation.memberName, invocation.positionalArguments);
    } else {
      return Invocation.genericMethod(invocation.memberName,
          invocation.typeArguments, invocation.positionalArguments);
    }
  } else {
    throw new Exception("could not identify invocation type");
  }
}
