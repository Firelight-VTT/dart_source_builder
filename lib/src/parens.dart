import 'package:dart_source_builder/src/internals/base_statement.dart';

class Parens extends BaseStatement {
  final BaseStatement inner;

  Parens({
    required this.inner,
  });

  @override
  String build() {
    return '($inner)';
  }
}