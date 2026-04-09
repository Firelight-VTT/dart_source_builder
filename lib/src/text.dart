import 'package:dart_source_builder/src/base_statement.dart';

/// Emits a double-quoted text literal.
class Text extends BaseStatement {
  final String text;

  /// Creates a [Text] using `text`.
  Text(this.text);

  @override
  String build() {
    return '"$text"';
  }
}