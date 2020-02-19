import 'package:proj4dart/src/projection.dart';
import 'dart:math' as math;

import 'package:proj4dart/src/point.dart';

/// references:
/// Formules et constantes pour le Calcul pour la
/// projection cylindrique conforme à axe oblique et pour la transformation entre
/// des systèmes de référence.
/// http://www.swisstopo.admin.ch/internet/swisstopo/fr/home/topics/survey/sys/refsys/switzerland.parsysrelated1.31216.downloadList.77004.DownloadFile.tmp/swissprojectionfr.pdf
class SwissObliqueMercatorProjection extends Projection {
  @override
  final List<String> names = ['somerc'];

  final double lat0;
  final double long0;
  final int x0;
  final int y0;
  final bool noDefs;
  final double lambda0;
  final double r;
  final double alpha;
  final double b0;
  final double k;

  SwissObliqueMercatorProjection.init(Map<String, dynamic> map)
      : lat0 = map['lat0'],
        long0 = map['long0'],
        x0 = map['x0'],
        y0 = map['y0'],
        noDefs = map['no_defs'],
        lambda0 = map['lambda0'],
        r = map['R'],
        alpha = map['alpha'],
        b0 = map['b0'],
        k = map['K'],
        super.init(map);

  @override
  Point forward(Point p) {
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

  @override
  Point inverse(Point p) {
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
    while ((phy - prevPhy).abs() > 0.0000001) {
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
