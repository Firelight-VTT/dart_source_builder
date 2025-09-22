import 'package:dart_source_builder/src/internals/base_statement.dart';
import 'package:dart_source_builder/src/literal.dart';

class Decrement extends BaseStatement {
  Literal inner;

  Decrement(this.inner);

  @override
  String build() {
    return "${inner.build()}--";
  }
}