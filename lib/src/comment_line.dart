import 'package:dart_source_builder/dart_source_builder.dart';
import 'package:dart_source_builder/src/internals/indent.dart';

/// Emits a single-line comment prefixed with `//`.
class CommentLine extends Line {
  String comment;
  /// Creates a [CommentLine] using `comment`.
  CommentLine(this.comment) : super(Literal(''));

  @override
  String build() {
    final indent = Indent();
    return "$indent// $comment\n";
  }
}