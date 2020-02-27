import 'package:proj4dart/src/classes/datum.dart';
import 'package:proj4dart/src/classes/initializers.dart';
import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/common/datum_transform.dart' as dt;
import 'package:proj4dart/src/common/utils.dart' as utils;
import 'package:proj4dart/src/constants/values.dart' as consts;
import 'package:proj4dart/src/globals/defs.dart';
import 'package:proj4dart/src/globals/projs.dart';

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
  double from_greenwich;
  double to_meter;

  Point forward(Point p);

  Point inverse(Point p);

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
        datum = params.datum,
        from_greenwich = params.from_greenwich,
        to_meter = params.to_meter;

  factory Projection(String code) {
    var params = ProjDefStore().get(code);
    if (params == null) {
      throw Exception('Proj def not yet registered: $code');
    }
    if (ProjStore().getProjections().isEmpty) {
      ProjStore().start();
    }
    var projection = ProjStore().get(params.srsCode);
    projection ??= Projection.register(code, params);
    if (projection == null) {
      throw Exception(
          "$code projection isn't defined, make sure you defined it by 'Projection.register(String, String)'");
    }
    return projection;
  }

  // TODO: register and other function like forward should be private
  factory Projection.register(String code, ProjParams params) {
    var projName = params.proj;
    var initializer = initializers[projName];

    if (initializer == null) {
      throw Exception('Projection not found: $code, $params');
    }

    ProjStore().add(initializer(params), params.srsCode);
    var projection = ProjStore().get(params.srsCode);

    return projection;
  }

  factory Projection.add(String code, String defCode) {
    if (ProjStore().getProjections().isEmpty) {
      ProjStore().start();
    }
    ProjParams params;
    if (ProjDefStore().codes().contains(code)) {
      params = ProjDefStore().get(code);
      var existingProjection = ProjStore().get(code);
      if (existingProjection != null) {
        return existingProjection;
      } else {
        return Projection.register(code, params);
      }
    }
    params = ProjParams(defCode);
    ProjDefStore().register(code, defCode);
    return Projection.register(code, params);
  }

  static bool _checkNotWGS(Projection source, Projection dest) {
    return ((source.datum.datumType == consts.PJD_3PARAM ||
                source.datum.datumType == consts.PJD_7PARAM) &&
            dest.projName != 'longlat') ||
        ((dest.datum.datumType == consts.PJD_3PARAM ||
                dest.datum.datumType == consts.PJD_7PARAM) &&
            source.projName != 'longlat');
  }

  Point transform(Projection dest, Point point) {
    var source = this;
    point = Point.copy(point); // make sure we don't mutate incoming point
    var shouldRemoveZ = point.z == null;

    utils.checkSanity(point);

    // Workaround for datum shifts towgs84, if either source or destination projection is not wgs84
    if (source.datum != null &&
        dest.datum != null &&
        _checkNotWGS(source, dest)) {
      var wgs84 = Projection('EPSG:4326');
      point = source.transform(wgs84, point);
      source = wgs84;
    }
    // DGR, 2010/11/12
    if (source.axis != 'enu') {
      point = utils.adjust_axis(source, false, point);
    }
    // Transform source points to long/lat, if they aren't already.
    if (source.projName == 'longlat') {
      point = Point.withZ(
        x: point.x * consts.D2R,
        y: point.y * consts.D2R,
        z: point.z ?? 0,
      );
    } else {
      if (source.to_meter != null) {
        point = Point.withZ(
            x: point.x * source.to_meter,
            y: point.y * source.to_meter,
            z: point.z ?? 0.0);
      }
      point = source.inverse(point); // Convert Cartesian to longlat
    }
    if (source.from_greenwich != null) {
      point.x += source.from_greenwich;
    }

    // Convert datums if needed, and if possible.
    point = dt.transform(source.datum, dest.datum, point);
    // Adjust for the prime meridian if necessary
    if (dest.from_greenwich != null) {
      point = Point.withZ(
          x: point.x - dest.from_greenwich, y: point.y, z: point.z ?? 0.0);
    }

    if (dest.projName == 'longlat') {
      // convert radians to decimal degrees
      point = Point.withZ(
        x: point.x * consts.R2D,
        y: point.y * consts.R2D,
        z: point.z ?? 0.0,
      );
    } else {
      // else project
      point = dest.forward(point);
      if (dest.to_meter != null) {
        point = Point.withZ(
            x: point.x / dest.to_meter,
            y: point.y / dest.to_meter,
            z: point.z ?? 0.0);
      }
    }

    // DGR, 2010/11/12
    if (dest.axis != 'enu') {
      return utils.adjust_axis(dest, true, point);
    }

    if (shouldRemoveZ && point.z != null) {
      return Point(x: point.x, y: point.y);
    } else {
      return point;
    }
  }
}
