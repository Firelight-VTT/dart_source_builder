import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';

class Export extends Line {
  String exportPath;
  final String? show;
  final String? hide;

  Export({required this.exportPath, this.show, this.hide}): super(Literal("export '$exportPath'${show != null ? " show $show" : ""}${hide != null ? " hide $hide" : ""}"));

}
