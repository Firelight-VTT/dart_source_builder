import 'package:dart_source_builder/src/function_call.dart';

class SuperCall extends FunctionCall {

  SuperCall({
    super.positionalArguments = const [],
    super.namedArguments = const [],
    super.genericParametersDefinition,
  }): super(
          functionName: 'super',
        );
  
}