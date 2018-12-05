import 'package:build/build.dart';

import 'package:source_gen/source_gen.dart';
import 'remote_method_invocation_generator.dart';

Builder rmiBuilder(BuilderOptions options) =>
    new SharedPartBuilder([new RmiGenerator(options)], 'rmi');
