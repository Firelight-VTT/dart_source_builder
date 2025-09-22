import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';

class Exit extends Line {
  Exit(int? exitCode): super(Literal("exit($exitCode)"));
}