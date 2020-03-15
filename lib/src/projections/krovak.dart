import 'dart:math' as math;

import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/common/utils.dart' as utils;

class KrovakProjection extends Projection {
  static final List<String> names = ['Krovak', 'krovak'];

  double lat0;
  double long0;
  double s45;
  double s90;
  double fi0;
  double e2;
  double alfa;
  double uq;
  double u0;
  double g;
  double k1;
  double k;
  double n0;
  double s0;
  double n;
  double ro0;
  double ad;
  bool czech;

  KrovakProjection.init(ProjParams params)
      : lat0 = params.lat0,
        long0 = params.long0,
        czech = params.map['czech'],
        super.init(params) {
    a = 6377397.155;
    es = 0.006674372230614;
    e = math.sqrt(es);
    lat0 ??= 0.863937979737193;
    if (long0 == null || long0.isNaN) {
      long0 = 0.7417649320975901 - 0.308341501185665;
    }
    // if scale not set default to 0.9999
    k0 ??= 0.9999;
    s45 = 0.785398163397448; // 45
    s90 = 2 * s45;
    fi0 = lat0;
    e2 = es;
    e = math.sqrt(e2);
    alfa = math.sqrt(1 + (e2 * math.pow(math.cos(fi0), 4)) / (1 - e2));
    uq = 1.04216856380474;
    u0 = math.asin(math.sin(fi0) / alfa);
    g = math.pow(
        (1 + e * math.sin(fi0)) / (1 - e * math.sin(fi0)), alfa * e / 2);
    k = math.tan(u0 / 2 + s45) / math.pow(math.tan(fi0 / 2 + s45), alfa) * g;
    k1 = k0;
    n0 = a * math.sqrt(1 - e2) / (1 - e2 * math.pow(math.sin(fi0), 2));
    s0 = 1.37008346281555;
    n = math.sin(s0);
    ro0 = k1 * n0 / math.tan(s0);
    ad = s90 - uq;
  }

  @override
  Point forward(Point p) {
    double gfi, u, deltav, s, d, eps, ro;
    var lon = p.x;
    var lat = p.y;
    var delta_lon = utils.adjust_lon(lon - long0);
    gfi = math.pow(
        ((1 + e * math.sin(lat)) / (1 - e * math.sin(lat))), (alfa * e / 2));
    u = 2 *
        (math.atan(k * math.pow(math.tan(lat / 2 + s45), alfa) / gfi) - s45);
    deltav = -delta_lon * alfa;
    s = math.asin(math.cos(ad) * math.sin(u) +
        math.sin(ad) * math.cos(u) * math.cos(deltav));
    d = math.asin(math.cos(u) * math.sin(deltav) / math.cos(s));
    eps = n * d;
    ro = ro0 *
        math.pow(math.tan(s0 / 2 + s45), n) /
        math.pow(math.tan(s / 2 + s45), n);
    p.y = ro * math.cos(eps) / 1;
    p.x = ro * math.sin(eps) / 1;

    if (czech == null || !czech) {
      p.y *= -1;
      p.x *= -1;
    }
    return (p);
  }

  @override
  Point inverse(Point p) {
    double u, deltav, s, d, eps, ro, fi1;
    var ok;
    // revert y, x
    var tmp = p.x;
    p.x = p.y;
    p.y = tmp;
    if (czech == null || !czech) {
      p.y *= -1;
      p.x *= -1;
    }
    ro = math.sqrt(p.x * p.x + p.y * p.y);
    eps = math.atan2(p.y, p.x);
    d = eps / math.sin(s0);
    s = 2 *
        (math.atan(math.pow(ro0 / ro, 1 / n) * math.tan(s0 / 2 + s45)) - s45);
    u = math.asin(
        math.cos(ad) * math.sin(s) - math.sin(ad) * math.cos(s) * math.cos(d));
    deltav = math.asin(math.cos(s) * math.sin(d) / math.cos(u));
    p.x = long0 - deltav / alfa;
    fi1 = u;
    ok = 0;
    var iter = 0;
    do {
      p.y = 2 *
          (math.atan(math.pow(k, -1 / alfa) *
                  math.pow(math.tan(u / 2 + s45), 1 / alfa) *
                  math.pow((1 + e * math.sin(fi1)) / (1 - e * math.sin(fi1)),
                      e / 2)) -
              s45);
      if ((fi1 - p.y).abs() < 0.0000000001) {
        ok = 1;
      }
      fi1 = p.y;
      iter += 1;
    } while (ok == 0 && iter < 15);
    if (iter >= 15) {
      return null;
    }

    return (p);
  }
}
