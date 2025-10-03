import 'package:dart_source_builder/src/base_statement.dart';
import 'package:dart_source_builder/src/internals/indent.dart';
import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';

class If extends Line{
  BaseStatement condition;
  List<Line> lines;
  Line? singleLine;

  If({required this.condition, this.singleLine, this.lines=const []}): super(Literal(""));

  @override
  String build() {
    final indent = Indent();
    StringBuffer string = StringBuffer();
    if (singleLine != null){
      string.write("$indent if ($condition)");
      string.write("  $singleLine");
    }else{
      string.write("${indent}if ($condition) {\n");
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