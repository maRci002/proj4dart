import 'dart:math' as math;

import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/common/utils.dart' as utils;
import 'package:proj4dart/src/constants/values.dart' as consts;

var MAX_ITER = 20;

class GaussProjection extends Projection {
  static final List<String> names = ['gauss'];

  double lat0;
  double long0;
  double rc;
  double C;
  double phic0;
  double ratexp;
  double K;
  double x0;
  double y0;

  GaussProjection.init(ProjParams params)
      : lat0 = params.lat0,
        long0 = params.long0,
        x0 = params.x0,
        y0 = params.y0,
        super.init(params) {
    var sphi = math.sin(lat0);
    var cphi = math.cos(lat0);
    cphi *= cphi;
    rc = math.sqrt(1 - es) / (1 - es * sphi * sphi);
    C = math.sqrt(1 + es * cphi * cphi / (1 - es));
    phic0 = math.asin(sphi / C);
    ratexp = 0.5 * C * e;
    K = math.tan(0.5 * phic0 + consts.FORTPI) /
        (math.pow(math.tan(0.5 * lat0 + consts.FORTPI), C) *
            utils.srat(e * sphi, ratexp));
  }

  @override
  Point forward(Point p) {
    var lon = p.x;
    var lat = p.y;

    p.y = 2 *
            math.atan(K *
                math.pow(math.tan(0.5 * lat + consts.FORTPI), C) *
                utils.srat(e * math.sin(lat), ratexp)) -
        consts.HALF_PI;
    p.x = C * lon;
    return p;
  }

  @override
  Point inverse(Point p) {
    var DEL_TOL = 1e-14;
    var lon = p.x / C;
    var lat = p.y;
    var num = math.pow(math.tan(0.5 * lat + consts.FORTPI) / K, 1 / C);
    for (var i = 0; i < MAX_ITER; i++) {
      lat = 2 * math.atan(num * utils.srat(e * math.sin(p.y), -0.5 * e)) -
          consts.HALF_PI;
      if ((lat - p.y).abs() < DEL_TOL) {
        break;
      }
      p.y = lat;
    }
    // convergence failed
    // if (!i) {
    //   return null;
    // }
    p.x = lon;
    p.y = lat;
    return p;
  }
}
