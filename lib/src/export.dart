import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';

/// Emits an `export` directive with optional `show` and `hide` combinators.
class Export extends Line {
  String exportPath;
  final String? show;
  final String? hide;

  /// Creates a [Export] using `exportPath`, `show`, and `hide`.
  Export({required this.exportPath, this.show, this.hide}): super(Literal("export '$exportPath'${show != null ? " show $show" : ""}${hide != null ? " hide $hide" : ""}"));

}
