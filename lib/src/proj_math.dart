import 'dart:math' as math;

class ProjectionMath {
  static final double PI = math.pi;
  static final double HALFPI = math.pi / 2.0;
  static final double QUARTERPI = math.pi / 4.0;
  static final double FORTPI = QUARTERPI;
  static final double TWOPI = math.pi * 2.0;
  static final double RTD = 180.0 / math.pi;
  static final double DTR = math.pi / 180.0;

  static final double EPS10 = 1.0e-10;

  static double sind(double v) {
    return math.sin(v * DTR);
  }

  static double cosd(double v) {
    return math.cos(v * DTR);
  }

  static double tand(double v) {
    return math.tan(v * DTR);
  }

  static double asind(double v) {
    return math.asin(v) * RTD;
  }

  static double acosd(double v) {
    return math.acos(v) * RTD;
  }

  static double atand(double v) {
    return math.atan(v) * RTD;
  }

  static double atan2d(double y, double x) {
    return math.atan2(y, x) * RTD;
  }

  static double asin(double v) {
    if (v.abs() > 1.0) {
      return v < 0.0 ? -math.pi / 2 : math.pi / 2;
    }
    return math.asin(v);
  }

  static double acos(double v) {
    if (v.abs() > 1.0) {
      return v < 0.0 ? math.pi : 0.0;
    }
    return math.acos(v);
  }

  static double sqrt(double v) {
    return v < 0.0 ? 0.0 : math.sqrt(v);
  }

  static double distance(double dx, double dy) {
    return math.sqrt(dx * dx + dy * dy);
  }

  static double hypot(double x, double y) {
    if (x < 0.0) {
      x = -x;
    } else if (x == 0.0) {
      return y < 0.0 ? -y : y;
    }
    if (y < 0.0) {
      y = -y;
    } else if (y == 0.0) {
      return x;
    }
    if (x < y) {
      x /= y;
      return y * math.sqrt(1.0 + x * x);
    } else {
      y /= x;
      return x * math.sqrt(1.0 + y * y);
    }
  }

  static double atan2(double y, double x) {
    return math.atan2(y, x);
  }

  static double trunc(double v) {
    return v < 0.0 ? v.ceil() as double : v.floor() as double;
  }

  static double frac(double v) {
    return v - trunc(v);
  }

  static double degToRad(double v) {
    return v * math.pi / 180.0;
  }

  static double radToDeg(double v) {
    return v * 180.0 / math.pi;
  }

  // For negative angles, d should be negative, m & s positive.
  static double dmsToRad(double d, double m, double s) {
    if (d >= 0) {
      return (d + m / 60 + s / 3600) * math.pi / 180.0;
    }
    return (d - m / 60 - s / 3600) * math.pi / 180.0;
  }

  // For negative angles, d should be negative, m & s positive.
  static double dmsToDeg(double d, double m, double s) {
    if (d >= 0) {
      return (d + m / 60 + s / 3600);
    }
    return (d - m / 60 - s / 3600);
  }

  static double normalizeLatitude(double angle) {
    if (angle.isInfinite || angle.isNaN) {
      throw Exception('Infinite latitude');
    }
    while (angle > ProjectionMath.HALFPI) {
      angle -= math.pi;
    }
    while (angle < -ProjectionMath.HALFPI) {
      angle += math.pi;
    }
    return angle;
  }

  static double normalizeLongitude(double angle) {
    if (angle.isInfinite || angle.isNaN) {
      throw Exception('Infinite longitude');
    }
    while (angle > math.pi) {
      angle -= TWOPI;
    }
    while (angle < -math.pi) {
      angle += TWOPI;
    }
    return angle;
  }

  static double normalizeAngle(double angle) {
    if (angle.isInfinite || angle.isNaN) {
      throw Exception('Infinite angle');
    }
    while (angle > TWOPI) {
      angle -= TWOPI;
    }
    while (angle < 0) {
      angle += TWOPI;
    }
    return angle;
  }

  static double greatCircleDistance(
      double lon1, double lat1, double lon2, double lat2) {
    var dlat = math.sin((lat2 - lat1) / 2);
    var dlon = math.sin((lon2 - lon1) / 2);
    var r =
        math.sqrt(dlat * dlat + math.cos(lat1) * math.cos(lat2) * dlon * dlon);
    return 2.0 * math.asin(r);
  }

  static double sphericalAzimuth(
      double lat0, double lon0, double lat, double lon) {
    var diff = lon - lon0;
    var coslat = math.cos(lat);

    return math.atan2(
        coslat * math.sin(diff),
        (math.cos(lat0) * math.sin(lat) -
            math.sin(lat0) * coslat * math.cos(diff)));
  }

  static bool sameSigns(double a, double b) {
    return a < 0 == b < 0;
  }

  //  static bool sameSigns(int a, int b) {
  // 	return a < 0 == b < 0;
  // }

  static double takeSign(double a, double b) {
    a = a.abs();
    if (b < 0) {
      return -a;
    }
    return a;
  }

  //  static int takeSign(int a, int b) {
  // 	a = a.abs();
  // 	if (b < 0) {
  // 		return -a;
  //   }
  // 	return a;
  // }

  static double cross(double x1, double y1, double x2, double y2) {
    return x1 * y2 - x2 * y1;
  }

  static double longitudeDistance(double l1, double l2) {
    return math.min(
        (l1 - l2).abs(),
        ((l1 < 0) ? l1 + math.pi : math.pi - l1) +
            ((l2 < 0) ? l2 + math.pi : math.pi - l2));
  }

  static double geocentricLatitude(double lat, double flatness) {
    var f = 1.0 - flatness;
    return math.atan((f * f) * math.tan(lat));
  }

  static double geographicLatitude(double lat, double flatness) {
    var f = 1.0 - flatness;
    return math.atan(math.tan(lat) / (f * f));
  }

  static double tsfn(double phi, double sinphi, double e) {
    sinphi *= e;
    return (math.tan(0.5 * (ProjectionMath.HALFPI - phi)) /
        math.pow((1.0 - sinphi) / (1.0 + sinphi), 0.5 * e));
  }

  static double msfn(double sinphi, double cosphi, double es) {
    return cosphi / math.sqrt(1.0 - es * sinphi * sinphi);
  }

  static final int N_ITER = 15;

  static double phi2(double ts, double e) {
    double eccnth, phi, con, dphi;
    int i;
    eccnth = 0.5 * e;
    phi = ProjectionMath.HALFPI - 2.0 * math.atan(ts);
    i = N_ITER;
    do {
      con = e * math.sin(phi);
      dphi = ProjectionMath.HALFPI -
          2.0 * math.atan(ts * math.pow((1.0 - con) / (1.0 + con), eccnth)) -
          phi;
      phi += dphi;
    } while (dphi.abs() > 1e-10 && --i != 0);
    if (i <= 0) {
      throw Exception(
          'Computation of phi2 failed to converage after $N_ITER iterations');
    }
    return phi;
  }

  static final double C00 = 1.0;
  static final double C02 = .25;
  static final double C04 = .046875;
  static final double C06 = .01953125;
  static final double C08 = .01068115234375;
  static final double C22 = .75;
  static final double C44 = .46875;
  static final double C46 = .01302083333333333333;
  static final double C48 = .00712076822916666666;
  static final double C66 = .36458333333333333333;
  static final double C68 = .00569661458333333333;
  static final double C88 = .3076171875;
  static final int MAX_ITER = 10;

  static List<double> enfn(double es) {
    double t;
    var en = [] as List<double>;
    en[0] = C00 - es * (C02 + es * (C04 + es * (C06 + es * C08)));
    en[1] = es * (C22 - es * (C04 + es * (C06 + es * C08)));
    en[2] = (t = es * es) * (C44 - es * (C46 + es * C48));
    en[3] = (t *= es) * (C66 - es * C68);
    en[4] = t * es * C88;
    return en;
  }

  static double mlfn(double phi, double sphi, double cphi, List<double> en) {
    cphi *= sphi;
    sphi *= sphi;
    return en[0] * phi -
        cphi * (en[1] + sphi * (en[2] + sphi * (en[3] + sphi * en[4])));
  }

  static double inv_mlfn(double arg, double es, List<double> en) {
    double s, t, phi, k = 1.0 / (1.0 - es);

    phi = arg;
    for (var i = MAX_ITER; i != 0; i--) {
      s = math.sin(phi);
      t = 1.0 - es * s * s;
      phi -=
          t = (mlfn(phi, s, math.cos(phi), en) - arg) * (t * math.sqrt(t)) * k;
      if (t.abs() < 1e-11) {
        return phi;
      }
    }
    return phi;
  }

  static final double P00 = .33333333333333333333;
  static final double P01 = .17222222222222222222;
  static final double P02 = .10257936507936507936;
  static final double P10 = .06388888888888888888;
  static final double P11 = .06640211640211640211;
  static final double P20 = .01641501294219154443;

  static List<double> authset(double es) {
    double t;
    var APA = [] as List<double>;
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

  static double authlat(double beta, List<double> APA) {
    var t = beta + beta;
    return (beta +
        APA[0] * math.sin(t) +
        APA[1] * math.sin(t + t) +
        APA[2] * math.sin(t + t + t));
  }

  static double qsfn(double sinphi, double e, double one_es) {
    double con;
    if (e >= 1.0e-7) {
      con = e * sinphi;
      return (one_es *
          (sinphi / (1.0 - con * con) -
              (0.5 / e) * math.log((1.0 - con) / (1.0 + con))));
    } else {
      return (sinphi + sinphi);
    }
  }

  static double niceNumber(double x, bool round) {
    int expv; /* exponent of x */
    double f; /* fractional part of x */
    double nf; /* nice, rounded fraction */

    expv = (math.log(x) / math.log(10)).floor();
    f = x / math.pow(10.0, expv); /* between 1 and 10 */
    if (round) {
      if (f < 1.5) {
        nf = 1.0;
      } else if (f < 3.0) {
        nf = 2.0;
      } else if (f < 7.0) {
        nf = 5.0;
      } else {
        nf = 10.0;
      }
    } else if (f <= 1.0) {
      nf = 1.0;
    } else if (f <= 2.0) {
      nf = 2.0;
    } else if (f <= 5.0) {
      nf = 5.0;
    } else {
      nf = 10.0;
    }
    return nf * math.pow(10.0, expv);
  }

  // SECONDS_TO_RAD = Pi/180/3600
  static final double SECONDS_TO_RAD = 4.84813681109535993589914102357e-6;
  static final double MILLION = 1000000.0;
}
