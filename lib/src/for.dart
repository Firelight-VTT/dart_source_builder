import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';
import 'package:dart_source_builder/src/type_builder.dart';

class For extends Line {
  final List<Line> lines;
  late String paramsContents;

  For({required Literal initialization, required Literal condition, required Literal update, required this.lines}) : super(Literal("")) {
    paramsContents = "${initialization.build()}; ${condition.build()}; ${update.build()}";
  }

  For.each({required TypeBuilder type, required String variableName, required Literal iterable, required this.lines}) : super(Literal("")) {
    paramsContents = "${type.build()} $variableName in ${iterable.build()}";
  }


  @override
  String build() {
    StringBuffer string = StringBuffer();
    string.write("for ($paramsContents) {\n");
    for (var line in lines) {
      string.write("  ${line.build()}");
    }
    string.write("}");
    return string.toString();
  }
}