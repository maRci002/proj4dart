import 'dart:math' as math;

import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/common/utils.dart' as utils;
import 'package:proj4dart/src/constants/values.dart' as consts;

var MAX_ITER = 20;

class PolyconicProjection extends Projection {
  static final List<String> names = ['Polyconic', 'poly'];

  double lat0;
  double long0;
  double x0;
  double y0;
  double temp, e0, e1, e2, e3, ml0;

  PolyconicProjection.init(ProjParams params)
      : lat0 = params.lat0,
        long0 = params.long0,
        x0 = params.x0,
        y0 = params.y0,
        super.init(params) {
    // Place parameters in static storage for common use
    temp = b / a;
    es = 1 - math.pow(temp, 2);
    e = math.sqrt(es);
    e0 = utils.e0fn(es);
    e1 = utils.e1fn(es);
    e2 = utils.e2fn(es);
    e3 = utils.e3fn(es);
    ml0 = a * utils.mlfn(e0, e1, e2, e3, lat0);
  }

  @override
  Point forward(Point p) {
    var lon = p.x;
    var lat = p.y;
    double x, y, el;
    var dlon = utils.adjust_lon(lon - long0);
    el = dlon * math.sin(lat);
    if (sphere != null && sphere) {
      if (lat.abs() <= consts.EPSLN) {
        x = a * dlon;
        y = -1 * a * lat0;
      } else {
        x = a * math.sin(el) / math.tan(lat);
        y = a *
            (utils.adjust_lat(lat - lat0) + (1 - math.cos(el)) / math.tan(lat));
      }
    } else {
      if (lat.abs() <= consts.EPSLN) {
        x = a * dlon;
        y = -1 * ml0;
      } else {
        var nl = utils.gN(a, e, math.sin(lat)) / math.tan(lat);
        x = nl * math.sin(el);
        y = a * utils.mlfn(e0, e1, e2, e3, lat) - ml0 + nl * (1 - math.cos(el));
      }
    }
    p.x = x + x0;
    p.y = y + y0;
    return p;
  }

  @override
  Point inverse(Point p) {
    double lon, lat, x, y;
    double al, bl;
    double phi, dphi;
    lat = double.nan; // fix js behavior

    x = p.x - x0;
    y = p.y - y0;

    if (sphere != null && sphere) {
      if ((y + a * lat0).abs() <= consts.EPSLN) {
        lon = utils.adjust_lon(x / a + long0);
        lat = 0;
      } else {
        al = lat0 + y / a;
        bl = x * x / a / a + al * al;
        phi = al;
        var tanphi;
        for (var i = MAX_ITER; i > 0; --i) {
          tanphi = math.tan(phi);
          dphi = -1 *
              (al * (phi * tanphi + 1) -
                  phi -
                  0.5 * (phi * phi + bl) * tanphi) /
              ((phi - al) / tanphi - 1);
          phi += dphi;
          if (dphi.abs() <= consts.EPSLN) {
            lat = phi;
            break;
          }
        }
        lon = utils.adjust_lon(
            long0 + (math.asin(x * math.tan(phi) / a)) / math.sin(lat));
      }
    } else {
      if ((y + ml0).abs() <= consts.EPSLN) {
        lat = 0;
        lon = utils.adjust_lon(long0 + x / a);
      } else {
        al = (ml0 + y) / a;
        bl = x * x / a / a + al * al;
        phi = al;
        var cl, mln, mlnp, ma;
        var con;
        for (var i = MAX_ITER; i > 0; --i) {
          con = e * math.sin(phi);
          cl = math.sqrt(1 - con * con) * math.tan(phi);
          mln = a * utils.mlfn(e0, e1, e2, e3, phi);
          mlnp = e0 -
              2 * e1 * math.cos(2 * phi) +
              4 * e2 * math.cos(4 * phi) -
              6 * e3 * math.cos(6 * phi);
          ma = mln / a;
          dphi = (al * (cl * ma + 1) - ma - 0.5 * cl * (ma * ma + bl)) /
              (es *
                      math.sin(2 * phi) *
                      (ma * ma + bl - 2 * al * ma) /
                      (4 * cl) +
                  (al - ma) * (cl * mlnp - 2 / math.sin(2 * phi)) -
                  mlnp);
          phi -= dphi;
          if (dphi.abs() <= consts.EPSLN) {
            lat = phi;
            break;
          }
        }

        // lat=phi4z(e,e0,e1,e2,e3,al,bl,0,0);
        cl = math.sqrt(1 - es * math.pow(math.sin(lat), 2)) * math.tan(lat);
        lon = utils.adjust_lon(long0 + math.asin(x * cl / a) / math.sin(lat));
      }
    }

    p.x = lon;
    p.y = lat;
    return p;
  }
}
