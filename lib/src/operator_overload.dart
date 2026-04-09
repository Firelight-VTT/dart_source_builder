import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';
import 'package:dart_source_builder/src/type_builder.dart';

/// Builds an operator overload method body for a class.
class OperatorOverload extends Line {
  final String operator;
  final TypeBuilder returnType;
  final TypeBuilder? argumentType;
  final String? argumentName;
  final List<Line> lines;

  /// Creates an operator overload for [operator] with [returnType], optional
  /// single-argument signature ([argumentType] and [argumentName]), and body
  /// [lines].
  OperatorOverload({
    required this.operator,
    required this.returnType,
    this.argumentType,
    this.argumentName,
    required this.lines,
  }): super(Literal(""));

  @override
  String build() {
    StringBuffer buffer = StringBuffer();
    if (argumentName != null && argumentType != null){
      buffer.write("  $returnType operator $operator($argumentType $argumentName) {\n");
    }else{
      buffer.write("  $returnType operator $operator() {\n");
    }
    for (var line in lines) {
      buffer.write("    ${line.build()}\n");
    }
    buffer.write("  }\n");
    return buffer.toString();
  }
}