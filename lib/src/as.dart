import 'package:dart_source_builder/dart_source_builder.dart';

/// Emits a parenthesized cast expression using the `as` operator.
class As extends BaseStatement{
  BaseStatement target;
  TypeBuilder type;

  /// Creates a [As] using `target` and `type`.
  As(this.target, this.type);

  @override
  String build() {
    return '(${target.build()} as ${type.build()})';
  }

}