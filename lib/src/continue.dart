import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';

/// Emits a `continue;` statement line.
class Continue extends Line {
  /// Creates a [Continue] with default configuration.
  Continue(): super(Literal("continue"));
}
