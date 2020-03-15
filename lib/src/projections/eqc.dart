import 'dart:math' as math;

import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/common/utils.dart' as utils;

class EquidistantCylindricalProjection extends Projection {
  static final List<String> names = [
    'Equirectangular',
    'Equidistant_Cylindrical',
    'eqc'
  ];

  double long0;
  double x0;
  double y0;
  double lat_ts;
  double lat0;
  double rc;

  EquidistantCylindricalProjection.init(ProjParams params)
      : super.init(params) {
    long0 = params.long0;
    x0 = params.x0;
    y0 = params.y0;
    lat_ts = params.lat_ts;
    lat0 = params.lat0;

    x0 = x0 ?? 0;
    y0 = y0 ?? 0;
    lat0 = lat0 ?? 0;
    if (long0 == null || long0.isNaN) {
      long0 = 0;
    }
    lat_ts = lat_ts ?? 0;
    // title = title ?? 'Equidistant Cylindrical (Plate Carre)';

    rc = math.cos(lat_ts);
  }

  /// forward equations--mapping lat,long to x,y
  @override
  Point forward(Point p) {
    var lon = p.x;
    var lat = p.y;

    var dlon = utils.adjust_lon(lon - long0);
    var dlat = utils.adjust_lat(lat - lat0);
    p.x = x0 + (a * dlon * rc);
    p.y = y0 + (a * dlat);
    return p;
  }

  /// inverse equations--mapping x,y to lat/long
  @override
  Point inverse(Point p) {
    var x = p.x;
    var y = p.y;

    p.x = utils.adjust_lon(long0 + ((x - x0) / (a * rc)));
    p.y = utils.adjust_lat(lat0 + ((y - y0) / (a)));
    return p;
  }
}
