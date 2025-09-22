import 'package:dart_source_builder/src/function_call.dart';
import 'package:dart_source_builder/src/function_named_argument.dart';
import 'package:dart_source_builder/src/generic_parameters_definition.dart';
import 'package:dart_source_builder/src/internals/source_builder.dart';
import 'package:dart_source_builder/src/internals/base_statement.dart';

class SuperCall extends FunctionCall {
  List<BaseStatement> positionalArguments;
  List<FunctionNamedArgument> namedArguments;
  GenericParametersDefinition? genericParametersDefinition;

  SuperCall({
    this.positionalArguments = const [],
    this.namedArguments = const [],
    this.genericParametersDefinition,
  }): super(
          functionName: 'super',
          positionalArguments: positionalArguments,
          namedArguments: namedArguments,
          genericParametersDefinition: genericParametersDefinition,
        );
  
}