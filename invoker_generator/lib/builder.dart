import 'package:build/build.dart';

import 'package:source_gen/source_gen.dart';
import 'invoker_generator.dart';

Builder invokerBuilder(BuilderOptions options) =>
    new SharedPartBuilder([new InvokerGenerator()], 'invoker');
