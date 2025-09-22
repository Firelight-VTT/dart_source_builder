import 'package:dart_source_builder/src/base_statement.dart';

class Const  extends BaseStatement{
  BaseStatement inner;

  Const(this.inner);

  @override
  String build() {
    return "const ${inner.build()}";
  }
}