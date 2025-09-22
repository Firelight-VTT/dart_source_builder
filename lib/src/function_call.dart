import 'package:dart_source_builder/src/function_named_argument.dart';
import 'package:dart_source_builder/src/generic_parameters_definition.dart';
import 'package:dart_source_builder/src/base_statement.dart';

class FunctionCall extends BaseStatement {
  BaseStatement? targetObject;
  String functionName;
  List<BaseStatement> positionalArguments;
  List<FunctionNamedArgument> namedArguments;
  GenericParametersDefinition? genericParametersDefinition;
  bool targetObjectMayBeNull = false;

  FunctionCall({
    this.targetObject,
    this.targetObjectMayBeNull = false,
    required this.functionName,
    this.positionalArguments = const [],
    this.namedArguments = const [],
    this.genericParametersDefinition,
  });
  
  @override
  String build() {
    final buffer = StringBuffer();

    if (targetObject != null) {
      buffer.write('$targetObject');
    }

    if (targetObjectMayBeNull) {
      buffer.write('?');
    }

    if (targetObject != null) {
      buffer.write('.');
    }

    buffer.write(functionName);

    // Generic parameters
    if (genericParametersDefinition != null) {
      buffer.write(genericParametersDefinition);
    }

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

    buffer.write(')');

    return buffer.toString();
  }
}