import 'package:dart_source_builder/src/internals/indent.dart';
import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';
import 'package:dart_source_builder/src/base_statement.dart';
import 'package:dart_source_builder/src/internals/source_builder.dart';

class Switch extends Line{
  BaseStatement expression;
  List<SwitchCase> cases;

  Switch({required this.expression, required this.cases}): super(Literal(""));

  @override
  String build() {
    final indent = Indent();
    final buffer = StringBuffer();

    buffer.write("${indent}switch (");
    buffer.write(expression.build());
    buffer.write(") {\n");

    indent.indent(() {
      for (final switchCase in cases) {
        buffer.write(switchCase.build());
      }
    });
    

    buffer.write("$indent}\n");

    return buffer.toString();
  }

}

class SwitchCase extends SourceBuilder{
  BaseStatement caseExpression;
  List<Line> lines;

  SwitchCase({required this.caseExpression, this.lines = const []});

  @override
  String build() {
    final indent = Indent();
    
    final buffer = StringBuffer();

    buffer.write(indent);
    buffer.write("${indent}case ");
    buffer.write(caseExpression.build());
    buffer.write(":\n");

    indent.indent(() {
      for (final line in lines) {
        buffer.write("$line");
      }
    });

    return buffer.toString();
  }

}