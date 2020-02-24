import 'dart:math' as math;

import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/common/utils.dart' as utils;
import 'package:proj4dart/src/projections/gauss.dart';

class StereographicNorthProjection extends GaussProjection {
  static final List<String> names = [
    'Stereographic_North_Pole',
    'Oblique_Stereographic',
    'Polar_Stereographic',
    'sterea',
    'Oblique Stereographic Alternative',
    'Double_Stereographic'
  ];

  double sinc0;
  double cosc0;
  double R2;

  StereographicNorthProjection.init(ProjParams params) : super.init(params) {
    if (rc == null) {
      return;
    }
    sinc0 = math.sin(phic0);
    cosc0 = math.cos(phic0);
    R2 = 2 * rc;
  }

  @override
  Point forward(Point p) {
    double sinc, cosc, cosl, k;
    p.x = utils.adjust_lon(p.x - long0);
    super.forward(p);
    sinc = math.sin(p.y);
    cosc = math.cos(p.y);
    cosl = math.cos(p.x);
    k = k0 * R2 / (1 + sinc0 * sinc + cosc0 * cosc * cosl);
    p.x = k * cosc * math.sin(p.x);
    p.y = k * (cosc0 * sinc - sinc0 * cosc * cosl);
    p.x = a * p.x + x0;
    p.y = a * p.y + y0;
    return p;
  }

  @override
  Point inverse(Point p) {
    double sinc, cosc, lon, lat, rho;
    p.x = (p.x - x0) / a;
    p.y = (p.y - y0) / a;

    p.x /= k0;
    p.y /= k0;
    if (!(rho = math.sqrt(p.x * p.x + p.y * p.y)).isNaN) {
      var c = 2 * math.atan2(rho, R2);
      sinc = math.sin(c);
      cosc = math.cos(c);
      lat = math.asin(cosc * sinc0 + p.y * sinc * cosc0 / rho);
      lon = math.atan2(p.x * sinc, rho * cosc0 * cosc - p.y * sinc0 * sinc);
    } else {
      lat = phic0;
      lon = 0;
    }

    p.x = lon;
    p.y = lat;
    super.inverse(p);
    p.x = utils.adjust_lon(p.x + long0);
    return p;
  }
}
