import 'package:dart_source_builder/src/internals/indent.dart';
import 'package:dart_source_builder/src/internals/source_builder.dart';

class Line extends SourceBuilder {
  final SourceBuilder content;

  Line(this.content);

  @override
  String build() {
    final indent = Indent();
    return "$indent$content;\n";
  }
}