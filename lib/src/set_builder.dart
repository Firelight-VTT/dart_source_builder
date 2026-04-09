import 'package:dart_source_builder/src/base_statement.dart';

/// Emits a Dart set literal from expression elements.
class SetBuilder extends BaseStatement{
  List<BaseStatement> elements;

  /// Creates a [SetBuilder] using `elements`.
  SetBuilder(this.elements);

  @override
  String build() {
    return "{${elements.join(", ")}}";
  }
}