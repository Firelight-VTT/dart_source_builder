import 'package:dart_source_builder/dart_source_builder.dart';

/// Prefixes an inner line with the `static` modifier.
class Static extends Line{
  Line inner;
  /// Creates a [Static] using `inner`.
  Static(this.inner) : super(Literal(""));

  @override
  String build() {
    return "static ${inner.build()}";
  }
}