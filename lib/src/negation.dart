import 'package:dart_source_builder/src/internals/base_statement.dart';

class Negation extends BaseStatement {
  BaseStatement statement;

  Negation({
    required this.statement,
  });

  @override
  String build() {
    return '!${statement.build()}';
  }
}