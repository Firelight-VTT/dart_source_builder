import 'package:dart_source_builder/dart_source_builder.dart';

class CommentLine extends Line {
  String comment;
  CommentLine(this.comment) : super(Literal(''));

  @override
  String build() {
    return "// $comment\n";
  }
}