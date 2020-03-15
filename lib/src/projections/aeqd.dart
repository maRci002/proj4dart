import 'dart:math' as math;

import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/constants/values.dart' as consts;
import 'package:proj4dart/src/common/utils.dart' as utils;

class AzimuthalEquidistantProjection extends Projection {
  static final List<String> names = [
    'Azimuthal_Equidistant',
    'aeqd',
  ];

  double sin_p12;
  double cos_p12;
  double lat0;
  double long0;
  double x0;
  double y0;

  AzimuthalEquidistantProjection.init(ProjParams params) : super.init(params) {
    lat0 = params.lat0;
    long0 = params.long0;
    x0 = params.x0;
    y0 = params.y0;

    sin_p12 = math.sin(lat0);
    cos_p12 = math.cos(lat0);
  }

  @override
  Point forward(Point p) {
    var lon = p.x;
    var lat = p.y;
    var sinphi = math.sin(p.y);
    var cosphi = math.cos(p.y);
    var dlon = utils.adjust_lon(lon - long0);
    var e0,
        e1,
        e2,
        e3,
        Mlp,
        Ml,
        tanphi,
        Nl1,
        Nl,
        psi,
        Az,
        G,
        H,
        GH,
        Hs,
        c,
        kp,
        cos_c,
        s,
        s2,
        s3,
        s4,
        s5;
    if (sphere != null && sphere) {
      if ((sin_p12 - 1).abs() <= consts.EPSLN) {
        //North Pole case
        p.x = x0 + a * (consts.HALF_PI - lat) * math.sin(dlon);
        p.y = y0 - a * (consts.HALF_PI - lat) * math.cos(dlon);
        return p;
      } else if ((sin_p12 + 1).abs() <= consts.EPSLN) {
        //South Pole case
        p.x = x0 + a * (consts.HALF_PI + lat) * math.sin(dlon);
        p.y = y0 + a * (consts.HALF_PI + lat) * math.cos(dlon);
        return p;
      } else {
        //default case
        cos_c = sin_p12 * sinphi + cos_p12 * cosphi * math.cos(dlon);
        c = math.acos(cos_c);
        kp = c / math.sin(c);
        p.x = x0 + a * kp * cosphi * math.sin(dlon);
        p.y = y0 +
            a * kp * (cos_p12 * sinphi - sin_p12 * cosphi * math.cos(dlon));
        return p;
      }
    } else {
      e0 = utils.e0fn(es);
      e1 = utils.e1fn(es);
      e2 = utils.e2fn(es);
      e3 = utils.e3fn(es);
      if ((sin_p12 - 1).abs() <= consts.EPSLN) {
        //North Pole case
        Mlp = a * utils.mlfn(e0, e1, e2, e3, consts.HALF_PI);
        Ml = a * utils.mlfn(e0, e1, e2, e3, lat);
        p.x = x0 + (Mlp - Ml) * math.sin(dlon);
        p.y = y0 - (Mlp - Ml) * math.cos(dlon);
        return p;
      } else if ((sin_p12 + 1).abs() <= consts.EPSLN) {
        //South Pole case
        Mlp = a * utils.mlfn(e0, e1, e2, e3, consts.HALF_PI);
        Ml = a * utils.mlfn(e0, e1, e2, e3, lat);
        p.x = x0 + (Mlp + Ml) * math.sin(dlon);
        p.y = y0 + (Mlp + Ml) * math.cos(dlon);
        return p;
      } else {
        //Default case
        tanphi = sinphi / cosphi;
        Nl1 = utils.gN(a, e, sin_p12);
        Nl = utils.gN(a, e, sinphi);
        psi = math.atan((1 - es) * tanphi + es * Nl1 * sin_p12 / (Nl * cosphi));
        Az = math.atan2(
            math.sin(dlon), cos_p12 * math.tan(psi) - sin_p12 * math.cos(dlon));
        if (Az == 0) {
          s = math.asin(cos_p12 * math.sin(psi) - sin_p12 * math.cos(psi));
        } else if ((Az.abs() - math.pi).abs() <= consts.EPSLN) {
          s = -math.asin(cos_p12 * math.sin(psi) - sin_p12 * math.cos(psi));
        } else {
          s = math.asin(math.sin(dlon) * math.cos(psi) / math.sin(Az));
        }
        G = e * sin_p12 / math.sqrt(1 - es);
        H = e * cos_p12 * math.cos(Az) / math.sqrt(1 - es);
        GH = G * H;
        Hs = H * H;
        s2 = s * s;
        s3 = s2 * s;
        s4 = s3 * s;
        s5 = s4 * s;
        c = Nl1 *
            s *
            (1 -
                s2 * Hs * (1 - Hs) / 6 +
                s3 / 8 * GH * (1 - 2 * Hs) +
                s4 / 120 * (Hs * (4 - 7 * Hs) - 3 * G * G * (1 - 7 * Hs)) -
                s5 / 48 * GH);
        p.x = x0 + c * math.sin(Az);
        p.y = y0 + c * math.cos(Az);
        return p;
      }
    }
  }

  @override
  Point inverse(Point p) {
    p.x -= x0;
    p.y -= y0;
    var rh,
        z,
        sinz,
        cosz,
        lon,
        lat,
        con,
        e0,
        e1,
        e2,
        e3,
        Mlp,
        M,
        N1,
        psi,
        Az,
        cosAz,
        tmp,
        A,
        B,
        D,
        Ee,
        F;
    if (sphere != null && sphere) {
      rh = math.sqrt(p.x * p.x + p.y * p.y);
      if (rh > (2 * consts.HALF_PI * a)) {
        //...reportError("aeqdInvDataError");
        return p;
      }
      z = rh / a;

      sinz = math.sin(z);
      cosz = math.cos(z);

      lon = long0;
      if (rh.abs() <= consts.EPSLN) {
        lat = lat0;
      } else {
        lat = utils.asinz(cosz * sin_p12 + (p.y * sinz * cos_p12) / rh);
        con = lat0.abs() - consts.HALF_PI;
        if (con.abs() <= consts.EPSLN) {
          if (lat0 >= 0) {
            lon = utils.adjust_lon(long0 + math.atan2(p.x, -p.y));
          } else {
            lon = utils.adjust_lon(long0 - math.atan2(-p.x, p.y));
          }
        } else {
          //   con = cosz - sin_p12 * math.sin(lat);
          // if ((math.abs(con) < consts.EPSLN) && (math.abs(p.x) < consts.EPSLN)) {
          //   //no-op, just keep the lon value as is
          // } else {
          //   var temp = math.atan2((p.x * sinz * cos_p12), (con * rh));
          //   lon = adjust_lon(long0 + math.atan2((p.x * sinz * cos_p12), (con * rh)));
          // }
          lon = utils.adjust_lon(long0 +
              math.atan2(
                  p.x * sinz, rh * cos_p12 * cosz - p.y * sin_p12 * sinz));
        }
      }

      p.x = lon;
      p.y = lat;
      return p;
    } else {
      e0 = utils.e0fn(es);
      e1 = utils.e1fn(es);
      e2 = utils.e2fn(es);
      e3 = utils.e3fn(es);
      if ((sin_p12 - 1).abs() <= consts.EPSLN) {
        //North pole case
        Mlp = a * utils.mlfn(e0, e1, e2, e3, consts.HALF_PI);
        rh = math.sqrt(p.x * p.x + p.y * p.y);
        M = Mlp - rh;
        lat = utils.imlfn(M / a, e0, e1, e2, e3);
        lon = utils.adjust_lon(long0 + math.atan2(p.x, -1 * p.y));
        p.x = lon;
        p.y = lat;
        return p;
      } else if ((sin_p12 + 1).abs() <= consts.EPSLN) {
        //South pole case
        Mlp = a * utils.mlfn(e0, e1, e2, e3, consts.HALF_PI);
        rh = math.sqrt(p.x * p.x + p.y * p.y);
        M = rh - Mlp;

        lat = utils.imlfn(M / a, e0, e1, e2, e3);
        lon = utils.adjust_lon(long0 + math.atan2(p.x, p.y));
        p.x = lon;
        p.y = lat;
        return p;
      } else {
        //default case
        rh = math.sqrt(p.x * p.x + p.y * p.y);
        Az = math.atan2(p.x, p.y);
        N1 = utils.gN(a, e, sin_p12);
        cosAz = math.cos(Az);
        tmp = e * cos_p12 * cosAz;
        A = -tmp * tmp / (1 - es);
        B = 3 * es * (1 - A) * sin_p12 * cos_p12 * cosAz / (1 - es);
        D = rh / N1;
        Ee = D -
            A * (1 + A) * math.pow(D, 3) / 6 -
            B * (1 + 3 * A) * math.pow(D, 4) / 24;
        F = 1 - A * Ee * Ee / 2 - D * Ee * Ee * Ee / 6;
        psi =
            math.asin(sin_p12 * math.cos(Ee) + cos_p12 * math.sin(Ee) * cosAz);
        lon = utils.adjust_lon(
            long0 + math.asin(math.sin(Az) * math.sin(Ee) / math.cos(psi)));
        lat = math.atan(
            (1 - es * F * sin_p12 / math.sin(psi)) * math.tan(psi) / (1 - es));
        p.x = lon;
        p.y = lat;
        return p;
      }
    }
  }
}
