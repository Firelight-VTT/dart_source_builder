import 'package:dart_source_builder/src/internals/base_statement.dart';

class Literal extends BaseStatement{

  final String content;

  Literal(this.content);

  @override
  String build() {
    return content;
  }

}