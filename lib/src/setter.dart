import 'package:dart_source_builder/src/internals/indent.dart';
import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';
import 'package:dart_source_builder/src/type_builder.dart';

class Setter extends Line {
  TypeBuilder type;
  String name;
  List<Line> lines;

  Setter({required this.type, required this.name, this.lines = const []}) : super(Literal(""));

  @override
  String build() {
    final indent = Indent();
    StringBuffer buffer = StringBuffer();

    buffer.write(indent);
    //buffer.write(type.build());
    buffer.write(" set $name(${type.build()} value) ");

    if (lines.length == 1){
      buffer.write(" => ${lines.first.content.build()};");

    }else{
      buffer.write("{\n");
      indent.indent(() {
        for (var line in lines) {
          buffer.write("${line.build()}\n");
        }
      });
      buffer.write("$indent}\n");
    }

    return buffer.toString();
  }
}