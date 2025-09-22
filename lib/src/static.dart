import 'package:dart_source_builder/dart_source_builder.dart';

class Static extends Line{
  Line inner;
  Static(this.inner) : super(Literal(""));

  @override
  String build() {
    return "static ${inner.build()}";
  }
}