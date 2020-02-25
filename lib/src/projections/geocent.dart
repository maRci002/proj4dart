import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/common/datum_utils.dart' as datum_utils;

class GeocentricProjection extends Projection {
  static final List<String> names = [
    'Geocentric',
    'geocentric',
    'geocent',
    'Geocent'
  ];

  String name;

  GeocentricProjection.init(ProjParams params)
      : name = 'geocent',
        super.init(params);

  @override
  Point forward(Point p) {
    var point = datum_utils.geodeticToGeocentric(p, es, a);
    return point;
  }

  @override
  Point inverse(Point p) {
    var point = datum_utils.geocentricToGeodetic(p, es, a, b);
    return point;
  }
}
