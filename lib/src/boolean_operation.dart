import 'package:dart_source_builder/src/base_statement.dart';

class BooleanOperation extends BaseStatement {
  BaseStatement left;
  BaseStatement right;
  BooleanOperator operator;

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

enum BooleanOperator{
  and,
  or,
}

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