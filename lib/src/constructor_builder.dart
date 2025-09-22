

import 'package:dart_source_builder/src/assignment.dart';
import 'package:dart_source_builder/src/literal.dart';
import 'package:dart_source_builder/src/internals/base_statement.dart';
import 'package:dart_source_builder/src/generic_parameters_definition.dart';
import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/named_parameter_definition.dart';
import 'package:dart_source_builder/src/optional_positional_parameter_definition.dart';
import 'package:dart_source_builder/src/positional_parameter_definition.dart';
import 'package:dart_source_builder/src/super_call.dart';

class ConstructorBuilder extends Line {
  String name;
  GenericParametersDefinition? genericParameters;
  List<PositionalParameterDefinition> parameters;
  List<OptionalPositionalParameterDefinition> optionalParameters;
  List<NamedParameterDefinition> namedParameters;
  List<Line> lines;
  SuperCall? superCall;
  List<Assignment> postInitializations;


  ConstructorBuilder({
    required this.name,
    this.genericParameters,
    this.parameters = const [],
    this.optionalParameters = const [],
    this.namedParameters = const [],
    this.lines = const [],
    this.superCall,
    this.postInitializations = const [],
  }): super(Literal(""));

  @override
  String build() {
    StringBuffer string = StringBuffer();
    string.write("$name");

    // doing generic parameters
    if (genericParameters != null) {
      string.write(genericParameters);
    }
    string.write("(");

    List<String> params = [];
    // doing positionals
    params.addAll(parameters.map((p) => p.build()));

    // doing optionals
    if (optionalParameters.isNotEmpty) {
      params.add('[${optionalParameters.join(', ')}]');
    }
    // doing named
    if (namedParameters.isNotEmpty) {
      params.add('{${namedParameters.join(', ')}}');
    }
    string.write(params.join(', '));


    string.write(")");

    if (superCall != null || postInitializations.isNotEmpty) {
      string.write(" : ");
      if (superCall != null) {
        string.write(superCall);
      }
      if (postInitializations.isNotEmpty) {
        if (superCall != null) {
          string.write(", ");
        }
        string.write(postInitializations.join(', '));
      }
    }

    if (lines.isEmpty) {
      string.write(";");
      return string.toString();
    }else{
      string.writeln(" {\n");

      for (var line in lines) {
        string.writeln("  $line");
      }

      string.writeln("}");

    }

   
    return string.toString();
  }
}

