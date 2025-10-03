class Indent {
  int level = 0;
  int spacesPerLevel=2;

  int get currentIndent => level;

  Indent._internal();

  static final Indent _instance = Indent._internal();

  factory Indent() {
    return _instance;
  }




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
    String singleIndent = ' ' * spacesPerLevel;
    return singleIndent * level;
  }
}