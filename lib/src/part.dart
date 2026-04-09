import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';

/// Emits a `part` directive line.
class Part extends Line {
  String importPath;

  /// Creates a [Part] using `importPath`.
  Part({required this.importPath}): super(Literal("part '$importPath'"));

}
