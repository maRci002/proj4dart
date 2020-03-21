import 'dart:convert';
import 'dart:math' as math;

import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/constants/values.dart' as consts;

double acosh(double x) {
  return 2 * math.log(math.sqrt((x + 1) / 2) + math.sqrt((x - 1) / 2));
}

double adjust_lat(double x) {
  return (x.abs() < consts.HALF_PI) ? x : (x - (sign(x) * math.pi));
}

double adjust_lon(double x) {
  return (x.abs() <= consts.SPI) ? x : (x - (sign(x) * consts.TWO_PI));
}

int adjust_zone(int zone, double lon) {
  if (zone == null) {
    zone = ((adjust_lon(lon) + math.pi) * 30 / math.pi).floor() + 1;
    if (zone < 0) {
      return 0;
    } else if (zone > 60) {
      return 60;
    }
  }
  return zone;
}

double asinh(double x) {
  var s = (x >= 0 ? 1 : -1);
  return s * (math.log(x.abs() + math.sqrt(x * x + 1)));
}

double asinhy(double x) {
  var y = x.abs();
  y = log1py(y * (1 + y / (hypot(1, y) + 1)));
  return x < 0 ? -y : y;
}

double asinz(double x) {
  if (x.abs() > 1) {
    x = (x > 1) ? 1 : -1;
  }
  return math.asin(x);
}

double atanh(double x) {
  return math.log((x - 1) / (x + 1)) / 2;
}

List<double> clens_cmplx(List<double> pp, double arg_r, double arg_i) {
  var sin_arg_r = math.sin(arg_r);
  var cos_arg_r = math.cos(arg_r);
  var sinh_arg_i = sinh(arg_i);
  var cosh_arg_i = cosh(arg_i);
  var r = 2 * cos_arg_r * cosh_arg_i;
  var i = -2 * sin_arg_r * sinh_arg_i;
  var j = pp.length - 1;
  var hr = pp[j];
  var hi1 = 0.0;
  var hr1 = 0.0;
  var hi = 0.0;
  var hr2;
  var hi2;
  while (--j >= 0) {
    hr2 = hr1;
    hi2 = hi1;
    hr1 = hr;
    hi1 = hi;
    hr = -hr2 + r * hr1 - i * hi1 + pp[j];
    hi = -hi2 + i * hr1 + r * hi1;
  }
  r = sin_arg_r * cosh_arg_i;
  i = cos_arg_r * sinh_arg_i;
  return [r * hr - i * hi, r * hi + i * hr];
}

double clens(List<double> pp, double arg_r) {
  var r = 2 * math.cos(arg_r);
  var i = pp.length - 1;
  var hr1 = pp[i];
  var hr2 = 0.0;
  var hr;
  while (--i >= 0) {
    hr = -hr2 + r * hr1 + pp[i];
    hr2 = hr1;
    hr1 = hr;
  }
  return math.sin(arg_r) * hr;
}

double cosh(double x) {
  var r = math.exp(x);
  r = (r + 1 / r) / 2;
  return r;
}

double e0fn(double x) {
  return (1 - 0.25 * x * (1 + x / 16 * (3 + 1.25 * x)));
}

double e1fn(double x) {
  return (0.375 * x * (1 + 0.25 * x * (1 + 0.46875 * x)));
}

double e2fn(double x) {
  return (0.05859375 * x * x * (1 + 0.75 * x));
}

double e3fn(double x) {
  return (x * x * x * (35 / 3072));
}

double fL(double x, double L) {
  return 2 * math.atan(x * math.exp(L)) - consts.HALF_PI;
}

double gatg(List<double> pp, double B) {
  var cos_2B = 2 * math.cos(2 * B);
  var i = pp.length - 1;
  var h1 = pp[i];
  var h2 = 0.0;
  var h;
  while (--i >= 0) {
    h = -h2 + cos_2B * h1 + pp[i];
    h2 = h1;
    h1 = h;
  }
  return (B + h * math.sin(2 * B));
}

double gN(double a, double e, double sinphi) {
  var temp = e * sinphi;
  return a / math.sqrt(1 - temp * temp);
}

double hypot(double x, double y) {
  x = x.abs();
  y = y.abs();
  var a = math.max(x, y);
  var b = math.min(x, y) / (a ?? 1);
  return a * math.sqrt(1 + math.pow(b, 2));
}

double imlfn(double ml, double e0, double e1, double e2, double e3) {
  double phi;
  double dphi;
  phi = ml / e0;
  for (var i = 0; i < 15; i++) {
    dphi = (ml -
            (e0 * phi -
                e1 * math.sin(2 * phi) +
                e2 * math.sin(4 * phi) -
                e3 * math.sin(6 * phi))) /
        (e0 -
            2 * e1 * math.cos(2 * phi) +
            4 * e2 * math.cos(4 * phi) -
            6 * e3 * math.cos(6 * phi));
    phi += dphi;
    if (dphi.abs() <= 0.0000000001) {
      return phi;
    }
  }
  //..reportError("IMLFN-CONV:Latitude failed to converge after 15 iterations");
  return double.nan;
}

Point inverseNadCvt(Point t, Point val, tb, ct) {
  if ((t.x).isNaN) {
    return val;
  }
  t.x = tb.x + t.x;
  t.y = tb.y - t.y;
  var i = 9, tol = 1e-12;
  Point dif;
  Point del;
  do {
    del = nad_intr(t, ct);
    if ((del.x).isNaN) {
      break;
    }
    dif = Point(x: t.x - del.x - tb.x, y: t.y + del.y - tb.y);
    t.x -= dif.x;
    t.y -= dif.y;
  } while (i-- != 0 && (dif.x).abs() > tol && (dif.y).abs() > tol);
  if (i < 0) {
    return val;
  }
  val.x = adjust_lon(t.x + ct.ll[0]);
  val.y = t.y + ct.ll[1];
  return val;
}

double invlatiso(double eccent, double ts) {
  var phi = fL(1, ts);
  var Iphi = 0.0;
  var con = 0.0;
  do {
    Iphi = phi;
    con = eccent * math.sin(Iphi);
    phi = fL(math.exp(eccent * math.log((1 + con) / (1 - con)) / 2), ts);
  } while ((phi - Iphi).abs() > 1.0e-12);
  return phi;
}

double iqsfnz(double eccent, double q) {
  var temp = 1 -
      (1 - eccent * eccent) /
          (2 * eccent) *
          math.log((1 - eccent) / (1 + eccent));
  if ((q.abs() - temp).abs() < 1.0E-6) {
    if (q < 0) {
      return (-1 * consts.HALF_PI);
    } else {
      return consts.HALF_PI;
    }
  }
  //var phi = 0.5* q/(1-eccent*eccent);
  var phi = math.asin(0.5 * q);
  double dphi;
  double sin_phi;
  double cos_phi;
  double con;
  for (var i = 0; i < 30; i++) {
    sin_phi = math.sin(phi);
    cos_phi = math.cos(phi);
    con = eccent * sin_phi;
    dphi = math.pow(1 - con * con, 2) /
        (2 * cos_phi) *
        (q / (1 - eccent * eccent) -
            sin_phi / (1 - con * con) +
            0.5 / eccent * math.log((1 - con) / (1 + con)));
    phi += dphi;
    if (dphi.abs() <= 0.0000000001) {
      return phi;
    }
  }
  //console.log("IQSFN-CONV:Latitude failed to converge after 30 iterations");
  return double.nan;
}

double latiso(double eccent, double phi, double sinphi) {
  if (phi.abs() > consts.HALF_PI) {
    return double.nan;
  }
  if (phi == consts.HALF_PI) {
    return double.infinity;
  }
  if (phi == -1 * consts.HALF_PI) {
    return double.negativeInfinity;
  }
  var con = eccent * sinphi;
  return math.log(math.tan((consts.HALF_PI + phi) / 2)) +
      eccent * math.log((1 - con) / (1 + con)) / 2;
}

double log1py(double x) {
  var y = 1 + x;
  var z = y - 1;
  return z == 0 ? x : x * math.log(y) / z;
}

double mlfn(double e0, double e1, double e2, double e3, double phi) {
  return (e0 * phi -
      e1 * math.sin(2 * phi) +
      e2 * math.sin(4 * phi) -
      e3 * math.sin(6 * phi));
}

double msfnz(double eccent, double sinphi, double cosphi) {
  var con = eccent * sinphi;
  return cosphi / (math.sqrt(1 - con * con));
}

Point nad_cvt(Point pin, bool inverse, ct) {
  var val = Point(x: double.nan, y: double.nan);
  if (pin.x.isNaN) {
    return val;
  }
  var tb = Point(x: pin.x, y: pin.y);
  tb.x -= ct.ll[0];
  tb.y -= ct.ll[1];
  tb.x = adjust_lon(tb.x - math.pi) + math.pi;
  var t = nad_intr(tb, ct);
  if (inverse) {
    return inverseNadCvt(t, val, tb, ct);
  } else {
    if (!t.x.isNaN) {
      val.x = pin.x - t.x;
      val.y = pin.y + t.y;
    }
  }
  return val;
}

Point nad_intr(pin, ct) {
  // force computation by decreasing by 1e-7 to be as closed as possible
  // from computation under C:C++ by leveraging rounding problems ...
  var t = Point(x: (pin.x - 1e-7) / ct.del[0], y: (pin.y - 1e-7) / ct.del[1]);
  var indx = Point(x: (t.x).floorToDouble(), y: (t.y).floorToDouble());
  var frct = Point(x: t.x - 1 * indx.x, y: t.y - 1 * indx.y);
  var val = Point(x: double.nan, y: double.nan);
  var temp = nadInterBreakout(indx, frct, 'x', 0, ct);
  if (temp) {
    indx = temp[0];
    frct = temp[1];
  } else {
    return val;
  }
  temp = nadInterBreakout(indx, frct, 'y', 1, ct);
  if (temp != false) {
    indx = temp[0];
    frct = temp[1];
  } else {
    return val;
  }
  var inx = (indx.y * ct.lim[0]) + indx.x;
  var f00 = Point(x: ct.cvs[inx][0], y: ct.cvs[inx][1]);
  inx++;
  var f10 = Point(x: ct.cvs[inx][0], y: ct.cvs[inx][1]);
  inx += ct.lim[0];
  var f11 = Point(x: ct.cvs[inx][0], y: ct.cvs[inx][1]);
  inx--;
  var f01 = Point(x: ct.cvs[inx][0], y: ct.cvs[inx][1]);
  var m11 = frct.x * frct.y,
      m10 = frct.x * (1 - frct.y),
      m00 = (1 - frct.x) * (1 - frct.y),
      m01 = (1 - frct.x) * frct.y;
  val.x = (m00 * f00.x + m10 * f10.x + m01 * f01.x + m11 * f11.x);
  val.y = (m00 * f00.y + m10 * f10.y + m01 * f01.y + m11 * f11.y);
  return val;
}

dynamic nadInterBreakout(indx, frct, String letter, int number, ct) {
  var inx;
  if (indx[letter] < 0) {
    if (!(indx[letter] == -1 && frct[letter] > 0.99999999999)) {
      return false;
    }
    indx[letter]++;
    frct[letter] = 0;
  } else {
    inx = indx[letter] + 1;
    if (inx >= ct.lim[number]) {
      if (!(inx == ct.lim[number] && frct[letter] < 1e-11)) {
        return false;
      }
      if (letter == 'x') {
        indx[letter]--;
      } else {
        indx[letter]++;
      }
      frct[letter] = 1;
    }
  }
  return [indx, frct];
}

double phi2z(double eccent, double ts) {
  var eccnth = 0.5 * eccent;
  double con, dphi;
  var phi = consts.HALF_PI - 2 * math.atan(ts);
  for (var i = 0; i <= 15; i++) {
    con = eccent * math.sin(phi);
    dphi = consts.HALF_PI -
        2 * math.atan(ts * (math.pow(((1 - con) / (1 + con)), eccnth))) -
        phi;
    phi += dphi;
    if (dphi.abs() <= 0.0000000001) {
      return phi;
    }
  }
  //console.log("phi2z has NoConvergence");
  return -9999.0;
}

List<double> pj_enfn(double es) {
  var C00 = 1.0;
  var C02 = 0.25;
  var C04 = 0.046875;
  var C06 = 0.01953125;
  var C08 = 0.01068115234375;
  var C22 = 0.75;
  var C44 = 0.46875;
  var C46 = 0.01302083333333333333;
  var C48 = 0.00712076822916666666;
  var C66 = 0.36458333333333333333;
  var C68 = 0.00569661458333333333;
  var C88 = 0.3076171875;
  var en = List<double>(5);
  en[0] = C00 - es * (C02 + es * (C04 + es * (C06 + es * C08)));
  en[1] = es * (C22 - es * (C04 + es * (C06 + es * C08)));
  var t = es * es;
  en[2] = t * (C44 - es * (C46 + es * C48));
  t *= es;
  en[3] = t * (C66 - es * C68);
  en[4] = t * es * C88;
  return en;
}

double pj_inv_mlfn(double arg, double es, List<double> en) {
  var MAX_ITER = 20;
  var k = 1 / (1 - es);
  var phi = arg;
  for (var i = 0; i < MAX_ITER; i++) {
    // rarely goes over 2 iterations
    var s = math.sin(phi);
    var t = 1 - es * s * s;
    //t = this.pj_mlfn(phi, s, Math.cos(phi), en) - arg;
    //phi -= t * (t * Math.sqrt(t)) * k;
    t = (pj_mlfn(phi, s, math.cos(phi), en) - arg) * (t * math.sqrt(t)) * k;
    phi -= t;
    if (t.abs() < consts.EPSLN) {
      return phi;
    }
  }
  //..reportError("cass:pj_inv_mlfn: Convergence error");
  return phi;
}

double pj_mlfn(double phi, double sphi, double cphi, List<double> en) {
  cphi *= sphi;
  sphi *= sphi;
  return (en[0] * phi -
      cphi * (en[1] + sphi * (en[2] + sphi * (en[3] + sphi * en[4]))));
}

double qsfnz(double eccent, double sinphi) {
  double con;
  if (eccent > 1.0e-7) {
    con = eccent * sinphi;
    return ((1 - eccent * eccent) *
        (sinphi / (1 - con * con) -
            (0.5 / eccent) * math.log((1 - con) / (1 + con))));
  } else {
    return (2 * sinphi);
  }
}

double sign(double x) {
  return x < 0 ? -1.0 : 1.0;
}

double sinh(double x) {
  var r = math.exp(x);
  r = (r - 1 / r) / 2;
  return r;
}

double srat(double esinp, double exp) {
  return (math.pow((1 - esinp) / (1 + esinp), exp));
}

double tanh(double x) {
  var r = math.exp(x);
  r = (r - 1 / r) / (r + 1 / r);
  return r;
}

Point toPoint(List<double> array) {
  var out = Point(x: array[0], y: array[1]);
  if (array.length > 2) {
    out.z = array[2];
  }
  if (array.length > 3) {
    out.m = array[3];
  }
  return out;
}

double tsfnz(double eccent, double phi, double sinphi) {
  var con = eccent * sinphi;
  var com = 0.5 * eccent;
  con = math.pow(((1 - con) / (1 + con)), com);
  return (math.tan(0.5 * (consts.HALF_PI - phi)) / con);
}

void checkCoord(double coord) {
  if (coord != null && coord.isFinite) {
    return;
  }
  throw Exception('coordinates must be finite numbers');
}

void checkSanity(Point point) {
  checkCoord(point.x);
  checkCoord(point.y);
}

Point adjust_axis(Projection crs, bool denorm, Point point) {
  var xin = point.x, yin = point.y, zin = point.z ?? 0.0;
  var v, t, i;
  var pointString = '''
      {
        "x": ${point.x}, 
        "y": ${point.y}, 
        "z": ${point.z}
      }
    ''';
  var pointObj = jsonDecode(pointString);
  var outString = '''
      {
        "x": null, 
        "y": null, 
        "z": null
      }
    ''';
  var out = jsonDecode(outString);
  for (i = 0; i < 3; i++) {
    if (denorm && i == 2 && point.z == null) {
      continue;
    }
    if (i == 0) {
      v = xin;
      if ('ew'.contains(crs.axis[i])) {
        t = 'x';
      } else {
        t = 'y';
      }
    } else if (i == 1) {
      v = yin;
      if ('ns'.contains(crs.axis[i])) {
        t = 'y';
      } else {
        t = 'x';
      }
    } else {
      v = zin;
      t = 'z';
    }
    switch (crs.axis[i]) {
      case 'e':
      case 'w':
      case 'n':
      case 's':
        out[t] = v;
        break;
      case 'u':
        if (pointObj[t] != null) {
          out['z'] = v;
        }
        break;
      case 'd':
        if (pointObj[t] != null) {
          out['z'] = -v;
        }
        break;
      default:
        //console.log("ERROR: unknow axis ("+crs.axis[i]+") - check definition of "+crs.projName);
        return null;
    }
  }
  return Point.withZ(x: out['x'], y: out['y'], z: out['z']);
}
