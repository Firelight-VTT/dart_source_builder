import 'package:dart_source_builder/src/internals/source_builder.dart';
import 'package:dart_source_builder/src/base_statement.dart';

/// Represents a named argument entry in a function call.
class FunctionNamedArgument extends SourceBuilder {

  String name;
  BaseStatement value;

  /// Creates a [FunctionNamedArgument] using `name` and `value`.
  FunctionNamedArgument({required this.name, required this.value});

  @override
  String build() {
    return '$name: $value';
  }

}