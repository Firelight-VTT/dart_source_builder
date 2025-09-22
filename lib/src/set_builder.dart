import 'package:dart_source_builder/src/base_statement.dart';

class SetBuilder extends BaseStatement{
  List<BaseStatement> elements;

  SetBuilder(this.elements);

  @override
  String build() {
    return "{${elements.join(", ")}}";
  }
}