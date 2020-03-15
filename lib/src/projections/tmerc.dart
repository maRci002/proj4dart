import 'dart:math' as math;

import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/common/utils.dart' as utils;
import 'package:proj4dart/src/constants/values.dart' as consts;

class TransverseMercatorProjection extends Projection {
  static final List<String> names = [
    'Transverse_Mercator',
    'Transverse Mercator',
    'tmerc'
  ];

  double lat0;
  double long0;
  double x0;
  double y0;
  List<double> en;
  double ml0;

  TransverseMercatorProjection.init(ProjParams params)
      : lat0 = params.lat0,
        long0 = params.long0,
        x0 = params.x0,
        y0 = params.y0,
        super.init(params) {
    x0 = x0 ?? 0.0;
    y0 = y0 ?? 0.0;
    if (long0 == null || long0.isNaN) {
      long0 = 0;
    }
    lat0 = lat0 ?? 0.0;

    if (es != null) {
      en = utils.pj_enfn(es);
      ml0 = utils.pj_mlfn(lat0, math.sin(lat0), math.cos(lat0), en);
    }
  }
  @override
  Point forward(Point p) {
    var lon = p.x;
    var lat = p.y;

    var delta_lon = utils.adjust_lon(lon - long0);
    double con;
    double x, y;
    var sin_phi = math.sin(lat);
    var cos_phi = math.cos(lat);

    if (es == null) {
      var b = cos_phi * math.sin(delta_lon);

      if (((b.abs() - 1).abs()) < consts.EPSLN) {
        //...reportError("tmerc:forward: Point projects into infinity");
        return p;
      } else {
        x = 0.5 * a * k0 * math.log((1 + b) / (1 - b)) + x0;
        y = cos_phi * math.cos(delta_lon) / math.sqrt(1 - math.pow(b, 2));
        b = y.abs();

        if (b >= 1) {
          if ((b - 1) > consts.EPSLN) {
            //...reportError("tmerc:forward: Point projects into infinity");
            return p;
          } else {
            y = 0;
          }
        } else {
          y = math.acos(y);
        }

        if (lat < 0) {
          y = -y;
        }

        y = a * k0 * (y - lat0) + y0;
      }
    } else {
      var al = cos_phi * delta_lon;
      var als = math.pow(al, 2);
      var c = ep2 * math.pow(cos_phi, 2);
      var cs = math.pow(c, 2);
      var tq = cos_phi.abs() > consts.EPSLN ? math.tan(lat) : 0;
      var t = math.pow(tq, 2);
      var ts = math.pow(t, 2);
      con = 1 - es * math.pow(sin_phi, 2);
      al = al / math.sqrt(con);
      var ml = utils.pj_mlfn(lat, sin_phi, cos_phi, en);

      x = a *
              (k0 *
                  al *
                  (1 +
                      als /
                          6 *
                          (1 -
                              t +
                              c +
                              als /
                                  20 *
                                  (5 -
                                      18 * t +
                                      ts +
                                      14 * c -
                                      58 * t * c +
                                      als /
                                          42 *
                                          (61 +
                                              179 * ts -
                                              ts * t -
                                              479 * t))))) +
          x0;

      y = a *
              (k0 *
                  (ml -
                      ml0 +
                      sin_phi *
                          delta_lon *
                          al /
                          2 *
                          (1 +
                              als /
                                  12 *
                                  (5 -
                                      t +
                                      9 * c +
                                      4 * cs +
                                      als /
                                          30 *
                                          (61 +
                                              ts -
                                              58 * t +
                                              270 * c -
                                              330 * t * c +
                                              als /
                                                  56 *
                                                  (1385 +
                                                      543 * ts -
                                                      ts * t -
                                                      3111 * t)))))) +
          y0;
    }

    p.x = x;
    p.y = y;

    return p;
  }

  @override
  Point inverse(Point p) {
    double con, phi;
    double lat, lon;
    var x = (p.x - x0) * (1 / a);
    var y = (p.y - y0) * (1 / a);

    if (es == null) {
      var f = math.exp(x / k0);
      var g = 0.5 * (f - 1 / f);
      var temp = lat0 + y / k0;
      var h = math.cos(temp);
      con = math.sqrt((1 - math.pow(h, 2)) / (1 + math.pow(g, 2)));
      lat = math.asin(con);

      if (y < 0) {
        lat = -lat;
      }

      if ((g == 0) && (h == 0)) {
        lon = 0;
      } else {
        lon = utils.adjust_lon(math.atan2(g, h) + long0);
      }
    } else {
      // ellipsoidal form
      con = ml0 + y / k0;
      phi = utils.pj_inv_mlfn(con, es, en);

      if (phi.abs() < consts.HALF_PI) {
        var sin_phi = math.sin(phi);
        var cos_phi = math.cos(phi);
        var tan_phi = cos_phi.abs() > consts.EPSLN ? math.tan(phi) : 0;
        var c = ep2 * math.pow(cos_phi, 2);
        var cs = math.pow(c, 2);
        var t = math.pow(tan_phi, 2);
        var ts = math.pow(t, 2);
        con = 1 - es * math.pow(sin_phi, 2);
        var d = x * math.sqrt(con) / k0;
        var ds = math.pow(d, 2);
        con = con * tan_phi;

        lat = phi -
            (con * ds / (1 - es)) *
                0.5 *
                (1 -
                    ds /
                        12 *
                        (5 +
                            3 * t -
                            9 * c * t +
                            c -
                            4 * cs -
                            ds /
                                30 *
                                (61 +
                                    90 * t -
                                    252 * c * t +
                                    45 * ts +
                                    46 * c -
                                    ds /
                                        56 *
                                        (1385 +
                                            3633 * t +
                                            4095 * ts +
                                            1574 * ts * t))));

        lon = utils.adjust_lon(long0 +
            (d *
                (1 -
                    ds /
                        6 *
                        (1 +
                            2 * t +
                            c -
                            ds /
                                20 *
                                (5 +
                                    28 * t +
                                    24 * ts +
                                    8 * c * t +
                                    6 * c -
                                    ds /
                                        42 *
                                        (61 +
                                            662 * t +
                                            1320 * ts +
                                            720 * ts * t)))) /
                cos_phi));
      } else {
        lat = consts.HALF_PI * utils.sign(y);
        lon = 0;
      }
    }

    p.x = lon;
    p.y = lat;

    return p;
  }
}
