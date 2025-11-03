

import 'package:dart_source_builder/src/anon_positional_parameter_definition.dart';
import 'package:dart_source_builder/src/base_statement.dart';
import 'package:dart_source_builder/src/generic_parameters_definition.dart';
import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/named_parameter_definition.dart';
import 'package:dart_source_builder/src/optional_positional_parameter_definition.dart';


class AnonFunctionDefinition extends BaseStatement {
  GenericParametersDefinition? genericParameters;
  List<AnonPositionalParameterDefinition> parameters;
  List<OptionalPositionalParameterDefinition> optionalParameters;
  List<NamedParameterDefinition> namedParameters;
  List<Line>? lines;
  BaseStatement? singleLine;
  bool isAsync;


  AnonFunctionDefinition({
    this.genericParameters,
    this.parameters = const [],
    this.optionalParameters = const [],
    this.namedParameters = const [],
    this.lines = const [],
    this.isAsync = false,
  });

  AnonFunctionDefinition.multiLine({
    this.genericParameters,
    this.parameters = const [],
    this.optionalParameters = const [],
    this.namedParameters = const [],
    this.lines = const [],
    this.isAsync = false,
  });

  AnonFunctionDefinition.singleLine({
    this.genericParameters,
    this.parameters = const [],
    this.optionalParameters = const [],
    this.namedParameters = const [],
    required this.singleLine,
    this.isAsync = false,
  });
  
  @override
  String build() {
    StringBuffer string = StringBuffer();

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
    if (isAsync) {
      string.write(" async");
    }

    if (singleLine != null){
      string.write(" => $singleLine");
    }else{
      string.writeln(" {\n");

      for (var line in lines!) {
        string.writeln("  $line");
      }

      string.writeln("}");
    }

    

    return string.toString();
  }
}

