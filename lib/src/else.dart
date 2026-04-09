import 'package:dart_source_builder/src/internals/indent.dart';
import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';

/// Builds an `else` branch with either single-line or block body output.
class Else extends Line{
  List<Line> lines;
  Line? singleLine;

  /// Creates a [Else] using `lines` and `singleLine`.
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