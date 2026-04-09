import 'package:dart_source_builder/src/generic_parameters_definition.dart';
import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';
import 'package:dart_source_builder/src/type_builder.dart';

/// Builds a mixin declaration with optional type constraints and members.
class Mixin extends Line{
  String name;
  GenericParametersDefinition? genericParameters;
  TypeBuilder? superClass;
  List<Line> lines;


  /// Creates a mixin named [name] with optional constraint [superClass],
  /// optional [genericParameters], and member [lines].
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