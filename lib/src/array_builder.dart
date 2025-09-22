import 'package:dart_source_builder/src/internals/base_statement.dart';

class ArrayBuilder extends BaseStatement{
  List<BaseStatement> elements;

  ArrayBuilder(this.elements);

  @override
  String build() {
    return "[${elements.join(", ")}]";
  }
}