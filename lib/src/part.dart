import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';
import 'package:dart_source_builder/src/internals/source_builder.dart';

class Part extends Line {
  String importPath;

  Part({required this.importPath}): super(Literal("part '$importPath'"));

}
