import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';

/// Emits a `break;` statement line.
class Break extends Line {
  /// Creates a [Break] with default configuration.
  Break(): super(Literal("break"));
}