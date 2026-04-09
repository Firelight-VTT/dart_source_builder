import 'package:dart_source_builder/src/base_statement.dart';

/// Emits a Dart list literal using square-bracket syntax.
class ArrayBuilder extends BaseStatement{
  List<BaseStatement> elements;

  /// Creates a [ArrayBuilder] using `elements`.
  ArrayBuilder(this.elements);

  @override
  String build() {
    return "[${elements.join(", ")}]";
  }
}