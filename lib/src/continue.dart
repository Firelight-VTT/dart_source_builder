import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';
import 'package:dart_source_builder/src/internals/source_builder.dart';

class Continue extends Line {
  Continue(): super(Literal("continue"));
}
