import 'package:dart_source_builder/src/base_statement.dart';

/// Emits an `await` expression for asynchronous calls.
class Await extends BaseStatement {
  BaseStatement inner;
  /// Creates a [Await] using `inner`.
  Await(this.inner);

  @override
  String build() {
    return "await ${inner.build()}";
  }
}
