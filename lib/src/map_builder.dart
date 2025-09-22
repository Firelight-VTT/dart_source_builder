import 'package:dart_source_builder/src/internals/base_statement.dart';
import 'package:dart_source_builder/src/literal.dart';

class MapBuilder extends BaseStatement{
  List<KvBuilder> elements;

  MapBuilder(this.elements);

  @override
  String build() {
    return "{${elements.join(", ")}}";
  }
}

class KvBuilder extends BaseStatement{
  String key;
  Literal value;

  KvBuilder(this.key, this.value);

  @override
  String build() {
    return "$key: $value";
  }
}