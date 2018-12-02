library invoker_generator;

import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:invoker/invoker.dart';

class InvokerGenerator extends Generator {
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) {
    return '';
  }
}
