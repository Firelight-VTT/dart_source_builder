import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';

/// Emits a `library;` directive line.
class Library extends Line {
  /// Creates a [Library] with default configuration.
  Library(): super(Literal("library"));
}