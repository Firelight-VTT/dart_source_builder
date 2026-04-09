
/// Root abstraction for all nodes that can render themselves to source text.
abstract class SourceBuilder {

  String build();


  @override
  String toString() {
    return build();
  }
  
}