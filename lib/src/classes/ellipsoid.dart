class Ellipsoid {
  double a;
  double rf;
  double b;
  String ellipseName;
  String shortName;

  Ellipsoid({double a, double rf, String ellipseName, String shortName})
      : a = a,
        rf = rf,
        ellipseName = ellipseName,
        shortName = shortName;

  Ellipsoid.withB({double a, double b, String ellipseName, String shortName})
      : a = a,
        b = b,
        ellipseName = ellipseName,
        shortName = shortName;
}
