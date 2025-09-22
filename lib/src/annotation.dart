import 'package:dart_source_builder/src/function_named_argument.dart';
import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';
import 'package:dart_source_builder/src/internals/base_statement.dart';

class Annotation extends Line {
  String name;
  List<BaseStatement> positionalArguments;
  List<FunctionNamedArgument> namedArguments;
  bool forceParens;

  Annotation({
    required this.name,
    this.positionalArguments = const [],
    this.namedArguments = const [],
    this.forceParens = false,
  }):super(Literal(""));
  
  @override
  String build() {
    final buffer = StringBuffer();

    buffer.write("@$name");

    if (positionalArguments.isEmpty && namedArguments.isEmpty && forceParens == false) {
      buffer.write('\n');
      return buffer.toString();
    }else{

      buffer.write('(');

      // Positional arguments
      buffer.write(positionalArguments.join(', '));

      // Named arguments
      if (namedArguments.isNotEmpty) {
        if (positionalArguments.isNotEmpty) {
          buffer.write(', ');
        }
        buffer.write(namedArguments.join(', '));
      }

      buffer.write(')\n');

      return buffer.toString();
    }
  }
}