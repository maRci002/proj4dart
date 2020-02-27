import 'dart:math' as math;

import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/common/utils.dart' as utils;
import 'package:proj4dart/src/constants/values.dart' as consts;

class VanDerGrintenProjection extends Projection {
  static final List<String> names = [
    'Van_der_Grinten_I',
    'VanDerGrinten',
    'vandg'
  ];

  double R;
  double long0;
  double x0;
  double y0;

  VanDerGrintenProjection.init(ProjParams params) : super.init(params) {
    R = params.a;
    long0 = params.long0;
    x0 = params.x0;
    y0 = params.y0;
  }

  @override
  Point forward(Point p) {
    var lon = p.x;
    var lat = p.y;

    var dlon = utils.adjust_lon(lon - long0);
    var x, y;

    if (lat.abs() <= consts.EPSLN) {
      x = x0 + R * dlon;
      y = y0;
    }
    var theta = utils.asinz(2 * (lat / math.pi).abs());
    if ((dlon.abs() <= consts.EPSLN) ||
        ((lat.abs() - consts.HALF_PI).abs() <= consts.EPSLN)) {
      x = x0;
      if (lat >= 0) {
        y = y0 + math.pi * R * math.tan(0.5 * theta);
      } else {
        y = y0 + math.pi * R * -math.tan(0.5 * theta);
      }
      //  return(OK);
    }
    var al = 0.5 * ((math.pi / dlon) - (dlon / math.pi)).abs();
    var asq = al * al;
    var sinth = math.sin(theta);
    var costh = math.cos(theta);

    var g = costh / (sinth + costh - 1);
    var gsq = g * g;
    var m = g * (2 / sinth - 1);
    var msq = m * m;
    var con = math.pi *
        R *
        (al * (g - msq) +
            math.sqrt(
                asq * (g - msq) * (g - msq) - (msq + asq) * (gsq - msq))) /
        (msq + asq);
    if (dlon < 0) {
      con = -con;
    }
    x = x0 + con;
    //con = math.abs(con / (math.pi * R));
    var q = asq + g;
    con = math.pi *
        R *
        (m * q - al * math.sqrt((msq + asq) * (asq + 1) - q * q)) /
        (msq + asq);
    if (lat >= 0) {
      //y = y0 + math.pi * R * math.sqrt(1 - con * con - 2 * al * con);
      y = y0 + con;
    } else {
      //y = y0 - math.pi * R * math.sqrt(1 - con * con - 2 * al * con);
      y = y0 - con;
    }
    p.x = x;
    p.y = y;
    return p;
  }

  @override
  Point inverse(Point p) {
    double lon, lat;
    double xx, yy, xys, c1, c2, c3;
    double a1;
    double m1;
    double con;
    double th1;
    double d;

    p.x -= x0;
    p.y -= y0;
    con = math.pi * R;
    xx = p.x / con;
    yy = p.y / con;
    xys = xx * xx + yy * yy;
    c1 = -(yy.abs()) * (1 + xys);
    c2 = c1 - 2 * yy * yy + xx * xx;
    c3 = -2 * c1 + 1 + 2 * yy * yy + xys * xys;
    d = yy * yy / c3 +
        (2 * c2 * c2 * c2 / c3 / c3 / c3 - 9 * c1 * c2 / c3 / c3) / 27;
    a1 = (c1 - c2 * c2 / 3 / c3) / c3;
    m1 = 2 * math.sqrt(-a1 / 3);
    con = ((3 * d) / a1) / m1;
    if (con.abs() > 1) {
      if (con >= 0) {
        con = 1;
      } else {
        con = -1;
      }
    }
    th1 = math.acos(con) / 3;
    if (p.y >= 0) {
      lat = (-m1 * math.cos(th1 + math.pi / 3) - c2 / 3 / c3) * math.pi;
    } else {
      lat = -(-m1 * math.cos(th1 + math.pi / 3) - c2 / 3 / c3) * math.pi;
    }

    if (xx.abs() < consts.EPSLN) {
      lon = long0;
    } else {
      lon = utils.adjust_lon(long0 +
          math.pi *
              (xys - 1 + math.sqrt(1 + 2 * (xx * xx - yy * yy) + xys * xys)) /
              2 /
              xx);
    }

    p.x = lon;
    p.y = lat;
    return p;
  }
}
