import 'package:dart_source_builder/src/base_statement.dart';

/// Emits raw source text exactly as provided.
class Literal extends BaseStatement{

  final String content;

  /// Creates a [Literal] using `content`.
  Literal(this.content);

  @override
  String build() {
    return content;
  }

}