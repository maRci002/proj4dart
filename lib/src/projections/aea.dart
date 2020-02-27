import 'dart:math' as math;

import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/constants/values.dart' as consts;
import 'package:proj4dart/src/common/utils.dart' as utils;

class AlbersProjection extends Projection {
  static final List<String> names = [
    'Albers_Conic_Equal_Area',
    'Albers',
    'aea',
  ];

  double e3;
  double ns0;
  double c;
  double rh;
  double long0;
  double x0;
  double y0;

  AlbersProjection.init(ProjParams params) : super.init(params) {
    var lat1 = params.lat1;
    var lat2 = params.lat2;
    long0 = params.long0;
    x0 = params.x0;
    y0 = params.y0;

    if ((lat1 + lat2).abs() < consts.EPSLN) {
      return;
    }
    var temp = b / a;
    es = 1 - math.pow(temp, 2);
    e3 = math.sqrt(es);

    var sin_po = math.sin(lat1);
    var cos_po = math.cos(lat1);
    // var t1 = sin_po;
    var con = sin_po;
    var ms1 = utils.msfnz(e3, sin_po, cos_po);
    var qs1 = utils.qsfnz(e3, sin_po);

    sin_po = math.sin(lat2);
    cos_po = math.cos(lat2);
    // var t2 = sin_po;
    var ms2 = utils.msfnz(e3, sin_po, cos_po);
    var qs2 = utils.qsfnz(e3, sin_po);

    sin_po = math.sin(params.lat0);
    cos_po = math.cos(params.lat0);
    // var t3 = sin_po;
    var qs0 = utils.qsfnz(e3, sin_po);

    if ((lat1 - lat2).abs() > consts.EPSLN) {
      ns0 = (ms1 * ms1 - ms2 * ms2) / (qs2 - qs1);
    } else {
      ns0 = con;
    }
    c = ms1 * ms1 + ns0 * qs1;
    rh = a * math.sqrt(c - ns0 * qs0) / ns0;
  }

  /// Albers Conical Equal Area forward equations--mapping lat,long to x,y
  @override
  Point forward(Point p) {
    var lon = p.x;
    var lat = p.y;

    var sin_phi = math.sin(lat);
    // var cos_phi = math.cos(lat);

    var qs = utils.qsfnz(e3, sin_phi);
    var rh1 = a * math.sqrt(c - ns0 * qs) / ns0;
    var theta = ns0 * utils.adjust_lon(lon - long0);
    var x = rh1 * math.sin(theta) + x0;
    var y = rh - rh1 * math.cos(theta) + y0;

    p.x = x;
    p.y = y;
    return p;
  }

  @override
  Point inverse(Point p) {
    var rh1, qs, con, theta, lon, lat;

    p.x -= x0;
    p.y = rh - p.y + y0;
    if (ns0 >= 0) {
      rh1 = math.sqrt(p.x * p.x + p.y * p.y);
      con = 1;
    } else {
      rh1 = -math.sqrt(p.x * p.x + p.y * p.y);
      con = -1;
    }
    theta = 0;
    if (rh1 != 0) {
      theta = math.atan2(con * p.x, con * p.y);
    }
    con = rh1 * ns0 / a;
    if (sphere != null && sphere) {
      lat = math.asin((c - con * con) / (2 * ns0));
    } else {
      qs = (c - con * con) / ns0;
      lat = _phi1z(e3, qs);
    }

    lon = utils.adjust_lon(theta / ns0 + long0);
    p.x = lon;
    p.y = lat;
    return p;
  }

  /// Function to compute phi1, the latitude for the inverse of the
  /// Albers Conical Equal-Area projection.
  double _phi1z(eccent, qs) {
    var sinphi, cosphi, con, com, dphi;
    var phi = utils.asinz(0.5 * qs);
    if (eccent < consts.EPSLN) {
      return phi;
    }

    var eccnts = eccent * eccent;
    for (var i = 1; i <= 25; i++) {
      sinphi = math.sin(phi);
      cosphi = math.cos(phi);
      con = eccent * sinphi;
      com = 1 - con * con;
      dphi = 0.5 *
          com *
          com /
          cosphi *
          (qs / (1 - eccnts) -
              sinphi / com +
              0.5 / eccent * math.log((1 - con) / (1 + con)));
      phi = phi + dphi;
      if (dphi.abs() <= 1e-7) {
        return phi;
      }
    }
    return null;
  }
}
