import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';

/// Emits an `import` directive with optional prefix and combinators.
class Import extends Line {
  String importPath;
  final String? prefix;
  final String? show;
  final String? hide;

  /// Creates an import directive for [importPath] with optional alias [prefix],
  /// optional `show` combinator [show], and optional `hide` combinator [hide].
  Import({required this.importPath, this.prefix, this.show, this.hide}): super(Literal("import '$importPath'${prefix != null ? " as $prefix" : ""}${show != null ? " show $show" : ""}${hide != null ? " hide $hide" : ""}"));

}
