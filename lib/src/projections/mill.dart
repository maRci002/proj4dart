import 'dart:math' as math;

import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/common/utils.dart' as utils;

class MillerCylindricalProjection extends Projection {
  static final List<String> names = ['Miller_Cylindrical', 'mill'];

  double long0;
  double x0;
  double y0;

  MillerCylindricalProjection.init(ProjParams params)
      : long0 = params.long0,
        x0 = params.x0,
        y0 = params.y0,
        super.init(params);

  @override
  Point forward(Point p) {
    var lon = p.x;
    var lat = p.y;
    var dlon = utils.adjust_lon(lon - long0);
    var x = x0 + a * dlon;
    var y = y0 + a * math.log(math.tan((math.pi / 4) + (lat / 2.5))) * 1.25;

    p.x = x;
    p.y = y;
    return p;
  }

  @override
  Point inverse(Point p) {
    p.x -= x0;
    p.y -= y0;

    var lon = utils.adjust_lon(long0 + p.x / a);
    var lat = 2.5 * (math.atan(math.exp(0.8 * p.y / a)) - math.pi / 4);

    p.x = lon;
    p.y = lat;
    return p;
  }
}
