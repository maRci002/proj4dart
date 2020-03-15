import 'dart:math' as math;

import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/constants/areas.dart' as areas;
import 'package:proj4dart/src/constants/faces.dart' as faces;
import 'package:proj4dart/src/constants/values.dart' as consts;

class QuadrilateralizedSphericalCubeProjection extends Projection {
  static final List<String> names = [
    'Quadrilateralized Spherical Cube',
    'Quadrilateralized_Spherical_Cube',
    'qsc'
  ];

  double lat0;
  double long0;
  double x0;
  double y0;
  double lat_ts;
  String title;
  int face;

  double one_minus_f, one_minus_f_squared;

  QuadrilateralizedSphericalCubeProjection.init(ProjParams params)
      : lat0 = params.lat0 ?? 0.0,
        long0 = params.long0 == null || params.long0.isNaN ? 0.0 : params.long0,
        x0 = params.x0 ?? 0.0,
        y0 = params.y0 ?? 0.0,
        lat_ts = params.lat_ts ?? 0.0,
        title = params.title ?? 'Quadrilateralized Spherical Cube',
        super.init(params) {
    // Determine the cube face from the center of projection.
    if (lat0 >= consts.HALF_PI - consts.FORTPI / 2.0) {
      face = faces.TOP;
    } else if (lat0 <= -(consts.HALF_PI - consts.FORTPI / 2.0)) {
      face = faces.BOTTOM;
    } else if (long0.abs() <= consts.FORTPI) {
      face = faces.FRONT;
    } else if (long0.abs() <= consts.HALF_PI + consts.FORTPI) {
      face = long0 > 0.0 ? faces.RIGHT : faces.LEFT;
    } else {
      face = faces.BACK;
    }

    // Fill in useful values for the ellipsoid <-> sphere shift
    // described in [LK12].
    if (es != 0) {
      one_minus_f = 1 - (a - b) / a;
      one_minus_f_squared = one_minus_f * one_minus_f;
    }
  }

  @override
  Point forward(Point p) {
    var xy = Point(x: 0, y: 0);
    double lat, lon;
    double theta, phi;
    double t, mu;
    // nu;
    var area = {'value': 0};

    // move lon according to projection's lon
    p.x -= long0;

    // Convert the geodetic latitude to a geocentric latitude.
    // This corresponds to the shift from the ellipsoid to the sphere
    // described in [LK12].
    if (es != 0) {
      // if (P->es != 0) {
      lat = math.atan(one_minus_f_squared * math.tan(p.y));
    } else {
      lat = p.y;
    }

    // Convert the input lat, lon into theta, phi as used by QSC.
    // This depends on the cube face and the area on it.
    //For the top and bottom face, we can compute theta and phi
    // directly from phi, lam. For the other faces, we must use
    // unit sphere cartesian coordinates as an intermediate step.
    lon = p.x; //lon = lp['lam'];
    if (face == faces.TOP) {
      phi = consts.HALF_PI - lat;
      if (lon >= consts.FORTPI && lon <= consts.HALF_PI + consts.FORTPI) {
        area['value'] = areas.AREA_0;
        theta = lon - consts.HALF_PI;
      } else if (lon > consts.HALF_PI + consts.FORTPI ||
          lon <= -(consts.HALF_PI + consts.FORTPI)) {
        area['value'] = areas.AREA_1;
        theta = (lon > 0.0 ? lon - consts.SPI : lon + consts.SPI);
      } else if (lon > -(consts.HALF_PI + consts.FORTPI) &&
          lon <= -consts.FORTPI) {
        area['value'] = areas.AREA_2;
        theta = lon + consts.HALF_PI;
      } else {
        area['value'] = areas.AREA_3;
        theta = lon;
      }
    } else if (face == faces.BOTTOM) {
      phi = consts.HALF_PI + lat;
      if (lon >= consts.FORTPI && lon <= consts.HALF_PI + consts.FORTPI) {
        area['value'] = areas.AREA_0;
        theta = -lon + consts.HALF_PI;
      } else if (lon < consts.FORTPI && lon >= -consts.FORTPI) {
        area['value'] = areas.AREA_1;
        theta = -lon;
      } else if (lon < -consts.FORTPI &&
          lon >= -(consts.HALF_PI + consts.FORTPI)) {
        area['value'] = areas.AREA_2;
        theta = -lon - consts.HALF_PI;
      } else {
        area['value'] = areas.AREA_3;
        theta = (lon > 0.0 ? -lon + consts.SPI : -lon - consts.SPI);
      }
    } else {
      double q, r, s;
      double sinlat, coslat;
      double sinlon, coslon;

      if (face == faces.RIGHT) {
        lon = _qsc_shift_lon_origin(lon, consts.HALF_PI);
      } else if (face == faces.BACK) {
        lon = _qsc_shift_lon_origin(lon, consts.SPI);
      } else if (face == faces.LEFT) {
        lon = _qsc_shift_lon_origin(lon, -consts.HALF_PI);
      }
      sinlat = math.sin(lat);
      coslat = math.cos(lat);
      sinlon = math.sin(lon);
      coslon = math.cos(lon);
      q = coslat * coslon;
      r = coslat * sinlon;
      s = sinlat;

      if (face == faces.FRONT) {
        phi = math.acos(q);
        theta = _qsc_fwd_equat_face_theta(phi, s, r, area);
      } else if (face == faces.RIGHT) {
        phi = math.acos(r);
        theta = _qsc_fwd_equat_face_theta(phi, s, -q, area);
      } else if (face == faces.BACK) {
        phi = math.acos(-q);
        theta = _qsc_fwd_equat_face_theta(phi, s, -r, area);
      } else if (face == faces.LEFT) {
        phi = math.acos(-r);
        theta = _qsc_fwd_equat_face_theta(phi, s, q, area);
      } else {
        // Impossible
        phi = theta = 0;
        area['value'] = areas.AREA_0;
      }
    }

    // Compute mu and nu for the area of definition.
    // For mu, see Eq. (3-21) in [OL76], but note the typos:
    // compare with Eq. (3-14). For nu, see Eq. (3-38).
    mu = math.atan((12 / consts.SPI) *
        (theta +
            math.acos(math.sin(theta) * math.cos(consts.FORTPI)) -
            consts.HALF_PI));
    t = math.sqrt((1 - math.cos(phi)) /
        (math.cos(mu) * math.cos(mu)) /
        (1 - math.cos(math.atan(1 / math.cos(theta)))));

    // Apply the result to the real area.
    if (area['value'] == areas.AREA_1) {
      mu += consts.HALF_PI;
    } else if (area['value'] == areas.AREA_2) {
      mu += consts.SPI;
    } else if (area['value'] == areas.AREA_3) {
      mu += 1.5 * consts.SPI;
    }

    // Now compute x, y from mu and nu
    xy.x = t * math.cos(mu);
    xy.y = t * math.sin(mu);
    xy.x = xy.x * a + x0;
    xy.y = xy.y * a + y0;

    p.x = xy.x;
    p.y = xy.y;
    return p;
  }

  @override
  Point inverse(Point p) {
    var lp = {'lam': 0.0, 'phi': 0.0};
    double mu, nu, cosmu, tannu;
    double tantheta, theta, cosphi, phi;
    double t;
    var area = {'value': 0};

    // de-offset
    p.x = (p.x - x0) / a;
    p.y = (p.y - y0) / a;

    // Convert the input x, y to the mu and nu angles as used by QSC.
    // This depends on the area of the cube face.
    nu = math.atan(math.sqrt(p.x * p.x + p.y * p.y));
    mu = math.atan2(p.y, p.x);
    if (p.x >= 0.0 && p.x >= p.y.abs()) {
      area['value'] = areas.AREA_0;
    } else if (p.y >= 0.0 && p.y >= p.x.abs()) {
      area['value'] = areas.AREA_1;
      mu -= consts.HALF_PI;
    } else if (p.x < 0.0 && -p.x >= p.y.abs()) {
      area['value'] = areas.AREA_2;
      mu = (mu < 0.0 ? mu + consts.SPI : mu - consts.SPI);
    } else {
      area['value'] = areas.AREA_3;
      mu += consts.HALF_PI;
    }

    // Compute phi and theta for the area of definition.
    // The inverse projection is not described in the original paper, but some
    // good hints can be found here (as of 2011-12-14):
    // http://fits.gsfc.nasa.gov/fitsbits/saf.93/saf.9302
    // (search for "Message-Id: <9302181759.AA25477 at fits.cv.nrao.edu>")
    t = (consts.SPI / 12) * math.tan(mu);
    tantheta = math.sin(t) / (math.cos(t) - (1 / math.sqrt(2)));
    theta = math.atan(tantheta);
    cosmu = math.cos(mu);
    tannu = math.tan(nu);
    cosphi = 1 -
        cosmu *
            cosmu *
            tannu *
            tannu *
            (1 - math.cos(math.atan(1 / math.cos(theta))));
    if (cosphi < -1) {
      cosphi = -1;
    } else if (cosphi > 1) {
      cosphi = 1;
    }

    // Apply the result to the real area on the cube face.
    // For the top and bottom face, we can compute phi and lam directly.
    // For the other faces, we must use unit sphere cartesian coordinates
    // as an intermediate step.
    if (face == faces.TOP) {
      phi = math.acos(cosphi);
      lp['phi'] = consts.HALF_PI - phi;
      if (area['value'] == areas.AREA_0) {
        lp['lam'] = theta + consts.HALF_PI;
      } else if (area['value'] == areas.AREA_1) {
        lp['lam'] = (theta < 0.0 ? theta + consts.SPI : theta - consts.SPI);
      } else if (area['value'] == areas.AREA_2) {
        lp['lam'] = theta - consts.HALF_PI;
      } else {
        lp['lam'] = theta;
      }
    } else if (face == faces.BOTTOM) {
      phi = math.acos(cosphi);
      lp['phi'] = phi - consts.HALF_PI;
      if (area['value'] == areas.AREA_0) {
        lp['lam'] = -theta + consts.HALF_PI;
      } else if (area['value'] == areas.AREA_1) {
        lp['lam'] = -theta;
      } else if (area['value'] == areas.AREA_2) {
        lp['lam'] = -theta - consts.HALF_PI;
      } else {
        lp['lam'] = (theta < 0.0 ? -theta - consts.SPI : -theta + consts.SPI);
      }
    } else {
      // Compute phi and lam via cartesian unit sphere coordinates.
      double q, r, s;
      q = cosphi;
      t = q * q;
      if (t >= 1) {
        s = 0;
      } else {
        s = math.sqrt(1 - t) * math.sin(theta);
      }
      t += s * s;
      if (t >= 1) {
        r = 0;
      } else {
        r = math.sqrt(1 - t);
      }
      // Rotate q,r,s into the correct area.
      if (area['value'] == areas.AREA_1) {
        t = r;
        r = -s;
        s = t;
      } else if (area['value'] == areas.AREA_2) {
        r = -r;
        s = -s;
      } else if (area['value'] == areas.AREA_3) {
        t = r;
        r = s;
        s = -t;
      }
      // Rotate q,r,s into the correct cube face.
      if (face == faces.RIGHT) {
        t = q;
        q = -r;
        r = t;
      } else if (face == faces.BACK) {
        q = -q;
        r = -r;
      } else if (face == faces.LEFT) {
        t = q;
        q = r;
        r = -t;
      }
      // Now compute phi and lam from the unit sphere coordinates.
      lp['phi'] = math.acos(-s) - consts.HALF_PI;
      lp['lam'] = math.atan2(r, q);
      if (face == faces.RIGHT) {
        lp['lam'] = _qsc_shift_lon_origin(lp['lam'], -consts.HALF_PI);
      } else if (face == faces.BACK) {
        lp['lam'] = _qsc_shift_lon_origin(lp['lam'], -consts.SPI);
      } else if (face == faces.LEFT) {
        lp['lam'] = _qsc_shift_lon_origin(lp['lam'], consts.HALF_PI);
      }
    }

    // Apply the shift from the sphere to the ellipsoid as described
    // in [LK12].
    if (es != 0) {
      int invert_sign;
      double tanphi, xa;
      invert_sign = lp['phi'] < 0 ? 1 : 0;
      tanphi = math.tan(lp['phi']);
      xa = b / math.sqrt(tanphi * tanphi + one_minus_f_squared);
      lp['phi'] = math.atan(math.sqrt(a * a - xa * xa) / (one_minus_f * xa));
      if (invert_sign != 0) {
        lp['phi'] = -lp['phi'];
      }
    }

    lp['lam'] += long0;
    p.x = lp['lam'];
    p.y = lp['phi'];
    return p;
  }

  double _qsc_fwd_equat_face_theta(
      double phi, double y, double x, Map<String, int> area) {
    double theta;
    if (phi < consts.EPSLN) {
      area['value'] = areas.AREA_0;
      theta = 0.0;
    } else {
      theta = math.atan2(y, x);
      if (theta.abs() <= consts.FORTPI) {
        area['value'] = areas.AREA_0;
      } else if (theta > consts.FORTPI &&
          theta <= consts.HALF_PI + consts.FORTPI) {
        area['value'] = areas.AREA_1;
        theta -= consts.HALF_PI;
      } else if (theta > consts.HALF_PI + consts.FORTPI ||
          theta <= -(consts.HALF_PI + consts.FORTPI)) {
        area['value'] = areas.AREA_2;
        theta = (theta >= 0.0 ? theta - consts.SPI : theta + consts.SPI);
      } else {
        area['value'] = areas.AREA_3;
        theta += consts.HALF_PI;
      }
    }
    return theta;
  }

  double _qsc_shift_lon_origin(double lon, double offset) {
    var slon = lon + offset;
    if (slon < -consts.SPI) {
      slon += consts.TWO_PI;
    } else if (slon > consts.SPI) {
      slon -= consts.TWO_PI;
    }
    return slon;
  }
}
