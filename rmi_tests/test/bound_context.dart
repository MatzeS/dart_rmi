import 'package:rmi/rmi.dart';
import 'package:tuple/tuple.dart';
import 'dart:async';

Tuple2<Context, Context> createBoundContexts() {
  StreamController<String> exposeToGet = StreamController();
  StreamController<String> getToExpose = StreamController();

  return new Tuple2(
      new Context(exposeToGet.stream.asBroadcastStream(), getToExpose),
      new Context(getToExpose.stream.asBroadcastStream(), exposeToGet));
}
