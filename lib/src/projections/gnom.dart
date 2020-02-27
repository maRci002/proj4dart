import 'dart:math' as math;

import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/common/utils.dart' as utils;
import 'package:proj4dart/src/constants/values.dart' as consts;

class GnomicProjection extends Projection {
  static final List<String> names = ['gnom'];

  double lat0;
  double long0;
  double x0;
  double y0;
  double sin_p14;
  double cos_p14;
  double infinity_dist;
  double rc;
  double phic0;

  GnomicProjection.init(ProjParams params)
      : lat0 = params.lat0,
        long0 = params.long0,
        x0 = params.x0,
        y0 = params.y0,
        phic0 = params.map['phic0'],
        super.init(params) {
    sin_p14 = math.sin(lat0);
    cos_p14 = math.cos(lat0);
    // Approximation for projecting points to the horizon (infinity)
    infinity_dist = 1000 * a;
    rc = 1;
  }

  @override
  Point forward(Point p) {
    double sinphi, cosphi; // sin and cos value
    double dlon; // delta longitude value
    double coslon; // cos of longitude
    double ksp; // scale factor
    double g;
    double x, y;
    var lon = p.x;
    var lat = p.y;
    dlon = utils.adjust_lon(lon - long0);
    sinphi = math.sin(lat);
    cosphi = math.cos(lat);
    coslon = math.cos(dlon);
    g = sin_p14 * sinphi + cos_p14 * cosphi * coslon;
    ksp = 1;
    if ((g > 0) || (g.abs() <= consts.EPSLN)) {
      x = x0 + a * ksp * cosphi * math.sin(dlon) / g;
      y = y0 + a * ksp * (cos_p14 * sinphi - sin_p14 * cosphi * coslon) / g;
    } else {
      // Point is in the opposing hemisphere and is unprojectable
      // We still need to return a reasonable point, so we project
      // to infinity, on a bearing
      // equivalent to the northern hemisphere equivalent
      // This is a reasonable approximation for short shapes and lines that
      // straddle the horizon.
      x = x0 + infinity_dist * cosphi * math.sin(dlon);
      y = y0 + infinity_dist * (cos_p14 * sinphi - sin_p14 * cosphi * coslon);
    }
    p.x = x;
    p.y = y;
    return p;
  }

  @override
  Point inverse(Point p) {
    double rh; // Rho
    double sinc, cosc;
    double c;
    double lon, lat;

    p.x = (p.x - x0) / a;
    p.y = (p.y - y0) / a;

    p.x /= k0;
    p.y /= k0;

    if (!(rh = math.sqrt(p.x * p.x + p.y * p.y)).isNaN) {
      c = math.atan2(rh, rc);
      sinc = math.sin(c);
      cosc = math.cos(c);

      lat = utils.asinz(cosc * sin_p14 + (p.y * sinc * cos_p14) / rh);
      lon = math.atan2(p.x * sinc, rh * cos_p14 * cosc - p.y * sin_p14 * sinc);
      lon = utils.adjust_lon(long0 + lon);
    } else {
      lat = phic0;
      lon = 0;
    }

    p.x = lon;
    p.y = lat;
    return p;
  }
}
