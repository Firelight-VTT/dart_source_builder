import 'package:dart_source_builder/dart_source_builder.dart';

class Factory extends Line {
  String? functionName;
  GenericParametersDefinition? genericParameters;
  List<PositionalParameterDefinition> parameters;
  List<OptionalPositionalParameterDefinition> optionalParameters;
  List<NamedParameterDefinition> namedParameters;
  List<Line> lines;
  String className;

  Factory({
    this.functionName,
    this.genericParameters,
    this.parameters = const [],
    this.optionalParameters = const [],
    this.namedParameters = const [],
    this.lines = const [],
    required this.className,
  }):super(Literal(""));
  
  @override
  String build() {
    final buffer = StringBuffer();

    buffer.write("factory ");

    buffer.write(className);
    if (functionName != null) {
      buffer.write(".$functionName");
    }

    // Generic parameters
    if (genericParameters != null) {
      buffer.write(genericParameters);
    }

    buffer.write("(");

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
    buffer.write(params.join(', '));


    buffer.write(")");

    buffer.writeln(" {\n");

    for (var line in lines) {
      buffer.writeln("  $line");
    }

    buffer.writeln("}");

    return buffer.toString();
  }
}