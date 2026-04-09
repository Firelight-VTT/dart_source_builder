import 'package:dart_source_builder/src/internals/source_builder.dart';
import 'package:dart_source_builder/src/base_statement.dart';

/// Emits a simple assignment expression in the form `target = rhs`.
class Assignment extends SourceBuilder {
  String targetName;
  BaseStatement rhs;


  /// Creates a [Assignment] using `targetName` and `rhs`.
  Assignment({
    required this.targetName,
    required this.rhs,
  });

  @override
  String build() {
    return "$targetName = $rhs";
  }

}