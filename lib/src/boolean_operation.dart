import 'package:dart_source_builder/src/base_statement.dart';

/// Emits a boolean binary expression such as `a && b` or `a || b`.
class BooleanOperation extends BaseStatement {
  BaseStatement left;
  BaseStatement right;
  BooleanOperator operator;

  /// Creates a [BooleanOperation] using `left`, `right`, and `operator`.
  BooleanOperation({
    required this.left,
    required this.right,
    required this.operator,
  });

  @override
  String build() {
    return "${left.build()} ${operator.symbol} ${right.build()}";
  }
}

/// Available boolean operators for [BooleanOperation].
enum BooleanOperator{
  and,
  or,
}

/// Maps [BooleanOperator] values to their Dart token strings.
extension BooleanOperatorExtension on BooleanOperator{
  String get symbol{
    switch(this){
      case BooleanOperator.and:
        return "&&";
      case BooleanOperator.or:
        return "||";
    }
  }
}