import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';

class Else extends Line{
  List<Line> lines;
  Line? singleLine;

  Else({required this.lines, this.singleLine}): super(Literal(""));

  @override
  String build() {
    StringBuffer string = StringBuffer();
    if (singleLine != null){
      string.write("else");
      string.write("  $singleLine");
    }else{
      string.write("else {\n");
      for (var line in lines) {
        string.write("  $line");
      }
      string.write("}");
    }
    return string.toString();
  }
}