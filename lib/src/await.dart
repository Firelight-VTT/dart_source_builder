import 'package:dart_source_builder/src/internals/base_statement.dart';

class Await extends BaseStatement {
  BaseStatement inner;
  Await(this.inner);

  @override
  String build() {
    return "await ${inner.build()}";
  }
}
