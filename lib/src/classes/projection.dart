import 'package:proj4dart/src/classes/datum.dart';
import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/common/datum_transform.dart' as dt;
import 'package:proj4dart/src/common/utils.dart' as utils;
import 'package:proj4dart/src/constants/values.dart' as consts;
import 'package:proj4dart/src/globals/projs.dart';
import 'package:proj4dart/src/constants/initializers.dart';

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

  /// Safest way to return WGS84 Projection from the [ProjStore] which cannot be overwritten
  /// even with [Projection.add].
  static Projection get WGS84 => ProjStore().WGS84;

  /// Find and return Projection based on code / alias from the [ProjStore]
  /// An Exception occours if Projection not exists in store.
  factory Projection(String code) {
    var result = ProjStore().get(code);

    if (result == null) {
      throw Exception(
          'There is no Projection registered with the following code / alias: $code');
    }

    return result;
  }

  /// Creates a Projection via [Projection.parse] and registers it to the [ProjStore].
  /// If register was successfull then it can be accessed anytime with [Projection] factory.
  /// Warning: this can override predefined Projections!
  factory Projection.add(String code, String defString) {
    var params = Projection.parse(defString);

    return ProjStore().register(code, params);
  }

  /// Creates a Projection from defString which can be valid proj4 string / ogc wkt string / esri wkt string
  factory Projection.parse(String defString) {
    var params = ProjParams(defString);

    var projName = params.proj;
    var initializer = initializers[projName];

    if (initializer == null) {
      throw Exception(
          'Projection initializer not found by projname: $projName');
    }

    return initializer(params);
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
      var wgs84 = WGS84;
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
        x: point.x - dest.from_greenwich,
        y: point.y,
        z: point.z ?? 0.0,
      );
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
