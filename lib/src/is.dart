import 'package:dart_source_builder/src/internals/base_statement.dart';

class Is extends BaseStatement{
  BaseStatement target;
  BaseStatement checkedValue;

  Is({
    required this.target,
    required this.checkedValue,
  });
  
  @override
  String build() {
    return "${target.build()} is ${checkedValue.build()}";
  }
}