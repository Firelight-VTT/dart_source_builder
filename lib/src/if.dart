import 'package:dart_source_builder/src/base_statement.dart';
import 'package:dart_source_builder/src/internals/indent.dart';
import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';

/// Builds an `if` branch with either single-line or block body output.
class If extends Line{
  BaseStatement condition;
  List<Line> lines;
  Line? singleLine;

  /// Creates a [If] using `condition`, `singleLine`, and `lines`.
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