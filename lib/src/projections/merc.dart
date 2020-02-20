import 'dart:math' as math;

import 'package:proj4dart/src/common/utils.dart' as utils;
import 'package:proj4dart/src/constants/values.dart' as consts;
import 'package:proj4dart/src/point.dart';
import 'package:proj4dart/src/projection.dart';

class MercProjection extends Projection {
  @override
  final List<String> names = [
    'Mercator',
    'Popular Visualisation Pseudo Mercator',
    'Mercator_1SP',
    'Mercator_Auxiliary_Sphere',
    'merc'
  ];
  @override
  int a;
  @override
  double b;
  @override
  double es;
  @override
  double e;
  double long0;
  double x0;
  double y0;
  double k;
  double lat_ts;
  double sphere;

  MercProjection.init(Map<String, dynamic> map)
      : a = map['a'],
        b = map['b'],
        lat_ts = map['lat_ts'],
        sphere = map['sphere'],
        k = map['k'],
        long0 = map['long0'],
        x0 = map['x0'],
        y0 = map['y0'],
        super.init(map) {
    var con = map['b'] / map['a'];
    es = 1 - con * con;
    x0 ??= 0.0;
    y0 ??= 0.0;
    e = math.sqrt(es);
    if (lat_ts != null) {
      if (sphere != null) {
        k0 = math.cos(lat_ts);
      } else {
        k0 = utils.msfnz(e, math.sin(lat_ts), math.cos(lat_ts));
      }
    } else {
      if (k0 == null) {
        if (k != null) {
          k0 = k;
        } else {
          k0 = 1.0;
        }
      }
    }
  }

  @override
  Point forward(Point p) {
    var lon = p.x;
    var lat = p.y;
    if (lat * consts.R2D > 90 &&
        lat * consts.R2D < -90 &&
        lon * consts.R2D > 180 &&
        lon * consts.R2D < -180) {
      return null;
    }
    var x, y;
    if ((lat.abs() - consts.HALF_PI).abs() <= consts.EPSLN) {
      return null;
    } else {
      if (sphere != null) {
        x = x0 + a * k0 * utils.adjust_lon(lon - long0);
        y = y0 + a * k0 * math.log(math.tan(consts.FORTPI + 0.5 * lat));
      } else {
        var sinphi = math.sin(lat);
        var ts = utils.tsfnz(e, lat, sinphi);
        x = x0 + a * k0 * utils.adjust_lon(lon - long0);
        y = y0 - a * k0 * math.log(ts);
      }
      p.x = x;
      p.y = y;
      return p;
    }
  }

  @override
  Point inverse(Point p) {
    var x = p.x - x0;
    var y = p.y - y0;
    double lon, lat;
    if (sphere != null) {
      lat = consts.HALF_PI - 2 * math.atan(math.exp(-y / (a * k0)));
    } else {
      var ts = math.exp(-y / (a * k0));
      lat = utils.phi2z(e, ts);
      if (lat == -9999.0) {
        return null;
      }
    }
    lon = utils.adjust_lon(long0 + x / (a * k0));
    p.x = lon;
    p.y = lat;
    return p;
  }
}
