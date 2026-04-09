import 'package:dart_source_builder/src/base_statement.dart';

/// Emits a Dart type-check expression using the `is` operator.
class Is extends BaseStatement{
  BaseStatement target;
  BaseStatement checkedValue;

  /// Creates a [Is] using `target` and `checkedValue`.
  Is({
    required this.target,
    required this.checkedValue,
  });
  
  @override
  String build() {
    return "${target.build()} is ${checkedValue.build()}";
  }
}