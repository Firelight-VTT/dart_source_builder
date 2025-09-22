import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';
import 'package:dart_source_builder/src/base_statement.dart';
import 'package:dart_source_builder/src/type_builder.dart';

class Initialization extends Line {
  bool isLate = false;
  bool isFinal = false;
  bool isStatic = false;
  TypeBuilder? type;
  String targetName;
  BaseStatement? rhs;


  Initialization({
    this.isStatic = false,
    this.isLate = false,
    this.isFinal = false,
    this.type,
    required this.targetName,
    this.rhs,
  }): super(Literal(""));

  @override
  String build() {
    return "${isStatic ? 'static ' : ''}${isLate ? 'late ' : ''}${isFinal ? 'final ' : ''}${"$type "}$targetName${rhs != null ? ' = $rhs' : ''};\n";
  }

}