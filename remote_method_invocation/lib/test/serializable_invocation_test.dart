import 'package:test/test.dart';
import '../src/serializable_invocation.dart';
import 'package:serializable/serializable.dart';
import 'dart:convert';

main() {
  group('serializable invocation tests', () {
    test('simple test', () {
      Invocation invocation = Invocation.method(#simpleMethod, []);
      SerializableInvocation serializableInvocation =
          convertInvocation(invocation);

      print('p1: ${jsonEncode(serializableInvocation)}');
    });
  });
}
