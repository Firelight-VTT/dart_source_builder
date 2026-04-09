import 'package:dart_source_builder/src/internals/source_builder.dart';
import 'package:dart_source_builder/src/type_builder.dart';

/// Emits a generic parameter list such as `<T, U>`.
class GenericParametersDefinition extends SourceBuilder {
  final List<TypeBuilder> _parameters;

  /// Creates a [GenericParametersDefinition] using `_parameters`.
  GenericParametersDefinition(this._parameters);

  @override
  String build() {
    return '<${_parameters.join(", ")}>';
  }
}