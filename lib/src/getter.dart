import 'package:dart_source_builder/dart_source_builder.dart';
import 'package:dart_source_builder/src/internals/indent.dart';
import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';
import 'package:dart_source_builder/src/type_builder.dart';

/// Builds a getter declaration in either expression-body or block-body form.
class Getter extends Line {
  TypeBuilder type;
  String name;
  List<Line>? lines;
  BaseStatement? singleLineContent;

  /// Creates a [Getter] using `type`, `name`, and `lines`.
  Getter({required this.type, required this.name, this.lines = const []}) : super(Literal(""));

  /// Creates a [Getter] via [Getter.singleLine] using `type`, `name`, and `singleLineContent` for single-line output.
  Getter.singleLine({required this.type, required this.name, required this.singleLineContent}) : super(Literal(""));

  /// Creates a [Getter] via [Getter.multiLine] using `type`, `name`, and `lines` for multi-line output.
  Getter.multiLine({required this.type, required this.name, this.lines = const []}) : super(Literal(""));

  @override
  String build() {
    final indent = Indent();
    StringBuffer buffer = StringBuffer();

    buffer.write(indent);
    buffer.write(type.build());
    buffer.write(" get $name");

    if (singleLineContent != null) {
      buffer.write(" => ${singleLineContent!.build()};\n");

    }else{
      buffer.write("{\n");
      indent.indent(() {
        for (var line in lines!) {
          buffer.write("${line.build()}\n");
        }
      });
      buffer.write("$indent}\n");
    }

    return buffer.toString();
  }
}