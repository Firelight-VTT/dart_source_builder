import 'package:dart_source_builder/src/base_statement.dart';
import 'package:dart_source_builder/src/literal.dart';

/// Emits a postfix decrement expression like `counter--`.
class Decrement extends BaseStatement {
  Literal inner;

  /// Creates a [Decrement] using `inner`.
  Decrement(this.inner);

  @override
  String build() {
    return "${inner.build()}--";
  }
}