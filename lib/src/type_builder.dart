import 'package:dart_source_builder/src/generic_parameters_definition.dart';
import 'package:dart_source_builder/src/named_parameter_definition.dart';
import 'package:dart_source_builder/src/optional_positional_parameter_definition.dart';
import 'package:dart_source_builder/src/positional_parameter_definition.dart';
import 'package:dart_source_builder/src/internals/source_builder.dart';

class TypeBuilder extends SourceBuilder{
  late String _content;
  final bool nullable;

  TypeBuilder._(): nullable = false;
  TypeBuilder.int({this.nullable = false}) : _content = "int";
  TypeBuilder.string({this.nullable = false}) : _content = "String";
  TypeBuilder.double({this.nullable = false}) : _content = "double";
  TypeBuilder.num({this.nullable = false}) : _content = "num";
  TypeBuilder.bool({this.nullable = false}) : _content = "bool";
  TypeBuilder.dynamic() : _content = "dynamic", nullable = false;
  TypeBuilder.record({this.nullable = false, List<TypeBuilder> fields = const []}) : _content = "Record";
  TypeBuilder.function({
    this.nullable = false, 
    TypeBuilder? returnType, 
    bool async = false, 
    GenericParametersDefinition? genericParameters,
    List<PositionalParameterDefinition> positionalParameters = const [], 
    List<OptionalPositionalParameterDefinition> optionalPositionalParameters = const [], 
    List<NamedParameterDefinition> namedParameters = const [], 
  }) {
    StringBuffer string = StringBuffer();
    string.write("${returnType?.build() ?? 'void'} Function");

    // doing generic parameters
    if (genericParameters != null) {
      string.write(genericParameters.build());
    }
    string.write("(");

    List<String> params = [];
    // doing positionals
    params.addAll(positionalParameters.map((p) => p.build()));

    // doing optionals
    if (optionalPositionalParameters.isNotEmpty) {
      params.add('[${optionalPositionalParameters.map((p) => p.build()).join(', ')}]');
    }
    // doing named
    if (namedParameters.isNotEmpty) {
      params.add('{${namedParameters.map((p) => p.build()).join(', ')}}');
    }
    string.write(params.join(', '));


    string.write(")");

    if (async) {
      string.write(" async");
    }

    _content = string.toString();
  }

  TypeBuilder.list({this.nullable = false, required TypeBuilder type}) : _content = "List<$type>";
  TypeBuilder.set({this.nullable = false, required TypeBuilder type}) : _content = "Set<$type>";
  TypeBuilder.map({this.nullable = false, required TypeBuilder keyType, required TypeBuilder valueType}) : _content = "Map<$keyType, $valueType>";
  TypeBuilder.iterable({this.nullable = false, required TypeBuilder type}) : _content = "Iterable<$type>";
  TypeBuilder.future({this.nullable = false, required TypeBuilder type}) : _content = "Future<$type>";
  TypeBuilder.stream({this.nullable = false, required TypeBuilder type}) : _content = "Stream<$type>";
  TypeBuilder.object({this.nullable = false}) : _content = "Object";
  TypeBuilder.voidType({this.nullable = false}) : _content = "void";
  TypeBuilder.nullType() : _content = "Null", nullable = false;
  TypeBuilder.neverType() : _content = "Never", nullable = false;

  TypeBuilder.custom(String content, {this.nullable = false}) : _content = content;

  @override
  String build() {
    return "$_content${nullable ? '?' : ''}";
  }

}