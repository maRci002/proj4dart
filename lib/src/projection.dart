import 'package:proj4dart/src/proj_defs.dart';
import 'package:proj4dart/src/projections/longlat.dart';

import 'datum.dart';
import 'package:proj4dart/src/constants.dart' as consts;
import 'package:proj4dart/src/point.dart';

abstract class Projection {
  final String title;
  final String projName;
  final double k0;
  final String ellps;
  final List<double> datumParams;
  final String units;
  final String axis;
  final int a;
  final double b;
  final double rf;
  final double es;
  final double e;
  final double ep2;
  final Datum datum;

  Point forward(Point p);

  Point inverse(Point p);

  List<String> get names;

  // TODO: validate these are the real basic params?
  Projection.init(Map<String, dynamic> map)
      : title = map['title'],
        projName = map['projName'],
        k0 = map['k0'],
        ellps = map['ellps'],
        datumParams = map['datum_params']?.cast<double>(),
        units = map['units'],
        axis = map['axis'],
        a = map['a'],
        b = map['b'],
        rf = map['rf'],
        es = map['es'],
        e = map['e'],
        ep2 = map['ep2'],
        datum = Datum.fromJSON(map['datum']);

  factory Projection.register(String code, String projString) {
    var projection = ProjDefs().register(code, projString);
    // if (projection == null) {
    //   throw Exception('An error occured while registering $code, $projString');
    // }
    return projection;
  }

  factory Projection(String code) {
    var projection = ProjDefs().get(code);
    if (projection == null) {
      throw Exception(
          "$code projection isn't defined, make sure you defined it by 'Projection.register(String, String)'");
    }
    return projection;
  }

  static bool _checkNotWGS(Projection source, Projection dest) {
    return ((source.datum.datumType == consts.pjd3Param ||
                source.datum.datumType == consts.pjd7Param) &&
            (dest is LongLat && dest.datumCode != 'WGS84')) ||
        ((dest.datum.datumType == consts.pjd3Param ||
                dest.datum.datumType == consts.pjd7Param) &&
            (source is LongLat && source.datumCode != 'WGS84'));
  }

  Point transform(Projection dest, Point point) {
    var source = this;
    var shouldRemoveZ = point.z == null;

    // Workaround for datum shifts towgs84, if either source or destination projection is not wgs84
    if (source.datum != null &&
        dest.datum != null &&
        _checkNotWGS(source, dest)) {
      var wgs84 = Projection('EPSG:4326');
      point = source.transform(wgs84, point);
      source = wgs84;
    }

    // Transform source points to long/lat, if they aren't already.
    if (source.projName == 'longlat') {
      point = Point.withZ(
        x: point.x * consts.d2r,
        y: point.y * consts.d2r,
        z: point.z ?? 0,
      );
    } else {
      point = source.inverse(point); // Convert Cartesian to longlat
    }

    // Convert datums if needed, and if possible.
    point = Datum.datumTransform(source.datum, dest.datum, point);

    if (dest.projName == 'longlat') {
      // convert radians to decimal degrees
      point = Point.withZ(
        x: point.x * consts.r2d,
        y: point.y * consts.r2d,
        z: point.z ?? 0,
      );
    } else {
      // else project
      point = dest.forward(point);
    }

    if (shouldRemoveZ && point.z != null) {
      return Point(x: point.x, y: point.y);
    } else {
      return point;
    }
  }
}
