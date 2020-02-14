import 'dart:convert';
import 'dart:math' as math;

import 'datum.dart';
import 'package:proj4dart/src/constants.dart' as consts;
import 'package:proj4dart/src/point.dart';
import 'package:proj4dart/src/util.dart';
import 'package:proj4dart/src/projections/epsg4326.dart';

class Projection {
  String title;
  String datumCode;
  String datumName;
  String projName;
  double lat0;
  double long0;
  double k0;
  int x0;
  int y0;
  String ellps;
  List<double> datumParams;
  String units;
  bool noDefs;
  String axis;
  List<String> names;
  int a;
  double b;
  double rf;
  double es;
  double e;
  double ep2;
  Datum datum;
  double lambda0;
  double r;
  double alpha;
  double b0;
  double k;

  Projection.fromJson(Map<String, dynamic> map)
      : title = map['title'],
        datumCode = map['datumCode'],
        datumName = map['datumName'],
        projName = map['projName'],
        lat0 = map['lat0'],
        long0 = map['long0'],
        k0 = map['k0'],
        x0 = map['x0'],
        y0 = map['y0'],
        ellps = map['ellps'],
        datumParams = map['datum_params']?.cast<double>(),
        units = map['units'],
        noDefs = map['no_defs'],
        axis = map['axis'],
        names = map['names']?.cast<String>(),
        a = map['a'],
        b = map['b'],
        rf = map['rf'],
        es = map['es'],
        e = map['e'],
        ep2 = map['ep2'],
        datum = Datum.fromJSON(map['datum']),
        lambda0 = map['lambda0'],
        r = map['R'],
        alpha = map['alpha'],
        b0 = map['b0'],
        k = map['K'];

  static bool _checkNotWGS(Projection source, Projection dest) {
    return ((source.datum.datumType == consts.pjd3Param ||
                source.datum.datumType == consts.pjd7Param) &&
            dest.datumCode != 'WGS84') ||
        ((dest.datum.datumType == consts.pjd3Param ||
                dest.datum.datumType == consts.pjd7Param) &&
            source.datumCode != 'WGS84');
  }

  Point transform(Projection dest, Point point) {
    var source = this;
    var shouldRemoveZ = point.z == null;

    // Workaround for datum shifts towgs84, if either source or destination projection is not wgs84
    if (source.datum != null &&
        dest.datum != null &&
        _checkNotWGS(source, dest)) {
      var wgs84 = Projection.fromJson(
          json.decode(epsg4326JSON)); // TODO: wgs84 need some cache mechanism
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
      point = source._inverse(point); // Convert Cartesian to longlat
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
      point = dest._forward(point);
    }

    if (shouldRemoveZ && point.z != null) {
      return Point(x: point.x, y: point.y);
    } else {
      return point;
    }
  }

  Point _forward(Point p) {
    var sa1 = math.log(math.tan(math.pi / 4 - p.y / 2));
    var sa2 =
        e / 2 * math.log((1 + e * math.sin(p.y)) / (1 - e * math.sin(p.y)));
    var s = -alpha * (sa1 + sa2) + k;

    // spheric latitude
    var b = 2 * (math.atan(math.exp(s)) - math.pi / 4);

    // spheric longitude
    var i = alpha * (p.x - lambda0);

    // psoeudo equatorial rotation
    var rotI = math.atan(math.sin(i) /
        (math.sin(b0) * math.tan(b) + math.cos(b0) * math.cos(i)));

    var rotB = math.asin(
        math.cos(b0) * math.sin(b) - math.sin(b0) * math.cos(b) * math.cos(i));

    return Point.withZ(
      y: r / 2 * math.log((1 + math.sin(rotB)) / (1 - math.sin(rotB))) + y0,
      x: r * rotI + x0,
      z: p.z,
    );
  }

  Point _inverse(Point p) {
    var y = p.x - x0;
    var x = p.y - y0;

    var rotI = y / r;
    var rotB = 2 * (math.atan(math.exp(x / r)) - math.pi / 4);

    var b = math.asin(math.cos(b0) * math.sin(rotB) +
        math.sin(b0) * math.cos(rotB) * math.cos(rotI));
    var i = math.atan(math.sin(rotI) /
        (math.cos(b0) * math.cos(rotI) - math.sin(b0) * math.tan(rotB)));

    var lambda = lambda0 + i / alpha;

    var s = 0.0;
    var phy = b;
    var prevPhy = -1000.0;
    var iteration = 0;
    while (abs(phy - prevPhy) > 0.0000001) {
      if (++iteration > 20) {
        // ...reportError("omercFwdInfinity");
        return p;
      }
      // S = math.log(math.tan(math.PI / 4 + phy / 2));
      s = 1 / alpha * (math.log(math.tan(math.pi / 4 + b / 2)) - k) +
          e *
              math.log(
                  math.tan(math.pi / 4 + math.asin(e * math.sin(phy)) / 2));
      prevPhy = phy;
      phy = 2 * math.atan(math.exp(s)) - math.pi / 2;
    }

    return Point.withZ(
      x: lambda,
      y: phy,
      z: p.z,
    );
  }
}
