import 'package:dart_source_builder/src/internals/source_builder.dart';
import 'package:dart_source_builder/src/base_statement.dart';

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