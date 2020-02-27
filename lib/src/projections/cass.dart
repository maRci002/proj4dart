import 'dart:math' as math;

import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/constants/values.dart' as consts;
import 'package:proj4dart/src/common/utils.dart' as utils;

class CassiniProjection extends Projection {
  static final List<String> names = [
    'Cassini',
    'Cassini_Soldner',
    'cass',
  ];

  double e0;
  double e1;
  double e2;
  double e3;
  double ml0;
  double lat0;
  double long0;
  double x0;
  double y0;

  CassiniProjection.init(ProjParams params) : super.init(params) {
    lat0 = params.lat0;
    long0 = params.long0;
    x0 = params.x0;
    y0 = params.y0;

    if (sphere == null || (sphere != null && !sphere)) {
      e0 = utils.e0fn(es);
      e1 = utils.e1fn(es);
      e2 = utils.e2fn(es);
      e3 = utils.e3fn(es);
      ml0 = a * utils.mlfn(e0, e1, e2, e3, lat0);
    }
  }

  /// Forward equations
  @override
  Point forward(Point p) {
    var x, y;
    var lam = p.x;
    var phi = p.y;
    lam = utils.adjust_lon(lam - long0);

    if (sphere != null && sphere) {
      x = a * math.asin(math.cos(phi) * math.sin(lam));
      y = a * (math.atan2(math.tan(phi), math.cos(lam)) - lat0);
    } else {
      // ellipsoid
      var sinphi = math.sin(phi);
      var cosphi = math.cos(phi);
      var nl = utils.gN(a, e, sinphi);
      var tl = math.tan(phi) * math.tan(phi);
      var al = lam * math.cos(phi);
      var asq = al * al;
      var cl = es * cosphi * cosphi / (1 - es);
      var ml = a * utils.mlfn(e0, e1, e2, e3, phi);

      x = nl * al * (1 - asq * tl * (1 / 6 - (8 - tl + 8 * cl) * asq / 120));
      y = ml -
          ml0 +
          nl * sinphi / cosphi * asq * (0.5 + (5 - tl + 6 * cl) * asq / 24);
    }

    p.x = x + x0;
    p.y = y + y0;
    return p;
  }

  /// Inverse equations
  @override
  Point inverse(Point p) {
    p.x -= x0;
    p.y -= y0;
    var x = p.x / a;
    var y = p.y / a;
    var phi, lam;

    if (sphere != null && sphere) {
      var dd = y + lat0;
      phi = math.asin(math.sin(dd) * math.cos(x));
      lam = math.atan2(math.tan(x), math.cos(dd));
    } else {
      // ellipsoid
      var ml1 = ml0 / a + y;
      var phi1 = utils.imlfn(ml1, e0, e1, e2, e3);
      if ((phi1.abs() - consts.HALF_PI).abs() <= consts.EPSLN) {
        p.x = long0;
        p.y = consts.HALF_PI;
        if (y < 0) {
          p.y *= -1;
        }
        return p;
      }
      var nl1 = utils.gN(a, e, math.sin(phi1));

      var rl1 = nl1 * nl1 * nl1 / a / a * (1 - es);
      var tl1 = math.pow(math.tan(phi1), 2);
      var dl = x * a / nl1;
      var dsq = dl * dl;
      phi = phi1 -
          nl1 *
              math.tan(phi1) /
              rl1 *
              dl *
              dl *
              (0.5 - (1 + 3 * tl1) * dl * dl / 24);
      lam = dl *
          (1 - dsq * (tl1 / 3 + (1 + 3 * tl1) * tl1 * dsq / 15)) /
          math.cos(phi1);
    }

    p.x = utils.adjust_lon(lam + long0);
    p.y = utils.adjust_lat(phi);
    return p;
  }
}
