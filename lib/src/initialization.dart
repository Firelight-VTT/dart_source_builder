import 'package:dart_source_builder/src/internals/indent.dart';
import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';
import 'package:dart_source_builder/src/base_statement.dart';
import 'package:dart_source_builder/src/type_builder.dart';

/// Builds a variable declaration with modifiers, optional type, and optional initializer.
class Initialization extends Line {
  bool isLate = false;
  bool isFinal = false;
  bool isStatic = false;
  TypeBuilder? type;
  String targetName;
  BaseStatement? rhs;


  /// Creates a variable declaration for [targetName] with optional modifiers
  /// [isStatic], [isLate], and [isFinal], optional type [type], and optional
  /// initializer expression [rhs].
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
    final indent = Indent();
    return "$indent${isStatic ? 'static ' : ''}${isLate ? 'late ' : ''}${isFinal ? 'final ' : ''}${"$type "}$targetName${rhs != null ? ' = $rhs' : ''};\n";
  }

}