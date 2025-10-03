import 'package:dart_source_builder/src/internals/indent.dart';
import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';

class Else extends Line{
  List<Line> lines;
  Line? singleLine;

  Else({required this.lines, this.singleLine}): super(Literal(""));

  @override
  String build() {
    final indent = Indent();
    StringBuffer string = StringBuffer();
    if (singleLine != null){
      string.write("${indent}else");
      string.write("  $singleLine");
    }else{
      string.write("${indent}else {\n");
      indent.indent(() {
        for (var line in lines) {
          string.write("$line");
        }
      });
      string.write("$indent}\n");
    }
    return string.toString();
  }
}