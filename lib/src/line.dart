import 'package:dart_source_builder/src/internals/indent.dart';
import 'package:dart_source_builder/src/internals/source_builder.dart';

/// Wraps a [SourceBuilder] and emits it as an indented statement ending with `;`.
class Line extends SourceBuilder {
  final SourceBuilder content;

  /// Creates a [Line] using `content`.
  Line(this.content);

  @override
  String build() {
    final indent = Indent();
    return "$indent$content;\n";
  }
}