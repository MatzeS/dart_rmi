import '../../type_identifier/test_classes.dart';
import 'package:built_value/serializer.dart';

part 'some.g.dart';

@SerializersFor(const [
  Test,
])
final Serializers serializers = _$serializers;

main() {
  Test test = Test((b) => b
    ..aNum = 10
    ..aString = 'asdf');

  print(test);
  print(test.runtimeType);
  print(test.runtimeType.runtimeType);

  Object serialized = serializers.serialize(test);

  print(serialized.toString());
  print(serialized.runtimeType);

  Test test2 = serializers.deserialize(serialized);
  print(test);
}
