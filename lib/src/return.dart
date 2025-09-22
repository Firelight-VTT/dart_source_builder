import 'package:dart_source_builder/src/internals/base_statement.dart';
import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/internals/source_builder.dart';
import 'package:dart_source_builder/src/literal.dart';

class Return extends Line {
  final BaseStatement returnedStatement;

  Return(this.returnedStatement): super(Literal("return $returnedStatement"));


}