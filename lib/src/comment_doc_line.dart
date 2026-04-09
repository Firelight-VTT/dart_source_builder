import 'package:dart_source_builder/dart_source_builder.dart';
import 'package:dart_source_builder/src/internals/indent.dart';

/// Emits a Dartdoc comment line prefixed with `///`.
class CommentDocLine extends Line {
  String comment;
  /// Creates a [CommentDocLine] using `comment`.
  CommentDocLine(this.comment) : super(Literal(''));

  @override
  String build() {
    final indent = Indent();
    return "$indent/// $comment\n";
  }
}