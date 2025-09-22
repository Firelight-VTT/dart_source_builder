import 'package:dart_source_builder/dart_source_builder.dart';
import 'package:dart_source_builder/src/internals/indent.dart';

class CommentLine extends Line {
  String comment;
  CommentLine(this.comment) : super(Literal(''));

  @override
  String build() {
    final indent = Indent();
    return "$indent// $comment\n";
  }
}