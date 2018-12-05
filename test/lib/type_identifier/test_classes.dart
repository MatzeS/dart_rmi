import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'test_classes.g.dart';

abstract class Test implements Built<Test, TestBuilder> {
  static Serializer<Test> get serializer => _$testSerializer;
  String get aString;
  num get aNum;
  Test._();
  factory Test([updates(TestBuilder b)]) = _$Test;
}
