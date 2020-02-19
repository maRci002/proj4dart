class Match {
  static final ignoredChar = RegExp(r'[\s_\-\/\(\)]');

  static void match(dynamic obj, String key) {
    if (!(obj is Map)) {
      throw Exception('Object is not a map: $obj');
    }
    throw Exception('Not yet implemented');
  }
}
