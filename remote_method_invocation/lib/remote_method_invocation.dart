library remote_method_invocation;

import 'package:invoker/invoker.dart';
import 'package:proxy/proxy.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';
import 'dart:async';
import 'dart:convert';

import 'src/implementation.dart';

export 'src/serializable_invocation.dart';
export 'src/symbol_serializer.dart';
export 'src/implementation.dart';

abstract class RmiTarget implements Invocable, Proxy {}

class Connection {
  Stream<String> input;
  StreamSink<String> output;
  Connection(this.input, this.output);
}

void rmiExposeRemote(Connection connection, Invocable target) =>
    internalExposeRemote(connection, target);
