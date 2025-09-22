import 'package:dart_source_builder/src/internals/source_builder.dart';
import 'package:dart_source_builder/src/type_builder.dart';

class NamedParameterDefinition extends SourceBuilder {
  final String name;
  final TypeBuilder? type;
  final String? defaultValue;
  final bool required;
  final bool isThis;
  final bool isSuper;

  NamedParameterDefinition({
    required this.name,
    this.type,
    this.defaultValue,
    this.required = false,
    this.isThis = false,
    this.isSuper = false,
  }) : assert(
          (defaultValue == null && !required) ||
              (defaultValue != null && !required) ||
              (defaultValue == null && required),
          'A positional parameter cannot be both required and have a default value.',
        );

  @override
  String build() {
    final buffer = StringBuffer();

    if (required) {
      buffer.write('required ');
    }

    if (isThis){
      buffer.write('this.$name');
    }else if (isSuper){
      buffer.write('super.$name');
    }else{
      buffer.write('${type??TypeBuilder.dynamic().build()} $name');
    }

    if (defaultValue != null) {
      buffer.write(' = $defaultValue');
    }

    return buffer.toString();
  }
  
}