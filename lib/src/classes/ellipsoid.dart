class Ellipsoid {
  double a;
  double? rf;
  double? b;
  String ellipseName;
  String shortName;

  Ellipsoid({required double a, required double rf, required String ellipseName, required String shortName})
      : a = a,
        rf = rf,
        ellipseName = ellipseName,
        shortName = shortName;

  Ellipsoid.withB({required double a, required double b, required String ellipseName, required String shortName})
      : a = a,
        b = b,
        ellipseName = ellipseName,
        shortName = shortName;
}
