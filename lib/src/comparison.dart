import 'package:dart_source_builder/src/base_statement.dart';

/// Emits a comparison expression such as `left == right` or `left >= right`.
class Comparison extends BaseStatement{
  final BaseStatement left;
  final BaseStatement right;
  final ComparisonOperator operator;

  /// Creates a [Comparison] using `left`, `operator`, and `right`.
  Comparison({
    required this.left,
    required this.operator,
    required this.right,
  });
  
  @override
  String build() {
    return '$left ${operator.symbol} $right';
  }
}


/// Available relational operators for [Comparison].
enum ComparisonOperator {
  equal,
  notEqual,
  lessThan,
  lessThanOrEqual,
  greaterThan,
  greaterThanOrEqual
}

/// Maps [ComparisonOperator] values to their Dart token strings.
extension ComparisonOperatorExtension on ComparisonOperator {
  String get symbol {
    switch (this) {
      case ComparisonOperator.equal:
        return '==';
      case ComparisonOperator.notEqual:
        return '!=';
      case ComparisonOperator.lessThan:
        return '<';
      case ComparisonOperator.lessThanOrEqual:
        return '<=';
      case ComparisonOperator.greaterThan:
        return '>';
      case ComparisonOperator.greaterThanOrEqual:
        return '>=';
    }
  }
}