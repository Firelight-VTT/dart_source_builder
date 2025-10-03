import 'package:dart_source_builder/dart_source_builder.dart';

class EmptyLine extends Line {
  EmptyLine() : super(Literal(''));

  @override
  String build() {
    return "\n\n";
  }
}