import 'package:dart_source_builder/src/base_statement.dart';
import 'package:dart_source_builder/src/internals/indent.dart';
import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';

class ElseIf extends Line{
  BaseStatement condition;
  List<Line> lines;
  Line? singleLine;

  ElseIf({required this.condition, this.singleLine, this.lines=const []}): super(Literal(""));

  @override
  String build() {
    final indent = Indent();
    StringBuffer string = StringBuffer();
    if (singleLine != null){
      string.write("${indent}else if ($condition)");
      string.write("  $singleLine");
    }else{
      string.write("${indent}else if ($condition) {\n");
      indent.indent(() {
        for (var line in lines) {
          string.write("$line");
        }
      });
      string.write("}\n");
    }
    return string.toString();
  }
}