import 'package:dart_source_builder/src/base_statement.dart';

/// Wraps an inner expression in parentheses.
class Parens extends BaseStatement {
  final BaseStatement inner;

  /// Creates a [Parens] using `inner`.
  Parens({
    required this.inner,
  });

  @override
  String build() {
    return '($inner)';
  }
}