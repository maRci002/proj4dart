import 'package:proj4dart/src/classes/datum.dart';
import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/common/datum_transform.dart' as dt;
import 'package:proj4dart/src/constants/values.dart' as consts;
import 'package:proj4dart/src/globals/defs.dart';
import 'package:proj4dart/src/globals/projs.dart';
import 'package:proj4dart/src/projections/longlat.dart';
import 'package:proj4dart/src/projections/merc.dart';
import 'package:proj4dart/src/projections/somerc.dart';

abstract class Projection {
  String projName;
  String ellps;
  bool noDefs;
  double k0;
  String axis;
  double a;
  double b;
  double rf;
  bool sphere;
  double es;
  double e;
  double ep2;
  Datum datum;

  Point forward(Point p);

  Point inverse(Point p);

  // List<String> get names;

  Projection.init(ProjParams params)
      : projName = params.proj,
        ellps = params.ellps,
        noDefs = params.no_defs,
        k0 = params.k0,
        axis = params.axis,
        a = params.a,
        b = params.b,
        rf = params.rf,
        sphere = params.sphere,
        es = params.es,
        e = params.e,
        ep2 = params.ep2,
        datum = params.datum;

  factory Projection.register(String code, ProjParams params) {
    var projName = params.proj;

    if (MercProjection.names.contains(projName)) {
      ProjStore().add(MercProjection.names, MercProjection.init(params));
    } else if (LongLat.names.contains(projName)) {
      ProjStore().add(LongLat.names, LongLat.init(params));
    } else if (SwissObliqueMercatorProjection.names.contains(projName)) {
      ProjStore().add(SwissObliqueMercatorProjection.names,
          SwissObliqueMercatorProjection.init(params));
    }
    var projection = ProjStore().get(code);
    if (projection == null) {
      throw Exception('An error occured while registering $code, $params');
    }
    return projection;
  }

  factory Projection(String code) {
    var params = ProjDefStore().get(code);
    if (params == null) {
      throw Exception('Proj def not yet registered: $code');
    }
    var projection = ProjStore().get(code);
    projection ??= Projection.register(code, params);
    if (projection == null) {
      throw Exception(
          "$code projection isn't defined, make sure you defined it by 'Projection.register(String, String)'");
    }
    return projection;
  }

  static bool _checkNotWGS(Projection source, Projection dest) {
    return ((source.datum.datumType == consts.PJD_3PARAM ||
                source.datum.datumType == consts.PJD_7PARAM) &&
            (dest is LongLat && dest.datumCode != 'WGS84')) ||
        ((dest.datum.datumType == consts.PJD_3PARAM ||
                dest.datum.datumType == consts.PJD_7PARAM) &&
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
        x: point.x * consts.D2R,
        y: point.y * consts.D2R,
        z: point.z ?? 0,
      );
    } else {
      point = source.inverse(point); // Convert Cartesian to longlat
    }

    // Convert datums if needed, and if possible.
    point = dt.transform(source.datum, dest.datum, point);

    if (dest.projName == 'longlat') {
      // convert radians to decimal degrees
      point = Point.withZ(
        x: point.x * consts.R2D,
        y: point.y * consts.R2D,
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
