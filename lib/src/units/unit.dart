class Unit {
  static final int ANGLE_UNIT = 0;
  static final int LENGTH_UNIT = 1;
  static final int AREA_UNIT = 2;
  static final int VOLUME_UNIT = 3;

  String name, plural, abbreviation;
  double value;

  Unit(String name, String plural, String abbreviation, double value) {
    name = name;
    plural = plural;
    abbreviation = abbreviation;
    value = value;
  }

  double toBase(double n) {
    return n * value;
  }

  double fromBase(double n) {
    return n / value;
  }

  double parse(String s) {
    return double.parse(s);
  }

  String format(double n) {
    return '${n.toStringAsFixed(2)} $abbreviation';
  }

  String formatV2(double n, bool abbrev) {
    if (abbrev) {
      return '${n.toStringAsFixed(2)} $abbreviation';
    }
    return '${n.toStringAsFixed(2)}';
  }

  String formatV3(double x, double y, bool abbrev) {
    if (abbrev) {
      return '${x.toStringAsFixed(2)}/${y.toStringAsFixed(2)} $abbreviation';
    }
    return '${x.toStringAsFixed(2)}/${y.toStringAsFixed(2)}';
  }

  String formatV4(double x, double y) {
    return formatV3(x, y, true);
  }

  @override
  String toString() {
    return plural;
  }

  bool equals(Object o) {
    if (o is Unit) {
      return o.value == value;
    }
    return false;
  }
}
