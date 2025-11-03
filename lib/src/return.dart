import 'package:dart_source_builder/src/base_statement.dart';
import 'package:dart_source_builder/src/internals/indent.dart';
import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';

class Return extends Line {
  final BaseStatement returnedStatement;

  Return(this.returnedStatement): super(Literal(""));


  @override  String build() {
    final indent = Indent();
    return "${indent}return $returnedStatement;\n";

  }
}

