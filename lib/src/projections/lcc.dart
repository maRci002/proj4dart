import 'dart:math' as math;

import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/common/utils.dart' as utils;
import 'package:proj4dart/src/constants/values.dart' as consts;

class LambertConformalConicProjection extends Projection {
  static final List<String> names = [
    'Lambert Tangential Conformal Conic Projection',
    'Lambert_Conformal_Conic',
    'Lambert_Conformal_Conic_2SP',
    'lcc'
  ];

  double lat0;
  double long0;
  double lat1;
  double lat2;
  double x0;
  double y0;
  double ns, f0, rh;
  String title;

  LambertConformalConicProjection.init(ProjParams params)
      : lat0 = params.lat0,
        long0 = params.long0,
        lat1 = params.lat1,
        lat2 = params.lat2,
        x0 = params.x0,
        y0 = params.y0,
        super.init(params) {
    lat2 ??= lat1; //if lat2 is not defined
    k0 ??= 1;
    x0 = x0 ?? 0.0;
    y0 = y0 ?? 0.0;
    // Standard Parallels cannot be equal and on opposite sides of the equator
    if ((lat1 + lat2).abs() < consts.EPSLN) {
      return;
    }

    var temp = b / a;
    e = math.sqrt(1 - temp * temp);

    var sin1 = math.sin(lat1);
    var cos1 = math.cos(lat1);
    var ms1 = utils.msfnz(e, sin1, cos1);
    var ts1 = utils.tsfnz(e, lat1, sin1);

    var sin2 = math.sin(lat2);
    var cos2 = math.cos(lat2);
    var ms2 = utils.msfnz(e, sin2, cos2);
    var ts2 = utils.tsfnz(e, lat2, sin2);

    var ts0 = utils.tsfnz(e, lat0, math.sin(lat0));

    if ((lat1 - lat2).abs() > consts.EPSLN) {
      ns = math.log(ms1 / ms2) / math.log(ts1 / ts2);
    } else {
      ns = sin1;
    }
    if (ns.isNaN) {
      ns = sin1;
    }
    f0 = ms1 / (ns * math.pow(ts1, ns));
    rh = a * f0 * math.pow(ts0, ns);
    title ??= 'Lambert Conformal Conic';
  }

  @override
  Point forward(Point p) {
    var lon = p.x;
    var lat = p.y;

    // singular cases :
    if ((2 * lat.abs() - math.pi).abs() <= consts.EPSLN) {
      lat = utils.sign(lat) * (consts.HALF_PI - 2 * consts.EPSLN);
    }

    var con = (lat.abs() - consts.HALF_PI).abs();
    var ts, rh1;
    if (con > consts.EPSLN) {
      ts = utils.tsfnz(e, lat, math.sin(lat));
      rh1 = a * f0 * math.pow(ts, ns);
    } else {
      con = lat * ns;
      if (con <= 0) {
        return null;
      }
      rh1 = 0;
    }
    var theta = ns * utils.adjust_lon(lon - long0);
    p.x = k0 * (rh1 * math.sin(theta)) + x0;
    p.y = k0 * (rh - rh1 * math.cos(theta)) + y0;

    return p;
  }

  @override
  Point inverse(Point p) {
    double rh1, con, ts;
    double lat, lon;
    var x = (p.x - x0) / k0;
    var y = (rh - (p.y - y0) / k0);
    if (ns > 0) {
      rh1 = math.sqrt(x * x + y * y);
      con = 1;
    } else {
      rh1 = -math.sqrt(x * x + y * y);
      con = -1;
    }
    var theta = 0.0;
    if (rh1 != 0) {
      theta = math.atan2((con * x), (con * y));
    }
    if ((rh1 != 0) || (ns > 0)) {
      con = 1 / ns;
      ts = math.pow((rh1 / (a * f0)), con);
      lat = utils.phi2z(e, ts);
      if (lat == -9999) {
        return null;
      }
    } else {
      lat = -consts.HALF_PI;
    }
    lon = utils.adjust_lon(theta / ns + long0);

    p.x = lon;
    p.y = lat;
    return p;
  }
}
