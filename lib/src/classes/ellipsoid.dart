class Ellipsoid {
  double a;
  double rf;
  double b;
  String ellipseName;

  Ellipsoid({double a, double rf, String ellipseName})
      : a = a,
        rf = rf,
        ellipseName = ellipseName;

  Ellipsoid.withB({double a, double b, String ellipseName})
      : a = a,
        b = b,
        ellipseName = ellipseName;
}
