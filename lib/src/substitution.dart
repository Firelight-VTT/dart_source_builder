import 'package:dart_source_builder/src/base_statement.dart';

class Substitution extends BaseStatement {
  final BaseStatement booleanExpression;
  final BaseStatement trueExpression;
  final BaseStatement falseExpression;

  Substitution(
      this.booleanExpression, this.trueExpression, this.falseExpression);

  @override
  String build() {
    return "${booleanExpression.build()} ? ${trueExpression.build()} : ${falseExpression.build()}";
  }
}