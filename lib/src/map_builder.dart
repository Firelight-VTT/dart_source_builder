import 'package:dart_source_builder/src/base_statement.dart';
import 'package:dart_source_builder/src/literal.dart';

/// Emits a Dart map literal from key-value entries.
class MapBuilder extends BaseStatement{
  List<KvBuilder> elements;

  /// Creates a [MapBuilder] using `elements`.
  MapBuilder(this.elements);

  @override
  String build() {
    return "{${elements.join(", ")}}";
  }
}

/// Represents a single key-value pair inside a [MapBuilder].
class KvBuilder extends BaseStatement{
  String key;
  Literal value;

  /// Creates a [KvBuilder] using `key` and `value`.
  KvBuilder(this.key, this.value);

  @override
  String build() {
    return "$key: $value";
  }
}