import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';

/// Emits a `part of` directive line.
class PartOf extends Line {
  String importPath;

  /// Creates a [PartOf] using `importPath`.
  PartOf({required this.importPath}): super(Literal("part of '$importPath'"));

}
