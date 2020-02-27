import 'dart:math' as math;

import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/common/utils.dart' as utils;

///  reference:
///    "Cartographic Projection Procedures for the UNIX Environment-
///    A User's Manual" by Gerald I. Evenden,
///    USGS Open File Report 90-284and Release 4 Interim Reports (2003)
class CentralCylindricalProjection extends Projection {
  static final List<String> names = [
    'cea',
  ];

  double long0;
  double x0;
  double y0;
  double lat_ts;

  CentralCylindricalProjection.init(ProjParams params) : super.init(params) {
    long0 = params.long0;
    x0 = params.x0;
    y0 = params.y0;
    lat_ts = params.lat_ts;

    //no-op
    if (sphere == null || !sphere) {
      k0 = utils.msfnz(e, math.sin(lat_ts), math.cos(lat_ts));
    }
  }

  /// Cylindrical Equal Area forward equations--mapping lat,long to x,y
  @override
  Point forward(Point p) {
    var lon = p.x;
    var lat = p.y;
    var x, y;
    var dlon = utils.adjust_lon(lon - long0);
    if (sphere != null && sphere) {
      x = x0 + a * dlon * math.cos(lat_ts);
      y = y0 + a * math.sin(lat) / math.cos(lat_ts);
    } else {
      var qs = utils.qsfnz(e, math.sin(lat));
      x = x0 + a * k0 * dlon;
      y = y0 + a * qs * 0.5 / k0;
    }

    p.x = x;
    p.y = y;
    return p;
  }

  /// Cylindrical Equal Area inverse equations--mapping x,y to lat/long
  @override
  Point inverse(Point p) {
    p.x -= x0;
    p.y -= y0;
    var lon, lat;

    if (sphere != null && sphere) {
      lon = utils.adjust_lon(long0 + (p.x / a) / math.cos(lat_ts));
      lat = math.asin((p.y / a) * math.cos(lat_ts));
    } else {
      lat = utils.iqsfnz(e, 2 * p.y * k0 / a);
      lon = utils.adjust_lon(long0 + p.x / (a * k0));
    }

    p.x = lon;
    p.y = lat;
    return p;
  }
}
