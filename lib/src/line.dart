import 'package:dart_source_builder/src/internals/source_builder.dart';

class Line extends SourceBuilder {
  final SourceBuilder content;

  Line(this.content);

  @override
  String build() {
    return "$content;\n";
  }
}