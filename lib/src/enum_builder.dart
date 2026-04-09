import 'package:dart_source_builder/dart_source_builder.dart';

/// Builds an enum declaration from a name and ordered value list.
class EnumBuilder extends Line{
  List<String> values = [];
  String name;
  /// Creates a [EnumBuilder] using `name` and `values`.
  EnumBuilder(this.name, this.values): super(Literal(""));

  @override
  String build() {
    return "enum $name {\n${values.map((e) => "  $e,\n").join()}}";
  }

}