import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/internals/source_builder.dart';

/// Represents a full Dart file as an ordered collection of generated lines.
class File extends SourceBuilder{
  List<Line> lines;

  /// Creates a [File] using `lines`.
  File({required this.lines});
  
  @override
  String build() {
    StringBuffer string = StringBuffer();

    for (var line in lines) {
      string.write(line.build());
    }

    return string.toString();
  }
}