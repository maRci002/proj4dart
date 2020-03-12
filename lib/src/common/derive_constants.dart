import 'dart:math' as math;

import 'package:proj4dart/src/constants/ellipsoids.dart' as ellipsoids;
import 'package:proj4dart/src/constants/values.dart' as consts;

Map<String, double> eccentricity(double a, double b, double rf, bool R_A) {
  var a2 = a * a; // used in geocentric
  var b2 = b * b; // used in geocentric
  var es = (a2 - b2) / a2; // e ^ 2
  var e = 0.0;
  if (R_A != null) {
    a *= 1 - es * (consts.SIXTH + es * (consts.RA4 + es * consts.RA6));
    a2 = a * a;
    es = 0.0;
  } else {
    e = math.sqrt(es); // eccentricity
  }
  var ep2 = (a2 - b2) / b2; // used in geocentric
  return {'es': es, 'e': e, 'ep2': ep2};
}

Map<String, Object> sphere(
    double a, double b, double rf, String ellps, bool sphere) {
  if (a == null || a.isNaN) {
    // do we have an ellipsoid?
    var ellipse = ellipsoids.match(ellps);

    ellipse ??= ellipsoids.WGS84;
    a = ellipse.a;
    b = ellipse.b;
    rf = ellipse.rf;
  }
  if (rf != null && b == null) {
    b = (1.0 - 1.0 / rf) * a;
  }
  if (rf == 0 || (a - b).abs() < consts.EPSLN) {
    sphere = true;
    b = a;
  }
  return {'a': a, 'b': b, 'rf': rf, 'sphere': sphere};
}
