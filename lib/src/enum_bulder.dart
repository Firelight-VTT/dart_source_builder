import 'package:dart_source_builder/dart_source_builder.dart';

class EnumBuilder extends Line{
  List<String> values = [];
  String name;
  EnumBuilder(this.name, this.values): super(Literal(""));

  @override
  String build() {
    return "enum ${name} {\n" +
        values.map((e) => "  $e,\n").join() +
        "}";
  }

}