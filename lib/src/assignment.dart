import 'package:dart_source_builder/src/internals/source_builder.dart';
import 'package:dart_source_builder/src/internals/base_statement.dart';
import 'package:dart_source_builder/src/type_builder.dart';

class Assignment extends SourceBuilder {
  String targetName;
  BaseStatement rhs;


  Assignment({
    required this.targetName,
    required this.rhs,
  });

  @override
  String build() {
    return "$targetName = $rhs";
  }

}