import 'package:dart_source_builder/src/internals/source_builder.dart';
import 'package:dart_source_builder/src/type_builder.dart';

/// Defines a positional parameter for an anonymous function signature.
class AnonPositionalParameterDefinition extends SourceBuilder {
  final String name;
  final TypeBuilder? type;

  /// Creates a [AnonPositionalParameterDefinition] using `name` and `type`.
  AnonPositionalParameterDefinition({
    required this.name,
    this.type
  });

  @override
  String build() {
    final buffer = StringBuffer();

    if (type != null) {
      buffer.write('$type ');
    }

    buffer.write(name);

    return buffer.toString();
  }
  
}