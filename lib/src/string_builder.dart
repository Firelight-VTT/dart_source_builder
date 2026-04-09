import 'package:dart_source_builder/src/base_statement.dart';

/// Emits a quoted string literal using single or double quotes.
class StringBuilder extends BaseStatement {
  final String content;
  bool useSingleQuotes;

  /// Creates a [StringBuilder] using `content` and `useSingleQuotes`.
  StringBuilder(this.content, {this.useSingleQuotes = false});

  @override
  String build() {
    if (useSingleQuotes) {
      return "'$content'";
    }
    return "\"$content\"";
  }
}