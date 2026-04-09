import 'package:dart_source_builder/src/generic_parameters_definition.dart';
import 'package:dart_source_builder/src/named_parameter_definition.dart';
import 'package:dart_source_builder/src/optional_positional_parameter_definition.dart';
import 'package:dart_source_builder/src/positional_parameter_definition.dart';
import 'package:dart_source_builder/src/internals/source_builder.dart';

/// Builds Dart type annotations, including generics, functions, and nullability.
class TypeBuilder extends SourceBuilder{
  late String _content;
  final bool nullable;

  /// Creates an `int` type annotation and applies [nullable] when true.
  TypeBuilder.int({this.nullable = false}) : _content = "int";
  /// Creates a `String` type annotation and applies [nullable] when true.
  TypeBuilder.string({this.nullable = false}) : _content = "String";
  /// Creates a `double` type annotation and applies [nullable] when true.
  TypeBuilder.double({this.nullable = false}) : _content = "double";
  /// Creates a `num` type annotation and applies [nullable] when true.
  TypeBuilder.num({this.nullable = false}) : _content = "num";
  /// Creates a `bool` type annotation and applies [nullable] when true.
  TypeBuilder.bool({this.nullable = false}) : _content = "bool";
  /// Creates a `dynamic` type annotation.
  TypeBuilder.dynamic() : _content = "dynamic", nullable = false;
  /// Creates a record-style type annotation from [fields] and applies
  /// [nullable] when true.
  TypeBuilder.record({this.nullable = false, List<TypeBuilder> fields = const []}) : _content = "Record";
  /// Creates a function type annotation from [returnType], [genericParameters],
  /// [positionalParameters], [optionalPositionalParameters], [namedParameters],
  /// and [async], then applies [nullable] when true.
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

  /// Creates a `List<T>` type annotation from element [type] and applies
  /// [nullable] when true.
  TypeBuilder.list({this.nullable = false, required TypeBuilder type}) : _content = "List<$type>";
  /// Creates a `Set<T>` type annotation from element [type] and applies
  /// [nullable] when true.
  TypeBuilder.set({this.nullable = false, required TypeBuilder type}) : _content = "Set<$type>";
  /// Creates a `Map<K, V>` type annotation from [keyType] and [valueType], and
  /// applies [nullable] when true.
  TypeBuilder.map({this.nullable = false, required TypeBuilder keyType, required TypeBuilder valueType}) : _content = "Map<$keyType, $valueType>";
  /// Creates an `Iterable<T>` type annotation from element [type] and applies
  /// [nullable] when true.
  TypeBuilder.iterable({this.nullable = false, required TypeBuilder type}) : _content = "Iterable<$type>";
  /// Creates a `Future<T>` type annotation from element [type] and applies
  /// [nullable] when true.
  TypeBuilder.future({this.nullable = false, required TypeBuilder type}) : _content = "Future<$type>";
  /// Creates a `Stream<T>` type annotation from element [type] and applies
  /// [nullable] when true.
  TypeBuilder.stream({this.nullable = false, required TypeBuilder type}) : _content = "Stream<$type>";
  /// Creates an `Object` type annotation and applies [nullable] when true.
  TypeBuilder.object({this.nullable = false}) : _content = "Object";
  /// Creates a `void` type annotation and applies [nullable] when true.
  TypeBuilder.voidType({this.nullable = false}) : _content = "void";
  /// Creates a `Null` type annotation.
  TypeBuilder.nullType() : _content = "Null", nullable = false;
  /// Creates a `Never` type annotation.
  TypeBuilder.neverType() : _content = "Never", nullable = false;

  /// Creates a custom type annotation from [content] and applies [nullable]
  /// when true.
  TypeBuilder.custom(String content, {this.nullable = false}) : _content = content;

  @override
  String build() {
    return "$_content${nullable ? '?' : ''}";
  }

}