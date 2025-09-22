import 'package:dart_source_builder/src/internals/source_builder.dart';
import 'package:dart_source_builder/src/type_builder.dart';

class GenericParametersDefinition extends SourceBuilder {
  final List<TypeBuilder> _parameters;

  GenericParametersDefinition(this._parameters);

  @override
  String build() {
    return '<${_parameters.join(", ")}>';
  }
}