import 'package:dart_source_builder/src/base_statement.dart';

class StringBuilder extends BaseStatement {
  final String content;
  bool useSingleQuotes;

  StringBuilder(this.content, {this.useSingleQuotes = false});

  @override
  String build() {
    if (useSingleQuotes) {
      return "'$content'";
    }
    return "\"$content\"";
  }
}