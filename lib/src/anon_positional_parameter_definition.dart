import 'package:dart_source_builder/src/internals/source_builder.dart';
import 'package:dart_source_builder/src/type_builder.dart';

class AnonPositionalParameterDefinition extends SourceBuilder {
  final String name;
  final TypeBuilder? type;

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