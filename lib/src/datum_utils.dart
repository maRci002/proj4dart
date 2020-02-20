import 'dart:math' as math;

import 'package:proj4dart/src/constants/values.dart' as consts;
import 'package:proj4dart/src/datum2.dart';
import 'package:proj4dart/src/point.dart';

bool compareDatums(Datum source, Datum dest) {
  if (source.datum_type != dest.datum_type) {
    return false; // false, datums are not equal
  } else if (source.a != dest.a ||
      (source.es - dest.es).abs() > 0.000000000050) {
    // the tolerance for es is to ensure that GRS80 and WGS84
    // are considered identical
    return false;
  } else if (source.datum_type == consts.PJD_3PARAM) {
    return (source.datum_params[0] == dest.datum_params[0] &&
        source.datum_params[1] == dest.datum_params[1] &&
        source.datum_params[2] == dest.datum_params[2]);
  } else if (source.datum_type == consts.PJD_7PARAM) {
    return (source.datum_params[0] == dest.datum_params[0] &&
        source.datum_params[1] == dest.datum_params[1] &&
        source.datum_params[2] == dest.datum_params[2] &&
        source.datum_params[3] == dest.datum_params[3] &&
        source.datum_params[4] == dest.datum_params[4] &&
        source.datum_params[5] == dest.datum_params[5] &&
        source.datum_params[6] == dest.datum_params[6]);
  } else {
    return true; // datums are equal
  }
}

/*
 * The function Convert_Geodetic_To_Geocentric converts geodetic coordinates
 * (latitude, longitude, and height) to geocentric coordinates (X, Y, Z),
 * according to the current ellipsoid parameters.
 *
 *    Latitude  : Geodetic latitude in radians                     (input)
 *    Longitude : Geodetic longitude in radians                    (input)
 *    Height    : Geodetic height, in meters                       (input)
 *    X         : Calculated Geocentric X coordinate, in meters    (output)
 *    Y         : Calculated Geocentric Y coordinate, in meters    (output)
 *    Z         : Calculated Geocentric Z coordinate, in meters    (output)
 *
 */
Point geodeticToGeocentric(Point p, es, a) {
  var Longitude = p.x;
  var Latitude = p.y;
  var Height = p.z ?? 0; //Z value not always supplied

  var Rn; /*  Earth radius at location  */
  var Sin_Lat; /*  math.sin(Latitude)  */
  var Sin2_Lat; /*  Square of math.sin(Latitude)  */
  var Cos_Lat; /*  math.cos(Latitude)  */

  /*
   ** Don't blow up if Latitude is just a little out of the value
   ** range as it may just be a rounding issue.  Also removed longitude
   ** test, it should be wrapped by math.cos() and math.sin().  NFW for PROJ.4, Sep/2001.
   */
  if (Latitude < -consts.HALF_PI && Latitude > -1.001 * consts.HALF_PI) {
    Latitude = -consts.HALF_PI;
  } else if (Latitude > consts.HALF_PI && Latitude < 1.001 * consts.HALF_PI) {
    Latitude = consts.HALF_PI;
  } else if (Latitude < -consts.HALF_PI) {
    /* Latitude out of range */
    //..reportError('geocent:lat out of range:' + Latitude);

    return Point.withZ(x: -double.infinity, y: -double.infinity, z: p.z);
  } else if (Latitude > consts.HALF_PI) {
    /* Latitude out of range */
    return Point.withZ(x: double.infinity, y: double.infinity, z: p.z);
  }

  if (Longitude > math.pi) {
    Longitude -= (2 * math.pi);
  }
  Sin_Lat = math.sin(Latitude);
  Cos_Lat = math.cos(Latitude);
  Sin2_Lat = Sin_Lat * Sin_Lat;
  Rn = a / (math.sqrt(1.0e0 - es * Sin2_Lat));
  return Point.withZ(
      x: (Rn + Height) * Cos_Lat * math.cos(Longitude),
      y: (Rn + Height) * Cos_Lat * math.sin(Longitude),
      z: ((Rn * (1 - es)) + Height) * Sin_Lat);
} // cs_ge

Point geocentricToGeodetic(Point p, double es, double a, double b) {
  /* local defintions and variables */
  /* end-criterium of loop, accuracy of sin(Latitude) */
  var genau = 1e-12;
  var genau2 = (genau * genau);
  var maxiter = 30;

  double P; /* distance between semi-minor axis and location */
  double RR; /* distance between center and location */
  double CT; /* sin of geocentric latitude */
  double ST; /* cos of geocentric latitude */
  double RX;
  double RK;
  double RN; /* Earth radius at location */
  double CPHI0; /* cos of start or old geodetic latitude in iterations */
  double SPHI0; /* sin of start or old geodetic latitude in iterations */
  double CPHI; /* cos of searched geodetic latitude */
  double SPHI; /* sin of searched geodetic latitude */
  double
      SDPHI; /* end-criterium: addition-theorem of sin(Latitude(iter)-Latitude(iter-1)) */
  var iter; /* # of continous iteration, max. 30 is always enough (s.a.) */

  var X = p.x;
  var Y = p.y;
  var Z = p.z ?? 0.0; //Z value not always supplied
  double Longitude;
  double Latitude;
  double Height;

  P = math.sqrt(X * X + Y * Y);
  RR = math.sqrt(X * X + Y * Y + Z * Z);

  /*      special cases for latitude and longitude */
  if (P / a < genau) {
    /*  special case, if P=0. (X=0., Y=0.) */
    Longitude = 0.0;

    /*  if (X,Y,Z)=(0.,0.,0.) then Height becomes semi-minor axis
     *  of ellipsoid (=center of mass), Latitude becomes PI/2 */
    if (RR / a < genau) {
      Latitude = consts.HALF_PI;
      Height = -b;
      return Point.withZ(x: p.x, y: p.y, z: p.z);
    }
  } else {
    /*  ellipsoidal (geodetic) longitude
     *  interval: -PI < Longitude <= +PI */
    Longitude = math.atan2(Y, X);
  }

  /* --------------------------------------------------------------
   * Following iterative algorithm was developped by
   * "Institut for Erdmessung", University of Hannover, July 1988.
   * Internet: www.ife.uni-hannover.de
   * Iterative computation of CPHI,SPHI and Height.
   * Iteration of CPHI and SPHI to 10**-12 radian resp.
   * 2*10**-7 arcsec.
   * --------------------------------------------------------------
   */
  CT = Z / RR;
  ST = P / RR;
  RX = 1.0 / math.sqrt(1.0 - es * (2.0 - es) * ST * ST);
  CPHI0 = ST * (1.0 - es) * RX;
  SPHI0 = CT * RX;
  iter = 0;

  /* loop to find sin(Latitude) resp. Latitude
   * until |sin(Latitude(iter)-Latitude(iter-1))| < genau */
  do {
    iter++;
    RN = a / math.sqrt(1.0 - es * SPHI0 * SPHI0);

    /*  ellipsoidal (geodetic) height */
    Height = P * CPHI0 + Z * SPHI0 - RN * (1.0 - es * SPHI0 * SPHI0);

    RK = es * RN / (RN + Height);
    RX = 1.0 / math.sqrt(1.0 - RK * (2.0 - RK) * ST * ST);
    CPHI = ST * (1.0 - RK) * RX;
    SPHI = CT * RX;
    SDPHI = SPHI * CPHI0 - CPHI * SPHI0;
    CPHI0 = CPHI;
    SPHI0 = SPHI;
  } while (SDPHI * SDPHI > genau2 && iter < maxiter);

  /*      ellipsoidal (geodetic) latitude */
  Latitude = math.atan(SPHI / CPHI.abs());
  return Point.withZ(x: Longitude, y: Latitude, z: Height);
} // cs_geocentric_to_geodetic()

/****************************************************************/
// pj_geocentic_to_wgs84( p )
//  p = point to transform in geocentric coordinates (x,y,z)

/** point object, nothing fancy, just allows values to be
    passed back and forth by reference rather than by value.
    Other point classes may be used as long as they have
    x and y properties, which will get modified in the transform method.
*/
Point geocentricToWgs84(Point p, int datum_type, List<double> datum_params) {
  if (datum_type == consts.PJD_3PARAM) {
    // if( x[io] === HUGE_VAL )
    //    continue;
    return Point.withZ(
        x: p.x + datum_params[0],
        y: p.y + datum_params[1],
        z: p.z + datum_params[2]);
  } else if (datum_type == consts.PJD_7PARAM) {
    var Dx_BF = datum_params[0];
    var Dy_BF = datum_params[1];
    var Dz_BF = datum_params[2];
    var Rx_BF = datum_params[3];
    var Ry_BF = datum_params[4];
    var Rz_BF = datum_params[5];
    var M_BF = datum_params[6];
    // if( x[io] === HUGE_VAL )
    //    continue;
    return Point.withZ(
        x: M_BF * (p.x - Rz_BF * p.y + Ry_BF * p.z) + Dx_BF,
        y: M_BF * (Rz_BF * p.x + p.y - Rx_BF * p.z) + Dy_BF,
        z: M_BF * (-Ry_BF * p.x + Rx_BF * p.y + p.z) + Dz_BF);
  }
  return null;
} // cs_geocentric_to_wgs84

/****************************************************************/
// pj_geocentic_from_wgs84()
//  coordinate system definition,
//  point to transform in geocentric coordinates (x,y,z)
Point geocentricFromWgs84(Point p, int datum_type, List<double> datum_params) {
  if (datum_type == consts.PJD_3PARAM) {
    //if( x[io] === HUGE_VAL )
    //    continue;
    return Point.withZ(
      x: p.x - datum_params[0],
      y: p.y - datum_params[1],
      z: p.z - datum_params[2],
    );
  } else if (datum_type == consts.PJD_7PARAM) {
    var Dx_BF = datum_params[0];
    var Dy_BF = datum_params[1];
    var Dz_BF = datum_params[2];
    var Rx_BF = datum_params[3];
    var Ry_BF = datum_params[4];
    var Rz_BF = datum_params[5];
    var M_BF = datum_params[6];
    var x_tmp = (p.x - Dx_BF) / M_BF;
    var y_tmp = (p.y - Dy_BF) / M_BF;
    var z_tmp = (p.z - Dz_BF) / M_BF;
    //if( x[io] === HUGE_VAL )
    //    continue;

    return Point.withZ(
        x: x_tmp + Rz_BF * y_tmp - Ry_BF * z_tmp,
        y: -Rz_BF * x_tmp + y_tmp + Rx_BF * z_tmp,
        z: Ry_BF * x_tmp - Rx_BF * y_tmp + z_tmp);
  }
  return null;
} //cs_geocentric_from_wgs84()
