import 'dart:math' as math;

import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/common/utils.dart' as utils;
import 'package:proj4dart/src/constants/values.dart' as consts;

var P00 = 0.33333333333333333333;
var P01 = 0.17222222222222222222;
var P02 = 0.10257936507936507936;
var P10 = 0.06388888888888888888;
var P11 = 0.06640211640211640211;
var P20 = 0.01641501294219154443;

class LambertAzimuthalEqualAreaProjection extends Projection {
  static final List<String> names = [
    'Lambert Azimuthal Equal Area',
    'Lambert_Azimuthal_Equal_Area',
    'laea'
  ];

  static const S_POLE = 1;
  static const N_POLE = 2;
  static const EQUIT = 3;
  static const OBLIQ = 4;

  double lat0;
  double long0;
  double x0;
  double y0;
  double phi0;
  int mode;
  List<double> apa;
  double qp, mmf, dd, rq, xmf, ymf, sinb1, cosb1, sinph0, cosph0;

  LambertAzimuthalEqualAreaProjection.init(ProjParams params)
      : lat0 = params.lat0,
        long0 = params.long0,
        x0 = params.x0,
        y0 = params.y0,
        phi0 = params.map['phi0'],
        super.init(params) {
    var t = lat0.abs();
    if ((t - consts.HALF_PI).abs() < consts.EPSLN) {
      mode = lat0 < 0 ? S_POLE : N_POLE;
    } else if (t.abs() < consts.EPSLN) {
      mode = EQUIT;
    } else {
      mode = OBLIQ;
    }
    if (es > 0) {
      var sinphi;
      qp = utils.qsfnz(e, 1);
      mmf = 0.5 / (1 - es);
      apa = _authset(es);
      switch (mode) {
        case N_POLE:
          dd = 1;
          break;
        case S_POLE:
          dd = 1;
          break;
        case EQUIT:
          rq = math.sqrt(0.5 * qp);
          dd = 1 / rq;
          xmf = 1;
          ymf = 0.5 * qp;
          break;
        case OBLIQ:
          rq = math.sqrt(0.5 * qp);
          sinphi = math.sin(lat0);
          sinb1 = utils.qsfnz(e, sinphi) / qp;
          cosb1 = math.sqrt(1 - sinb1 * sinb1);
          dd = math.cos(lat0) /
              (math.sqrt(1 - es * sinphi * sinphi) * rq * cosb1);
          ymf = (xmf = rq) / dd;
          xmf *= dd;
          break;
      }
    } else {
      if (mode == OBLIQ) {
        sinph0 = math.sin(lat0);
        cosph0 = math.cos(lat0);
      }
    }
  }

  @override
  Point forward(Point p) {
    double x, y, coslam, sinlam, sinphi, q, sinb, cosb, b, cosphi;
    var lam = p.x;
    var phi = p.y;

    lam = utils.adjust_lon(lam - long0);
    if (sphere != null && sphere) {
      sinphi = math.sin(phi);
      cosphi = math.cos(phi);
      coslam = math.cos(lam);
      if (mode == OBLIQ || mode == EQUIT) {
        y = (mode == EQUIT)
            ? 1 + cosphi * coslam
            : 1 + sinph0 * sinphi + cosph0 * cosphi * coslam;
        if (y <= consts.EPSLN) {
          return null;
        }
        y = math.sqrt(2 / y);
        x = y * cosphi * math.sin(lam);
        y *= (mode == EQUIT)
            ? sinphi
            : cosph0 * sinphi - sinph0 * cosphi * coslam;
      } else if (mode == N_POLE || mode == S_POLE) {
        if (mode == N_POLE) {
          coslam = -coslam;
        }

        if (phi0 != null && (phi + phi0).abs() < consts.EPSLN) {
          return null;
        }
        y = consts.FORTPI - phi * 0.5;
        y = 2 * ((mode == S_POLE) ? math.cos(y) : math.sin(y));
        x = y * math.sin(lam);
        y *= coslam;
      }
    } else {
      sinb = 0;
      cosb = 0;
      b = 0;
      coslam = math.cos(lam);
      sinlam = math.sin(lam);
      sinphi = math.sin(phi);
      q = utils.qsfnz(e, sinphi);
      if (mode == OBLIQ || mode == EQUIT) {
        sinb = q / qp;
        cosb = math.sqrt(1 - sinb * sinb);
      }
      switch (mode) {
        case OBLIQ:
          b = 1 + sinb1 * sinb + cosb1 * cosb * coslam;
          break;
        case EQUIT:
          b = 1 + cosb * coslam;
          break;
        case N_POLE:
          b = consts.HALF_PI + phi;
          q = qp - q;
          break;
        case S_POLE:
          b = phi - consts.HALF_PI;
          q = qp + q;
          break;
      }
      if (b.abs() < consts.EPSLN) {
        return null;
      }
      switch (mode) {
        case OBLIQ:
        case EQUIT:
          b = math.sqrt(2 / b);
          if (mode == OBLIQ) {
            y = ymf * b * (cosb1 * sinb - sinb1 * cosb * coslam);
          } else {
            y = (b = math.sqrt(2 / (1 + cosb * coslam))) * sinb * ymf;
          }
          x = xmf * b * cosb * sinlam;
          break;
        case N_POLE:
        case S_POLE:
          if (q >= 0) {
            x = (b = math.sqrt(q)) * sinlam;
            y = coslam * ((mode == S_POLE) ? b : -b);
          } else {
            x = y = 0;
          }
          break;
      }
    }

    p.x = a * x + x0;
    p.y = a * y + y0;
    return p;
  }

  @override
  Point inverse(Point p) {
    p.x -= x0;
    p.y -= y0;
    var x = p.x / a;
    var y = p.y / a;
    double lam, phi, cCe, sCe, q, rho, ab;
    if (sphere != null && sphere) {
      double cosz = 0.0, rh, sinz = 0.0;

      rh = math.sqrt(x * x + y * y);
      phi = rh * 0.5;
      if (phi > 1) {
        return null;
      }
      phi = 2 * math.asin(phi);
      if (mode == OBLIQ || mode == EQUIT) {
        sinz = math.sin(phi);
        cosz = math.cos(phi);
      }
      switch (mode) {
        case EQUIT:
          phi = (rh.abs() <= consts.EPSLN) ? 0 : math.asin(y * sinz / rh);
          x *= sinz;
          y = cosz * rh;
          break;
        case OBLIQ:
          phi = (rh.abs() <= consts.EPSLN)
              ? phi0
              : math.asin(cosz * sinph0 + y * sinz * cosph0 / rh);
          x *= sinz * cosph0;
          y = (cosz - math.sin(phi) * sinph0) * rh;
          break;
        case N_POLE:
          y = -y;
          phi = consts.HALF_PI - phi;
          break;
        case S_POLE:
          phi -= consts.HALF_PI;
          break;
      }
      lam = (y == 0 && (mode == EQUIT || mode == OBLIQ)) ? 0 : math.atan2(x, y);
    } else {
      ab = 0;
      if (mode == OBLIQ || mode == EQUIT) {
        x /= dd;
        y *= dd;
        rho = math.sqrt(x * x + y * y);
        if (rho < consts.EPSLN) {
          p.x = 0.0;
          p.y = phi0;
          return p;
        }
        sCe = 2 * math.asin(0.5 * rho / rq);
        cCe = math.cos(sCe);
        x *= (sCe = math.sin(sCe));
        if (mode == OBLIQ) {
          ab = cCe * sinb1 + y * sCe * cosb1 / rho;
          q = qp * ab;
          y = rho * cosb1 * cCe - y * sinb1 * sCe;
        } else {
          ab = y * sCe / rho;
          q = qp * ab;
          y = rho * cCe;
        }
      } else if (mode == N_POLE || mode == S_POLE) {
        if (mode == N_POLE) {
          y = -y;
        }
        q = (x * x + y * y);
        if (q == null) {
          p.x = 0.0;
          p.y = phi0;
          return p;
        }
        ab = 1 - q / qp;
        if (mode == S_POLE) {
          ab = -ab;
        }
      }
      lam = math.atan2(x, y);
      phi = _authlat(math.asin(ab), apa);
    }

    p.x = utils.adjust_lon(long0 + lam);
    p.y = phi;
    return p;
  }

  List<double> _authset(double es) {
    double t;
    var APA = List<double>(3);
    APA[0] = es * P00;
    t = es * es;
    APA[0] += t * P01;
    APA[1] = t * P10;
    t *= es;
    APA[0] += t * P02;
    APA[1] += t * P11;
    APA[2] = t * P20;
    return APA;
  }

  double _authlat(double beta, List<double> APA) {
    var t = beta + beta;
    return (beta +
        APA[0] * math.sin(t) +
        APA[1] * math.sin(t + t) +
        APA[2] * math.sin(t + t + t));
  }
}
