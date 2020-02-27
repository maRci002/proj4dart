import 'dart:math' as math;

import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/constants/values.dart' as consts;
import 'package:proj4dart/src/common/utils.dart' as utils;

class EquidistantConicProjection extends Projection {
  static final List<String> names = [
    'Equidistant_Conic',
    'eqdc',
  ];

  double e0;
  double e1;
  double e2;
  double e3;
  double long0;
  double x0;
  double y0;
  double ns;
  double g;
  double rh;

  EquidistantConicProjection.init(ProjParams params) : super.init(params) {
    var lat1 = params.lat1;
    var lat2 = params.lat2;
    var lat0 = params.lat0;
    long0 = params.long0;
    x0 = params.x0;
    y0 = params.y0;

    // Standard Parallels cannot be equal and on opposite sides of the equator
    if ((lat1 + lat2).abs() < consts.EPSLN) {
      return;
    }
    lat2 = lat2 ?? lat1;
    var temp = b / a;
    var es = 1 - math.pow(temp, 2);
    e = math.sqrt(es);
    e0 = utils.e0fn(es);
    e1 = utils.e1fn(es);
    e2 = utils.e2fn(es);
    e3 = utils.e3fn(es);

    var sinphi = math.sin(lat1);
    var cosphi = math.cos(lat1);

    var ms1 = utils.msfnz(e, sinphi, cosphi);
    var ml1 = utils.mlfn(e0, e1, e2, e3, lat1);

    if ((lat1 - lat2).abs() < consts.EPSLN) {
      ns = sinphi;
    } else {
      sinphi = math.sin(lat2);
      cosphi = math.cos(lat2);
      var ms2 = utils.msfnz(e, sinphi, cosphi);
      var ml2 = utils.mlfn(e0, e1, e2, e3, lat2);
      ns = (ms1 - ms2) / (ml2 - ml1);
    }
    g = ml1 + ms1 / ns;
    var ml0 = utils.mlfn(e0, e1, e2, e3, lat0);
    rh = a * (g - ml0);
  }

  /// Equidistant Conic forward equations--mapping lat,long to x,y
  @override
  Point forward(Point p) {
    var lon = p.x;
    var lat = p.y;
    var rh1;

    if (sphere != null && sphere) {
      rh1 = a * (g - lat);
    } else {
      var ml = utils.mlfn(e0, e1, e2, e3, lat);
      rh1 = a * (g - ml);
    }
    var theta = ns * utils.adjust_lon(lon - long0);
    var x = x0 + rh1 * math.sin(theta);
    var y = y0 + rh - rh1 * math.cos(theta);
    p.x = x;
    p.y = y;
    return p;
  }

  /// Inverse equations
  @override
  Point inverse(Point p) {
    p.x -= x0;
    p.y = rh - p.y + y0;
    var con, rh1, lat, lon;
    if (ns >= 0) {
      rh1 = math.sqrt(p.x * p.x + p.y * p.y);
      con = 1;
    } else {
      rh1 = -math.sqrt(p.x * p.x + p.y * p.y);
      con = -1;
    }
    var theta = 0.0;
    if (rh1 != 0) {
      theta = math.atan2(con * p.x, con * p.y);
    }

    if (sphere != null && sphere) {
      lon = utils.adjust_lon(long0 + theta / ns);
      lat = utils.adjust_lat(g - rh1 / a);
      p.x = lon;
      p.y = lat;
      return p;
    } else {
      var ml = g - rh1 / a;
      lat = utils.imlfn(ml, e0, e1, e2, e3);
      lon = utils.adjust_lon(long0 + theta / ns);
      p.x = lon;
      p.y = lat;
      return p;
    }
  }
}
