import 'package:dart_source_builder/src/base_statement.dart';
import 'package:dart_source_builder/src/literal.dart';

/// Emits a postfix increment expression like `counter++`.
class Increment extends BaseStatement {
  Literal inner;

  /// Creates a [Increment] using `inner`.
  Increment(this.inner);

  @override
  String build() {
    return "${inner.build()}++";
  }
}