import 'package:dart_source_builder/src/base_statement.dart';

/// Emits a `const` expression wrapper.
class Const  extends BaseStatement{
  BaseStatement inner;

  /// Creates a [Const] using `inner`.
  Const(this.inner);

  @override
  String build() {
    return "const ${inner.build()}";
  }
}