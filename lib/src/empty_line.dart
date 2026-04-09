import 'package:dart_source_builder/dart_source_builder.dart';

/// Emits an empty spacer line in generated output.
class EmptyLine extends Line {
  /// Creates a [EmptyLine] with default configuration.
  EmptyLine() : super(Literal(''));

  @override
  String build() {
    return "\n\n";
  }
}