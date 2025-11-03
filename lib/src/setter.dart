import 'package:dart_source_builder/dart_source_builder.dart';
import 'package:dart_source_builder/src/internals/indent.dart';
import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';
import 'package:dart_source_builder/src/type_builder.dart';

class Setter extends Line {
  TypeBuilder type;
  String name;
  List<Line>? lines;
  BaseStatement? singleLineContent;

  Setter({required this.type, required this.name, this.lines = const []}) : super(Literal(""));

  Setter.singleLine({required this.type, required this.name, required this.singleLineContent}) : super(Literal(""));

  Setter.multiLine({required this.type, required this.name, this.lines = const []}) : super(Literal(""));

  @override
  String build() {
    final indent = Indent();
    StringBuffer buffer = StringBuffer();

    buffer.write(indent);
    //buffer.write(type.build());
    buffer.write(" set $name(${type.build()} value) ");

    if (singleLineContent != null) {
      buffer.write(" => ${singleLineContent!.build()};\n");

    }else{
      buffer.write("{\n");
      indent.indent(() {
        for (var line in lines!) {
          buffer.write("${line.build()}\n");
        }
      });
      buffer.write("$indent}\n");
    }

    return buffer.toString();
  }
}