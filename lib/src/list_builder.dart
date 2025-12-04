import 'package:dart_source_builder/src/base_statement.dart';

class ListBuilder extends BaseStatement{
  List<BaseStatement> elements;

  ListBuilder(this.elements);

  @override
  String build() {
    return "[${elements.join(", ")}]";
  }
}
