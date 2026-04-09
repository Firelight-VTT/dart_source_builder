import 'package:dart_source_builder/src/base_statement.dart';

/// Emits a Dart list literal from expression elements.
class ListBuilder extends BaseStatement{
  List<BaseStatement> elements;

  /// Creates a [ListBuilder] using `elements`.
  ListBuilder(this.elements);

  @override
  String build() {
    return "[${elements.join(", ")}]";
  }
}
