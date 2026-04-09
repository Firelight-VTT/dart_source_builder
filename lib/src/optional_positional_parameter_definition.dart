import 'package:dart_source_builder/src/internals/source_builder.dart';
import 'package:dart_source_builder/src/type_builder.dart';

/// Defines an optional positional parameter for function-like declarations.
class OptionalPositionalParameterDefinition extends SourceBuilder {
  final String name;
  final TypeBuilder? type;
  final String? defaultValue;
  final bool isThis;
  final bool isSuper;

  /// Creates an optional positional parameter [name] with optional [type],
  /// optional [defaultValue], and forwarding flags [isThis] and [isSuper].
  OptionalPositionalParameterDefinition({
    required this.name,
    this.type,
    this.defaultValue,
    this.isThis = false,
    this.isSuper = false,
  }) ;

  @override
  String build() {
    final buffer = StringBuffer();

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