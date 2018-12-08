import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'proxy_generator.dart';
import 'invoker_generator.dart';
import 'rmi_generator.dart';

Builder proxyBuilder(BuilderOptions options) =>
    new SharedPartBuilder([new ProxyGenerator(options)], 'proxy');
Builder invokerBuilder(BuilderOptions options) =>
    new SharedPartBuilder([new InvokerGenerator(options)], 'invoker');
Builder rmiBuilder(BuilderOptions options) =>
    new SharedPartBuilder([new RmiGenerator(options)], 'rmi');
