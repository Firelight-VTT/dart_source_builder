import 'package:dart_source_builder/src/internals/base_statement.dart';
import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/internals/source_builder.dart';
import 'package:dart_source_builder/src/literal.dart';

class ElseIf extends Line{
  BaseStatement condition;
  List<Line> lines;
  Line? singleLine;

  ElseIf({required this.condition, this.singleLine, this.lines=const []}): super(Literal(""));

  @override
  String build() {
    StringBuffer string = StringBuffer();
    if (singleLine != null){
      string.write("else if ($condition)");
      string.write("  $singleLine");
    }else{
      string.write("else if ($condition) {\n");
      for (var line in lines) {
        string.write("  $line");
      }
      string.write("}");
    }
    return string.toString();
  }
}