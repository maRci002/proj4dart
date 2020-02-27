import 'dart:math' as math;

import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/common/utils.dart' as utils;
import 'package:proj4dart/src/constants/values.dart' as consts;

class OrthographicProjection extends Projection {
  static final List<String> names = ['ortho'];

  double lat0;
  double long0;
  double x0;
  double y0;
  double sin_p14, cos_p14;

  OrthographicProjection.init(ProjParams params)
      : lat0 = params.lat0,
        long0 = params.long0,
        x0 = params.x0,
        y0 = params.y0,
        super.init(params) {
    sin_p14 = math.sin(lat0);
    cos_p14 = math.cos(lat0);
  }
  @override
  Point forward(Point p) {
    double sinphi, cosphi; // sin and cos value
    double dlon; // delta longitude value
    double coslon; // cos of longitude
    double ksp; // scale factor
    double g, x, y;
    var lon = p.x;
    var lat = p.y;
    dlon = utils.adjust_lon(lon - long0);

    sinphi = math.sin(lat);
    cosphi = math.cos(lat);

    coslon = math.cos(dlon);
    g = sin_p14 * sinphi + cos_p14 * cosphi * coslon;
    ksp = 1;
    if ((g > 0) || (g.abs() <= consts.EPSLN)) {
      x = a * ksp * cosphi * math.sin(dlon);
      y = y0 + a * ksp * (cos_p14 * sinphi - sin_p14 * cosphi * coslon);
    }
    p.x = x;
    p.y = y;
    return p;
  }

  @override
  Point inverse(Point p) {
    double rh; // height above ellipsoid
    double z; // angle
    double sinz, cosz; // sin of z and cos of z
    double con;
    double lon, lat;
    p.x -= x0;
    p.y -= y0;
    rh = math.sqrt(p.x * p.x + p.y * p.y);
    z = utils.asinz(rh / a);

    sinz = math.sin(z);
    cosz = math.cos(z);

    lon = long0;
    if (rh.abs() <= consts.EPSLN) {
      lat = lat0;
      p.x = lon;
      p.y = lat;
      return p;
    }
    lat = utils.asinz(cosz * sin_p14 + (p.y * sinz * cos_p14) / rh);
    con = lat0.abs() - consts.HALF_PI;
    if (con.abs() <= consts.EPSLN) {
      if (lat0 >= 0) {
        lon = utils.adjust_lon(long0 + math.atan2(p.x, -p.y));
      } else {
        lon = utils.adjust_lon(long0 - math.atan2(-p.x, p.y));
      }
      p.x = lon;
      p.y = lat;
      return p;
    }
    lon = utils.adjust_lon(long0 +
        math.atan2((p.x * sinz), rh * cos_p14 * cosz - p.y * sin_p14 * sinz));
    p.x = lon;
    p.y = lat;
    return p;
  }
}
