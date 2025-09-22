import 'package:dart_source_builder/dart_source_builder.dart';
import 'package:dart_source_builder/src/internals/base_statement.dart';
import 'package:dart_source_builder/src/internals/source_builder.dart';

class As extends BaseStatement{
  BaseStatement target;
  TypeBuilder type;

  As(this.target, this.type);

  @override
  String build() {
    return '(${target.build()} as ${type.build()})';
  }

}