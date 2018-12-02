import 'package:build/build.dart';

import 'package:source_gen/source_gen.dart';
import 'proxy_generator.dart';

Builder proxyBuilder(BuilderOptions options) =>
    new SharedPartBuilder([new ProxyGenerator()], 'proxy');
