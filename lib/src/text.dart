import 'package:dart_source_builder/src/internals/base_statement.dart';

class Text extends BaseStatement {
  final String text;

  Text(this.text);

  @override
  String build() {
    return '"$text"';
  }
}