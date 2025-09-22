import 'package:dart_source_builder/src/internals/source_builder.dart';
import 'package:dart_source_builder/src/type_builder.dart';

class PositionalParameterDefinition extends SourceBuilder {
  final String name;
  final TypeBuilder? type;
  final bool isThis;
  final bool isSuper;

  PositionalParameterDefinition({
    required this.name,
    this.type,
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
    

    return buffer.toString();
  }
  
}