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
import 'package:proj4dart/src/projections/robin.dart';
import 'package:proj4dart/src/projections/sinu.dart';
import 'package:proj4dart/src/projections/somerc.dart';
import 'package:proj4dart/src/projections/stere.dart';
import 'package:proj4dart/src/projections/sterea.dart';
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
      ProjStore().add(PseudoMercatorProjection.names,
          PseudoMercatorProjection.init(params));
    } else if (LongLat.names.contains(projName)) {
      ProjStore().add(LongLat.names, LongLat.init(params));
    } else if (SwissObliqueMercatorProjection.names.contains(projName)) {
      ProjStore().add(SwissObliqueMercatorProjection.names,
          SwissObliqueMercatorProjection.init(params));
    } else if (AlbersProjection.names.contains(projName)) {
      ProjStore().add(AlbersProjection.names, AlbersProjection.init(params));
    } else if (AzimuthalEquidistantProjection.names.contains(projName)) {
      ProjStore().add(AzimuthalEquidistantProjection.names,
          AzimuthalEquidistantProjection.init(params));
    } else if (CassiniProjection.names.contains(projName)) {
      ProjStore().add(CassiniProjection.names, CassiniProjection.init(params));
    } else if (CentralCylindricalProjection.names.contains(projName)) {
      ProjStore().add(CentralCylindricalProjection.names,
          CentralCylindricalProjection.init(params));
    } else if (EquidistantCylindricalProjection.names.contains(projName)) {
      ProjStore().add(EquidistantCylindricalProjection.names,
          EquidistantCylindricalProjection.init(params));
    } else if (EquidistantConicProjection.names.contains(projName)) {
      ProjStore().add(EquidistantConicProjection.names,
          EquidistantConicProjection.init(params));
    } else if (ExtendedTransverseMercatorProjection.names.contains(projName)) {
      ProjStore().add(ExtendedTransverseMercatorProjection.names,
          ExtendedTransverseMercatorProjection.init(params));
    } else if (UniversalTransverseMercatorProjection.names.contains(projName)) {
      ProjStore().add(UniversalTransverseMercatorProjection.names,
          UniversalTransverseMercatorProjection.init(params));
    } else if (VanDerGrintenProjection.names.contains(projName)) {
      ProjStore().add(
          VanDerGrintenProjection.names, VanDerGrintenProjection.init(params));
    } else if (GaussProjection.names.contains(projName)) {
      ProjStore().add(GaussProjection.names, GaussProjection.init(params));
    } else if (StereographicNorthProjection.names.contains(projName)) {
      ProjStore().add(StereographicNorthProjection.names,
          StereographicNorthProjection.init(params));
    } else if (StereographicSouthProjection.names.contains(projName)) {
      ProjStore().add(StereographicSouthProjection.names,
          StereographicSouthProjection.init(params));
    } else if (SinusoidalProjection.names.contains(projName)) {
      ProjStore()
          .add(SinusoidalProjection.names, SinusoidalProjection.init(params));
    } else if (RobinsonProjection.names.contains(projName)) {
      ProjStore()
          .add(RobinsonProjection.names, RobinsonProjection.init(params));
    } else if (GeocentricProjection.names.contains(projName)) {
      ProjStore()
          .add(GeocentricProjection.names, GeocentricProjection.init(params));
    } else if (GnomicProjection.names.contains(projName)) {
      ProjStore().add(GnomicProjection.names, GnomicProjection.init(params));
    } else if (GaussSchreiberTransverseMercatorProjection.names
        .contains(projName)) {
      ProjStore().add(GaussSchreiberTransverseMercatorProjection.names,
          GaussSchreiberTransverseMercatorProjection.init(params));
    } else if (KrovakProjection.names.contains(projName)) {
      ProjStore().add(KrovakProjection.names, KrovakProjection.init(params));
    } else if (LambertAzimuthalEqualAreaProjection.names.contains(projName)) {
      ProjStore().add(LambertAzimuthalEqualAreaProjection.names,
          LambertAzimuthalEqualAreaProjection.init(params));
    } else if (LambertConformalConicProjection.names.contains(projName)) {
      ProjStore().add(LambertConformalConicProjection.names,
          LambertConformalConicProjection.init(params));
    } else if (MillerCylindricalProjection.names.contains(projName)) {
      ProjStore().add(MillerCylindricalProjection.names,
          MillerCylindricalProjection.init(params));
    } else if (MollweideProjection.names.contains(projName)) {
      ProjStore()
          .add(MollweideProjection.names, MollweideProjection.init(params));
    } else if (NewZealandMapGridProjection.names.contains(projName)) {
      ProjStore().add(NewZealandMapGridProjection.names,
          NewZealandMapGridProjection.init(params));
    } else if (HotlineObliqueMercatorProjection.names.contains(projName)) {
      ProjStore().add(HotlineObliqueMercatorProjection.names,
          HotlineObliqueMercatorProjection.init(params));
    } else if (OrthographicProjection.names.contains(projName)) {
      ProjStore().add(
          OrthographicProjection.names, OrthographicProjection.init(params));
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
    if (ProjStore().getProjections().isEmpty) {
      ProjStore().start();
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
