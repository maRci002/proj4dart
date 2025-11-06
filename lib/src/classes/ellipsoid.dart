class Ellipsoid {
  double a;
  double? rf;
  double? b;
  String ellipseName;
  String shortName;

  Ellipsoid({
    required this.a,
    required double this.rf,
    required this.ellipseName,
    required this.shortName,
  });

  Ellipsoid.withB({
    required this.a,
    required double this.b,
    required this.ellipseName,
    required this.shortName,
  });
}
