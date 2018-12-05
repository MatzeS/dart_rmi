import 'package:build/build.dart';

import 'package:source_gen/source_gen.dart';
import 'remote_method_invocation_generator.dart';

Builder rpcBuilder(BuilderOptions options) =>
    new SharedPartBuilder([new RpcGenerator(options)], 'rpc');
