import 'package:dart_source_builder/src/internals/base_statement.dart';

class Comparison extends BaseStatement{
  final BaseStatement left;
  final BaseStatement right;
  final ComparisonOperator operator;

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


enum ComparisonOperator {
  equal,
  notEqual,
  lessThan,
  lessThanOrEqual,
  greaterThan,
  greaterThanOrEqual
}

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