import 'dart:math' as math;

import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/common/utils.dart' as utils;

class GaussSchreiberTransverseMercatorProjection extends Projection {
  static final List<String> names = ['gstmerg', 'gstmerc'];

  double long0;
  double lat0;
  double x0;
  double y0;
  double lc;
  double rs;
  double cp;
  double n2;
  double xs;
  double ys;
  String title;

  GaussSchreiberTransverseMercatorProjection.init(ProjParams params)
      : super.init(params) {
    // array of:  a, b, lon0, lat0, k0, x0, y0
    var temp = b / a;
    e = math.sqrt(1 - temp * temp);
    lc = long0;
    rs = math.sqrt(1 + e * e * math.pow(math.cos(lat0), 4) / (1 - e * e));
    var sinz = math.sin(lat0);
    var pc = math.asin(sinz / rs);
    var sinzpc = math.sin(pc);
    cp = utils.latiso(0, pc, sinzpc) - rs * utils.latiso(e, lat0, sinz);
    n2 = k0 * a * math.sqrt(1 - e * e) / (1 - e * e * sinz * sinz);
    xs = x0;
    ys = y0 - n2 * pc;

    if (title == null || title.isEmpty) {
      title = 'Gauss Schreiber transverse mercator';
    }
  }

  @override
  Point forward(Point p) {
    var lon = p.x;
    var lat = p.y;

    var L = rs * (lon - lc);
    var Ls = cp + (rs * utils.latiso(e, lat, math.sin(lat)));
    var lat1 = math.asin(math.sin(L) / utils.cosh(Ls));
    var Ls1 = utils.latiso(0, lat1, math.sin(lat1));
    p.x = xs + (n2 * Ls1);
    p.y = ys + (n2 * math.atan(utils.sinh(Ls) / math.cos(L)));
    return p;
  }

  @override
  Point inverse(Point p) {
    var x = p.x;
    var y = p.y;

    var L = math.atan(utils.sinh((x - xs) / n2) / math.cos((y - ys) / n2));
    var lat1 = math.asin(math.sin((y - ys) / n2) / utils.cosh((x - xs) / n2));
    var LC = utils.latiso(0, lat1, math.sin(lat1));
    p.x = lc + L / rs;
    p.y = utils.invlatiso(e, (LC - cp) / rs);
    return p;
  }
}
