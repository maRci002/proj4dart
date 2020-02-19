import 'package:proj4dart/src/constants/ellipsoids.dart';
import 'package:proj4dart/src/constants/values.dart';
import 'dart:math' as math;

class DeriveConstants {
  static dynamic eccentricity(double a, double b, rf, bool R_A) {
    var a2 = a * a; // used in geocentric
    var b2 = b * b; // used in geocentric
    var es = (a2 - b2) / a2; // e ^ 2
    var e = 0.0;
    if (R_A) {
      a *= 1 -
          es *
              (ConstValues.SIXTH +
                  es * (ConstValues.RA4 + es * ConstValues.RA6));
      a2 = a * a;
      es = 0.0;
    } else {
      e = math.sqrt(es); // eccentricity
    }
    var ep2 = (a2 - b2) / b2; // used in geocentric
    return {es: es, e: e, ep2: ep2};
  }

  static dynamic sphere(double a, double b, double rf, String ellps, sphere) {
    if (a.isNaN) {
      // do we have an ellipsoid?
      var ellipse = Ellipsoids.match(ellps);
      ellipse ??= Ellipsoids.WGS84;
      a = ellipse.a;
      b = ellipse.b;
      rf = ellipse.rf;
    }
    if (rf != null && b == null) {
      b = (1.0 - 1.0 / rf) * a;
    }
    if (rf == 0 || (a - b).abs() < ConstValues.EPSLN) {
      sphere = true;
      b = a;
    }
    return {a: a, b: b, rf: rf, sphere: sphere};
  }
}
