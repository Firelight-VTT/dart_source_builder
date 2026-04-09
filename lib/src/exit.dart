import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';

/// Emits an `exit(code);` statement line.
class Exit extends Line {
  /// Creates a [Exit] using `exitCode`.
  Exit(int? exitCode): super(Literal("exit($exitCode)"));
}