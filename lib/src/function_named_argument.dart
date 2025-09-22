import 'package:dart_source_builder/src/internals/source_builder.dart';
import 'package:dart_source_builder/src/base_statement.dart';

class FunctionNamedArgument extends SourceBuilder {

  String name;
  BaseStatement value;

  FunctionNamedArgument({required this.name, required this.value});

  @override
  String build() {
    return '$name: $value';
  }

}