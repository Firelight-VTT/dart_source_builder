import 'package:dart_source_builder/src/function_call.dart';

/// Specialized call builder that emits `super(...)` initializer invocations.
class SuperCall extends FunctionCall {

  /// Creates a [SuperCall] using `positionalArguments`, `namedArguments`, and `genericParametersDefinition`.
  SuperCall({
    super.positionalArguments = const [],
    super.namedArguments = const [],
    super.genericParametersDefinition,
  }): super(
          functionName: 'super',
        );
  
}