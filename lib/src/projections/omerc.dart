import 'dart:math' as math;

import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/common/utils.dart' as utils;
import 'package:proj4dart/src/constants/values.dart' as consts;

class HotineObliqueMercatorProjection extends Projection {
  static final List<String> names = [
    'Hotine_Oblique_Mercator',
    'Hotine Oblique Mercator',
    'Hotine_Oblique_Mercator_Azimuth_Natural_Origin',
    'Hotine_Oblique_Mercator_Azimuth_Center',
    'omerc'
  ];

  double lat0;
  double long0;
  double longc;
  double x0;
  double y0;
  double lat1;
  double lat2;
  double long1;
  double long2;
  double alpha;
  bool no_off, no_rot;
  double bl, al, el, gamma0, uc;

  HotineObliqueMercatorProjection.init(ProjParams params)
      : lat0 = params.lat0,
        long0 = params.long0,
        longc = params.longc,
        x0 = params.x0,
        y0 = params.y0,
        lat1 = params.lat1,
        lat2 = params.lat2,
        long1 = params.long1,
        long2 = params.long2,
        alpha = params.alpha,
        no_off = params.map['no_off'],
        no_rot = params.map['no_rot'],
        super.init(params) {
    no_off = no_off ?? false;
    no_rot = no_rot ?? false;

    if (k0 == null || k0.isNaN) {
      k0 = 1.0;
    }
    var sinlat = math.sin(lat0);
    var coslat = math.cos(lat0);
    var con = e * sinlat;

    bl = math.sqrt(1 + es / (1 - es) * math.pow(coslat, 4));
    al = a * bl * k0 * math.sqrt(1 - es) / (1 - con * con);
    var t0 = utils.tsfnz(e, lat0, sinlat);
    var dl = bl / coslat * math.sqrt((1 - es) / (1 - con * con));
    if (dl * dl < 1) {
      dl = 1;
    }
    double fl;
    double gl;
    if (longc != null) {
      //Central point and azimuth method

      if (lat0 >= 0) {
        fl = dl + math.sqrt(dl * dl - 1);
      } else {
        fl = dl - math.sqrt(dl * dl - 1);
      }
      el = fl * math.pow(t0, bl);
      gl = 0.5 * (fl - 1 / fl);
      gamma0 = math.asin(math.sin(alpha) / dl);
      long0 = longc - math.asin(gl * math.tan(gamma0)) / bl;
    } else {
      //2 points method
      var t1 = utils.tsfnz(e, lat1, math.sin(lat1));
      var t2 = utils.tsfnz(e, lat2, math.sin(lat2));
      if (lat0 >= 0) {
        el = (dl + math.sqrt(dl * dl - 1)) * math.pow(t0, bl);
      } else {
        el = (dl - math.sqrt(dl * dl - 1)) * math.pow(t0, bl);
      }
      var hl = math.pow(t1, bl);
      var ll = math.pow(t2, bl);
      fl = el / hl;
      gl = 0.5 * (fl - 1 / fl);
      var jl = (el * el - ll * hl) / (el * el + ll * hl);
      var pl = (ll - hl) / (ll + hl);
      var dlon12 = utils.adjust_lon(long1 - long2);
      long0 = 0.5 * (long1 + long2) -
          math.atan(jl * math.tan(0.5 * bl * (dlon12)) / pl) / bl;
      long0 = utils.adjust_lon(long0);
      var dlon10 = utils.adjust_lon(long1 - long0);
      gamma0 = math.atan(math.sin(bl * (dlon10)) / gl);
      alpha = math.asin(dl * math.sin(gamma0));
    }

    if (no_off) {
      uc = 0;
    } else {
      if (lat0 >= 0) {
        uc = al / bl * math.atan2(math.sqrt(dl * dl - 1), math.cos(alpha));
      } else {
        uc = -1 * al / bl * math.atan2(math.sqrt(dl * dl - 1), math.cos(alpha));
      }
    }
  }

  @override
  Point forward(Point p) {
    var lon = p.x;
    var lat = p.y;
    var dlon = utils.adjust_lon(lon - long0);
    double us, vs;
    double con;
    if ((lat.abs() - consts.HALF_PI).abs() <= consts.EPSLN) {
      if (lat > 0) {
        con = -1;
      } else {
        con = 1;
      }
      vs = al / bl * math.log(math.tan(consts.FORTPI + con * gamma0 * 0.5));
      us = -1 * con * consts.HALF_PI * al / bl;
    } else {
      var t = utils.tsfnz(e, lat, math.sin(lat));
      var ql = el / math.pow(t, bl);
      var sl = 0.5 * (ql - 1 / ql);
      var tl = 0.5 * (ql + 1 / ql);
      var vl = math.sin(bl * (dlon));
      var ul = (sl * math.sin(gamma0) - vl * math.cos(gamma0)) / tl;
      if ((ul.abs() - 1).abs() <= consts.EPSLN) {
        vs = double.infinity;
      } else {
        vs = 0.5 * al * math.log((1 - ul) / (1 + ul)) / bl;
      }
      if ((math.cos(bl * (dlon))).abs() <= consts.EPSLN) {
        us = al * bl * (dlon);
      } else {
        us = al *
            math.atan2(sl * math.cos(gamma0) + vl * math.sin(gamma0),
                math.cos(bl * dlon)) /
            bl;
      }
    }

    if (no_rot) {
      p.x = x0 + us;
      p.y = y0 + vs;
    } else {
      us -= uc;
      p.x = x0 + vs * math.cos(alpha) + us * math.sin(alpha);
      p.y = y0 + us * math.cos(alpha) - vs * math.sin(alpha);
    }
    return p;
  }

  @override
  Point inverse(Point p) {
    double us, vs;
    if (no_rot) {
      vs = p.y - y0;
      us = p.x - x0;
    } else {
      vs = (p.x - x0) * math.cos(alpha) - (p.y - y0) * math.sin(alpha);
      us = (p.y - y0) * math.cos(alpha) + (p.x - x0) * math.sin(alpha);
      us += uc;
    }
    var qp = math.exp(-1 * bl * vs / al);
    var sp = 0.5 * (qp - 1 / qp);
    var tp = 0.5 * (qp + 1 / qp);
    var vp = math.sin(bl * us / al);
    var up = (vp * math.cos(gamma0) + sp * math.sin(gamma0)) / tp;
    var ts = math.pow(el / math.sqrt((1 + up) / (1 - up)), 1 / bl);
    if ((up - 1).abs() < consts.EPSLN) {
      p.x = long0;
      p.y = consts.HALF_PI;
    } else if ((up + 1).abs() < consts.EPSLN) {
      p.x = long0;
      p.y = -1 * consts.HALF_PI;
    } else {
      p.y = utils.phi2z(e, ts);
      p.x = utils.adjust_lon(long0 -
          math.atan2(sp * math.cos(gamma0) - vp * math.sin(gamma0),
                  math.cos(bl * us / al)) /
              bl);
    }
    return p;
  }
}
