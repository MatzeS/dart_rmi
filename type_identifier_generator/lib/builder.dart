import 'package:build/build.dart';

import 'package:source_gen/source_gen.dart';
import 'type_identifier_generator.dart';

Builder invokerBuilder(BuilderOptions options) =>
    new SharedPartBuilder([new TypeIdentifierGenerator()], 'type_identifier');
