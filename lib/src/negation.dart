import 'package:dart_source_builder/src/base_statement.dart';

/// Emits unary logical negation for an expression.
class Negation extends BaseStatement {
  BaseStatement statement;

  /// Creates a [Negation] using `statement`.
  Negation({
    required this.statement,
  });

  @override
  String build() {
    return '!${statement.build()}';
  }
}