import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';

class Import extends Line {
  String importPath;
  final String? prefix;
  final String? show;
  final String? hide;

  Import({required this.importPath, this.prefix, this.show, this.hide}): super(Literal("import '$importPath'${prefix != null ? " as $prefix" : ""}${show != null ? " show $show" : ""}${hide != null ? " hide $hide" : ""}"));

}
