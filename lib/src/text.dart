import 'package:dart_source_builder/src/base_statement.dart';

class Text extends BaseStatement {
  final String text;

  Text(this.text);

  @override
  String build() {
    return '"$text"';
  }
}