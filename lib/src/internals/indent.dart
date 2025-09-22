class Indent {
  int level = 0;
  final int spacesPerLevel;

  Indent({this.spacesPerLevel = 2});

  String get currentIndent => ' ' * (level * spacesPerLevel);

  void indent(void Function() action) {
    level++;
    try {
      action();
    } finally {
      level--;
    }
  }


  @override
  String toString() {
    String singleIndent = '' * spacesPerLevel;
    return singleIndent * level;
  }
}