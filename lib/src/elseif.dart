import 'package:dart_source_builder/src/base_statement.dart';
import 'package:dart_source_builder/src/internals/indent.dart';
import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';

/// Builds an `else if` branch with either single-line or block body output.
class ElseIf extends Line{
  BaseStatement condition;
  List<Line> lines;
  Line? singleLine;

  /// Creates a [ElseIf] using `condition`, `singleLine`, and `lines`.
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