import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';
import 'package:dart_source_builder/src/internals/base_statement.dart';
import 'package:dart_source_builder/src/internals/source_builder.dart';

class Switch extends Line{
  BaseStatement expression;
  List<SwitchCase> cases;

  Switch({required this.expression, required this.cases}): super(Literal(""));

  @override
  String build() {
    final buffer = StringBuffer();

    buffer.write("switch (");
    buffer.write(expression.build());
    buffer.write(") {\n");

    for (final switchCase in cases) {
      buffer.write(switchCase.build());
    }

    buffer.write("}\n");

    return buffer.toString();
  }

}

class SwitchCase extends SourceBuilder{
  BaseStatement caseExpression;
  List<Line> lines;

  SwitchCase({required this.caseExpression, this.lines = const []});

  @override
  String build() {
    final buffer = StringBuffer();

    buffer.write("case ");
    buffer.write(caseExpression.build());
    buffer.write(":\n");

    for (final line in lines) {
      buffer.write(line.build());
    }

    return buffer.toString();
  }

}