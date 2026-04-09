import 'package:dart_source_builder/src/generic_parameters_definition.dart';
import 'package:dart_source_builder/src/internals/indent.dart';
import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/named_parameter_definition.dart';
import 'package:dart_source_builder/src/optional_positional_parameter_definition.dart';
import 'package:dart_source_builder/src/positional_parameter_definition.dart';
import 'package:dart_source_builder/src/literal.dart';
import 'package:dart_source_builder/src/type_builder.dart';

/// Builds a named function declaration with parameters, return type, and body.
class FunctionDefinition extends Line {
  String name;
  TypeBuilder? returnType;
  GenericParametersDefinition? genericParameters;
  List<PositionalParameterDefinition> parameters;
  List<OptionalPositionalParameterDefinition> optionalParameters;
  List<NamedParameterDefinition> namedParameters;
  List<Line> lines;
  bool isAsync;


  /// Creates a named function [name] with optional [returnType], optional
  /// [genericParameters], positional [parameters], [optionalParameters],
  /// [namedParameters], body [lines], and [isAsync] behavior.
  FunctionDefinition({
    required this.name,
    this.returnType,
    this.genericParameters,
    this.parameters = const [],
    this.optionalParameters = const [],
    this.namedParameters = const [],
    this.lines = const [],
    this.isAsync = false,
  }):super(Literal(""));
  
  @override
  String build() {
    final indent = Indent();
    StringBuffer string = StringBuffer();
    string.write("$indent${returnType ?? 'void'} ");
    string.write(" $name");

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
    string.writeln(" {\n");

    indent.indent(() {
      for (var line in lines) {
        string.writeln("  $line");
      }
    });

    string.writeln("$indent}");

    return string.toString();
  }
}

