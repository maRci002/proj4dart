import 'package:proj4dart/src/classes/datum.dart';
import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/common/datum_transform.dart' as dt;
import 'package:proj4dart/src/common/utils.dart' as utils;
import 'package:proj4dart/src/constants/values.dart' as consts;
import 'package:proj4dart/src/globals/defs.dart';
import 'package:proj4dart/src/globals/projs.dart';
import 'package:proj4dart/src/projections/aea.dart';
import 'package:proj4dart/src/projections/aeqd.dart';
import 'package:proj4dart/src/projections/cass.dart';
import 'package:proj4dart/src/projections/cea.dart';
import 'package:proj4dart/src/projections/eqc.dart';
import 'package:proj4dart/src/projections/eqdc.dart';
import 'package:proj4dart/src/projections/etmerc.dart';
import 'package:proj4dart/src/projections/gauss.dart';
import 'package:proj4dart/src/projections/geocent.dart';
import 'package:proj4dart/src/projections/gnom.dart';
import 'package:proj4dart/src/projections/gstmerc.dart';
import 'package:proj4dart/src/projections/krovak.dart';
import 'package:proj4dart/src/projections/laea.dart';
import 'package:proj4dart/src/projections/lcc.dart';
import 'package:proj4dart/src/projections/longlat.dart';
import 'package:proj4dart/src/projections/merc.dart';
import 'package:proj4dart/src/projections/mill.dart';
import 'package:proj4dart/src/projections/moll.dart';
import 'package:proj4dart/src/projections/nzmg.dart';
import 'package:proj4dart/src/projections/omerc.dart';
import 'package:proj4dart/src/projections/ortho.dart';
import 'package:proj4dart/src/projections/poly.dart';
import 'package:proj4dart/src/projections/qsc.dart';
import 'package:proj4dart/src/projections/robin.dart';
import 'package:proj4dart/src/projections/sinu.dart';
import 'package:proj4dart/src/projections/somerc.dart';
import 'package:proj4dart/src/projections/stere.dart';
import 'package:proj4dart/src/projections/sterea.dart';
import 'package:proj4dart/src/projections/tmerc.dart';
import 'package:proj4dart/src/projections/utm.dart';
import 'package:proj4dart/src/projections/vandg.dart';

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

  factory Projection.register(String code, ProjParams params) {
    var projName = params.proj;

    if (PseudoMercatorProjection.names.contains(projName)) {
      ProjStore().add(PseudoMercatorProjection.init(params), params.srsCode);
    } else if (LongLat.names.contains(projName)) {
      ProjStore().add(LongLat.init(params), params.srsCode);
    } else if (SwissObliqueMercatorProjection.names.contains(projName)) {
      ProjStore()
          .add(SwissObliqueMercatorProjection.init(params), params.srsCode);
    } else if (AlbersProjection.names.contains(projName)) {
      ProjStore().add(AlbersProjection.init(params), params.srsCode);
    } else if (AzimuthalEquidistantProjection.names.contains(projName)) {
      ProjStore()
          .add(AzimuthalEquidistantProjection.init(params), params.srsCode);
    } else if (CassiniProjection.names.contains(projName)) {
      ProjStore().add(CassiniProjection.init(params), params.srsCode);
    } else if (CentralCylindricalProjection.names.contains(projName)) {
      ProjStore()
          .add(CentralCylindricalProjection.init(params), params.srsCode);
    } else if (EquidistantCylindricalProjection.names.contains(projName)) {
      ProjStore()
          .add(EquidistantCylindricalProjection.init(params), params.srsCode);
    } else if (EquidistantConicProjection.names.contains(projName)) {
      ProjStore().add(EquidistantConicProjection.init(params), params.srsCode);
    } else if (ExtendedTransverseMercatorProjection.names.contains(projName)) {
      ProjStore().add(
          ExtendedTransverseMercatorProjection.init(params), params.srsCode);
    } else if (UniversalTransverseMercatorProjection.names.contains(projName)) {
      ProjStore().add(
          UniversalTransverseMercatorProjection.init(params), params.srsCode);
    } else if (VanDerGrintenProjection.names.contains(projName)) {
      ProjStore().add(VanDerGrintenProjection.init(params), params.srsCode);
    } else if (GaussProjection.names.contains(projName)) {
      ProjStore().add(GaussProjection.init(params), params.srsCode);
    } else if (StereographicNorthProjection.names.contains(projName)) {
      ProjStore()
          .add(StereographicNorthProjection.init(params), params.srsCode);
    } else if (StereographicSouthProjection.names.contains(projName)) {
      ProjStore()
          .add(StereographicSouthProjection.init(params), params.srsCode);
    } else if (SinusoidalProjection.names.contains(projName)) {
      ProjStore().add(SinusoidalProjection.init(params), params.srsCode);
    } else if (RobinsonProjection.names.contains(projName)) {
      ProjStore().add(RobinsonProjection.init(params), params.srsCode);
    } else if (GeocentricProjection.names.contains(projName)) {
      ProjStore().add(GeocentricProjection.init(params), params.srsCode);
    } else if (GnomicProjection.names.contains(projName)) {
      ProjStore().add(GnomicProjection.init(params), params.srsCode);
    } else if (GaussSchreiberTransverseMercatorProjection.names
        .contains(projName)) {
      ProjStore().add(GaussSchreiberTransverseMercatorProjection.init(params),
          params.srsCode);
    } else if (KrovakProjection.names.contains(projName)) {
      ProjStore().add(KrovakProjection.init(params), params.srsCode);
    } else if (LambertAzimuthalEqualAreaProjection.names.contains(projName)) {
      ProjStore().add(
          LambertAzimuthalEqualAreaProjection.init(params), params.srsCode);
    } else if (LambertConformalConicProjection.names.contains(projName)) {
      ProjStore()
          .add(LambertConformalConicProjection.init(params), params.srsCode);
    } else if (MillerCylindricalProjection.names.contains(projName)) {
      ProjStore().add(MillerCylindricalProjection.init(params), params.srsCode);
    } else if (MollweideProjection.names.contains(projName)) {
      ProjStore().add(MollweideProjection.init(params), params.srsCode);
    } else if (NewZealandMapGridProjection.names.contains(projName)) {
      ProjStore().add(NewZealandMapGridProjection.init(params), params.srsCode);
    } else if (HotlineObliqueMercatorProjection.names.contains(projName)) {
      ProjStore()
          .add(HotlineObliqueMercatorProjection.init(params), params.srsCode);
    } else if (OrthographicProjection.names.contains(projName)) {
      ProjStore().add(OrthographicProjection.init(params), params.srsCode);
    } else if (PolyconicProjection.names.contains(projName)) {
      ProjStore().add(PolyconicProjection.init(params), params.srsCode);
    } else if (QuadrilateralizedSphericalCubeProjection.names
        .contains(projName)) {
      ProjStore().add(QuadrilateralizedSphericalCubeProjection.init(params),
          params.srsCode);
    } else if (TransverseMercatorProjection.names.contains(projName)) {
      ProjStore()
          .add(TransverseMercatorProjection.init(params), params.srsCode);
    }
    var projection = ProjStore().get(params.srsCode);
    if (projection == null) {
      throw Exception('Projection not found: $code, $params');
    }
    return projection;
  }

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
