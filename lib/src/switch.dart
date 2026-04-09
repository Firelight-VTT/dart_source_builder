import 'package:dart_source_builder/src/internals/indent.dart';
import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';
import 'package:dart_source_builder/src/base_statement.dart';
import 'package:dart_source_builder/src/internals/source_builder.dart';

/// Builds a `switch` statement with one or more cases.
class Switch extends Line{
  BaseStatement expression;
  List<SwitchCase> cases;

  /// Creates a [Switch] using `expression` and `cases`.
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

/// Represents an individual `case` section within a [Switch] statement.
class SwitchCase extends SourceBuilder{
  BaseStatement caseExpression;
  List<Line> lines;

  /// Creates a [SwitchCase] using `caseExpression` and `lines`.
  SwitchCase({required this.caseExpression, this.lines = const []});

  @override
  String build() {
    final indent = Indent();
    
    final buffer = StringBuffer();

    buffer.write(indent);
    buffer.write("case ");
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