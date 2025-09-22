import 'package:dart_source_builder/src/internals/base_statement.dart';
import 'package:dart_source_builder/src/literal.dart';

class Const  extends BaseStatement{
  BaseStatement inner;

  Const(this.inner);

  @override
  String build() {
    return "const ${inner.build()}";
  }
}