import 'dart:math' as math;

import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/common/utils.dart' as utils;
import 'package:proj4dart/src/constants/values.dart' as consts;

class SinusoidalProjection extends Projection {
  static final List<String> names = ['Sinusoidal', 'sinu'];
  static final int MAX_ITER = 20;

  List<double> en;
  double lat0;
  double long0;
  double x0;
  double y0;

  double n;
  double m;
  double C_y;
  double C_x;

  SinusoidalProjection.init(ProjParams params)
      : lat0 = params.lat0,
        long0 = params.long0,
        x0 = params.x0,
        y0 = params.y0,
        super.init(params) {
    if (sphere == null || (sphere != null && !sphere)) {
      en = utils.pj_enfn(es);
    } else {
      n = 1.0;
      m = 0.0;
      es = 0.0;
      C_y = math.sqrt((m + 1) / n);
      C_x = C_y / (m + 1);
    }
  }

  @override
  Point forward(Point p) {
    double x, y;
    var lon = p.x;
    var lat = p.y;
    lon = utils.adjust_lon(lon - long0);

    if (sphere != null && sphere) {
      if (m == null) {
        lat = n != 1 ? math.asin(n * math.sin(lat)) : lat;
      } else {
        var k = n * math.sin(lat);
        for (var i = 0; i < MAX_ITER; i++) {
          var V = (m * lat + math.sin(lat) - k) / (m + math.cos(lat));
          lat -= V;
          if (V.abs() < consts.EPSLN) {
            break;
          }
        }
      }
      x = a * C_x * lon * (m + math.cos(lat));
      y = a * C_y * lat;
    } else {
      var s = math.sin(lat);
      var c = math.cos(lat);
      y = a * utils.pj_mlfn(lat, s, c, en);
      x = a * lon * c / math.sqrt(1 - es * s * s);
    }

    p.x = x;
    p.y = y;
    return p;
  }

  @override
  Point inverse(Point p) {
    double lat, temp, lon, s;

    p.x -= x0;
    lon = p.x / a;
    p.y -= y0;
    lat = p.y / a;

    if (sphere != null && sphere) {
      lat /= C_y;
      lon = lon / (C_x * (m + math.cos(lat)));
      if (m != null) {
        lat = utils.asinz((m * lat + math.sin(lat)) / n);
      } else if (n != 1) {
        lat = utils.asinz(math.sin(lat) / n);
      }
      lon = utils.adjust_lon(lon + long0);
      lat = utils.adjust_lat(lat);
    } else {
      lat = utils.pj_inv_mlfn(p.y / a, es, en);
      s = lat.abs();
      if (s < consts.HALF_PI) {
        s = math.sin(lat);
        temp = long0 + p.x * math.sqrt(1 - es * s * s) / (a * math.cos(lat));
        //temp = long0 + p.x / (a * math.cos(lat));
        lon = utils.adjust_lon(temp);
      } else if ((s - consts.EPSLN) < consts.HALF_PI) {
        lon = long0;
      }
    }
    p.x = lon;
    p.y = lat;
    return p;
  }
}
