import 'package:dart_source_builder/src/generic_parameters_definition.dart';
import 'package:dart_source_builder/src/internals/indent.dart';
import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';
import 'package:dart_source_builder/src/type_builder.dart';

class Class extends Line{
  String name;
  GenericParametersDefinition? genericParameters;
  TypeBuilder? superClass;
  List<TypeBuilder> mixins;
  bool isAbstract;
  List<Line> lines;


  Class({
    required this.name,
    this.superClass,
    this.genericParameters,
    this.mixins = const [],
    this.isAbstract = false,
    this.lines = const [],
  }) : super(Literal(""));





  @override
  String build() {
    var indent = Indent();
    StringBuffer string = StringBuffer();

    string.write(indent);

    if (isAbstract) {
      string.write("abstract ");
    }
    string.write("class $name");

    if (genericParameters != null) {
      string.write(genericParameters);
    }

    if (superClass != null) {
      string.write(" extends $superClass");
    }
    if (mixins.isNotEmpty) {
      string.write(" with ${mixins.join(', ')}");
    }
    string.writeln(" {");

    indent.indent(() {
      for (var line in lines) {
        string.write("  $line");
      }
    });

    string.writeln("$indent}");

    return string.toString();
  }
}