import 'package:dart_source_builder/dart_source_builder.dart';

class As extends BaseStatement{
  BaseStatement target;
  TypeBuilder type;

  As(this.target, this.type);

  @override
  String build() {
    return '(${target.build()} as ${type.build()})';
  }

}