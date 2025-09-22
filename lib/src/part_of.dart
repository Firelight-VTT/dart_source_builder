import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';
import 'package:dart_source_builder/src/internals/source_builder.dart';

class PartOf extends Line {
  String importPath;

  PartOf({required this.importPath}): super(Literal("part of '$importPath'"));

}
