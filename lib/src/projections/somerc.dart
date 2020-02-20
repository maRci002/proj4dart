import 'dart:math' as math;

import 'package:proj4dart/src/point.dart';
import 'package:proj4dart/src/projection.dart';

/// references:
/// Formules et constantes pour le Calcul pour la
/// projection cylindrique conforme à axe oblique et pour la transformation entre
/// des systèmes de référence.
/// http://www.swisstopo.admin.ch/internet/swisstopo/fr/home/topics/survey/sys/refsys/switzerland.parsysrelated1.31216.downloadList.77004.DownloadFile.tmp/swissprojectionfr.pdf
class SwissObliqueMercatorProjection extends Projection {
  @override
  final List<String> names = ['somerc'];

  double lat0;
  double long0;
  double x0;
  double y0;
  bool noDefs;
  double lambda0;
  double r;
  double alpha;
  double b0;
  double k;

  SwissObliqueMercatorProjection.init(Map<String, dynamic> map)
      : super.init(map) {
    lat0 = map['lat0'];
    long0 = map['long0'];
    x0 = map['x0'];
    y0 = map['y0'];
    noDefs = map['no_defs'];
    r = map['R'];

    var phy0 = lat0;
    lambda0 = long0;
    var sinPhy0 = math.sin(phy0);
    var semiMajorAxis = a;
    var invF = map['rf'];
    var flattening = 1 / invF;
    var e2 = 2 * flattening - math.pow(flattening, 2);
    e = math.sqrt(e2);
    r = k0 *
        semiMajorAxis *
        math.sqrt(1 - e2) /
        (1 - e2 * math.pow(sinPhy0, 2));
    alpha = math.sqrt(1 + e2 / (1 - e2) * math.pow(math.cos(phy0), 4));
    b0 = math.asin(sinPhy0 / alpha);
    var k1 = math.log(math.tan(math.pi / 4 + b0 / 2));
    var k2 = math.log(math.tan(math.pi / 4 + phy0 / 2));
    var k3 = math.log((1 + e * sinPhy0) / (1 - e * sinPhy0));
    k = k1 - alpha * k2 + alpha * e / 2 * k3;
  }

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
