import 'dart:math' as math;

import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';

/// references:
/// Formules et constantes pour le Calcul pour la
/// projection cylindrique conforme à axe oblique et pour la transformation entre
/// des systèmes de référence.
/// http://www.swisstopo.admin.ch/internet/swisstopo/fr/home/topics/survey/sys/refsys/switzerland.parsysrelated1.31216.downloadList.77004.DownloadFile.tmp/swissprojectionfr.pdf
class SwissObliqueMercatorProjection extends Projection {
  static final List<String> names = ['somerc'];

  double x0;
  double y0;
  double lambda0;
  double R;
  double alpha;
  double b0;
  double K;

  SwissObliqueMercatorProjection.init(ProjParams params) : super.init(params) {
    var lat0 = params.lat0;
    var long0 = params.long0;
    x0 = params.x0;
    y0 = params.y0;

    var phy0 = lat0;
    lambda0 = long0;
    var sinPhy0 = math.sin(phy0);
    var semiMajorAxis = a;
    var invF = rf;
    var flattening = 1 / invF;
    var e2 = 2 * flattening - math.pow(flattening, 2);
    e = math.sqrt(e2);
    R = k0 *
        semiMajorAxis *
        math.sqrt(1 - e2) /
        (1 - e2 * math.pow(sinPhy0, 2));
    alpha = math.sqrt(1 + e2 / (1 - e2) * math.pow(math.cos(phy0), 4));
    b0 = math.asin(sinPhy0 / alpha);
    var k1 = math.log(math.tan(math.pi / 4 + b0 / 2));
    var k2 = math.log(math.tan(math.pi / 4 + phy0 / 2));
    var k3 = math.log((1 + e * sinPhy0) / (1 - e * sinPhy0));
    K = k1 - alpha * k2 + alpha * e / 2 * k3;
  }

  @override
  Point forward(Point p) {
    var Sa1 = math.log(math.tan(math.pi / 4 - p.y / 2));
    var Sa2 =
        e / 2 * math.log((1 + e * math.sin(p.y)) / (1 - e * math.sin(p.y)));
    var S = -alpha * (Sa1 + Sa2) + K;

    // spheric latitude
    var b = 2 * (math.atan(math.exp(S)) - math.pi / 4);

    // spheric longitude
    var I = alpha * (p.x - lambda0);

    // psoeudo equatorial rotation
    var rotI = math.atan(math.sin(I) /
        (math.sin(b0) * math.tan(b) + math.cos(b0) * math.cos(I)));

    var rotB = math.asin(
        math.cos(b0) * math.sin(b) - math.sin(b0) * math.cos(b) * math.cos(I));

    p.y = R / 2 * math.log((1 + math.sin(rotB)) / (1 - math.sin(rotB))) + y0;
    p.x = R * rotI + x0;
    return p;
  }

  @override
  Point inverse(Point p) {
    var Y = p.x - x0;
    var X = p.y - y0;

    var rotI = Y / R;
    var rotB = 2 * (math.atan(math.exp(X / R)) - math.pi / 4);

    var b = math.asin(math.cos(b0) * math.sin(rotB) +
        math.sin(b0) * math.cos(rotB) * math.cos(rotI));
    var I = math.atan(math.sin(rotI) /
        (math.cos(b0) * math.cos(rotI) - math.sin(b0) * math.tan(rotB)));

    var lambda = lambda0 + I / alpha;

    var S = 0.0;
    var phy = b;
    var prevPhy = -1000.0;
    var iteration = 0;
    while ((phy - prevPhy).abs() > 0.0000001) {
      if (++iteration > 20) {
        //...reportError("omercFwdInfinity");
        return p;
      }
      //S = math.log(math.tan(math.pi / 4 + phy / 2));
      S = 1 / alpha * (math.log(math.tan(math.pi / 4 + b / 2)) - K) +
          e *
              math.log(
                  math.tan(math.pi / 4 + math.asin(e * math.sin(phy)) / 2));
      prevPhy = phy;
      phy = 2 * math.atan(math.exp(S)) - math.pi / 2;
    }

    p.x = lambda;
    p.y = phy;
    return p;
  }
}
