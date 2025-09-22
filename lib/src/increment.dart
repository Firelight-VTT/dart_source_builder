import 'package:dart_source_builder/src/base_statement.dart';
import 'package:dart_source_builder/src/literal.dart';

class Increment extends BaseStatement {
  Literal inner;

  Increment(this.inner);

  @override
  String build() {
    return "${inner.build()}++";
  }
}