// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializable_invocation.dart';

// **************************************************************************
// SerializableGenerator
// **************************************************************************

abstract class _$SerializableInvocationSerializable extends SerializableMap {
  Symbol get memberName;
  List<Type> get typeArguments;
  List<dynamic> get positionalArguments;
  Map<Symbol, dynamic> get namedArguments;
  bool get isMethod;
  bool get isGetter;
  bool get isSetter;
  void set memberName(Symbol v);
  void set typeArguments(List<Type> v);
  void set positionalArguments(List<dynamic> v);
  void set namedArguments(Map<Symbol, dynamic> v);
  void set isMethod(bool v);
  void set isGetter(bool v);
  void set isSetter(bool v);

  operator [](Object __key) {
    switch (__key) {
      case 'memberName':
        return memberName;
      case 'typeArguments':
        return typeArguments;
      case 'positionalArguments':
        return positionalArguments;
      case 'namedArguments':
        return namedArguments;
      case 'isMethod':
        return isMethod;
      case 'isGetter':
        return isGetter;
      case 'isSetter':
        return isSetter;
    }
    throwFieldNotFoundException(__key, 'SerializableInvocation');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'memberName':
        memberName = fromSerialized(__value, () => new Symbol());
        return;
      case 'typeArguments':
        typeArguments =
            fromSerialized(__value, [() => new List<Type>(), () => new Type()]);
        return;
      case 'positionalArguments':
        positionalArguments =
            fromSerialized(__value, () => new List<dynamic>());
        return;
      case 'namedArguments':
        namedArguments = fromSerialized(__value,
            [() => new Map<Symbol, dynamic>(), () => new Symbol(), null]);
        return;
      case 'isMethod':
        isMethod = __value;
        return;
      case 'isGetter':
        isGetter = __value;
        return;
      case 'isSetter':
        isSetter = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'SerializableInvocation');
  }

  Iterable<String> get keys => const [
        'memberName',
        'typeArguments',
        'positionalArguments',
        'namedArguments',
        'isMethod',
        'isGetter',
        'isSetter'
      ];
}
