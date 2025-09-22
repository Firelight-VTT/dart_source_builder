import 'package:dart_source_builder/src/generic_parameters_definition.dart';
import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';
import 'package:dart_source_builder/src/internals/source_builder.dart';
import 'package:dart_source_builder/src/type_builder.dart';

class Mixin extends Line{
  String name;
  GenericParametersDefinition? genericParameters;
  TypeBuilder? superClass;
  List<Line> lines;


  Mixin({
    required this.name,
    this.superClass,
    this.genericParameters,
    this.lines = const [],
  }) : super(Literal(""));





  @override
  String build() {
    StringBuffer string = StringBuffer();
    
    string.write("mixin $name");

    if (genericParameters != null) {
      string.write(genericParameters);
    }

    if (superClass != null) {
      string.write(" on $superClass");
    }
    
    string.writeln(" {");

    for (var line in lines) {
      string.writeln("  $line");
    }

    string.writeln("}");

    return string.toString();
  }
}