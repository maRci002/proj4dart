import 'package:proj4dart/src/constants/values.dart' as consts;

class Datum {
  int datumType;
  List<double> datumParams;
  final double a;
  final double b;
  final double es;
  final double ep2;

  Datum(String datumCode, List<double> datum_params, double a, double b,
      double es, double ep2)
      : a = a,
        b = b,
        es = es,
        ep2 = ep2 {
    if (datumCode == null || datumCode == 'none') {
      datumType = consts.PJD_NODATUM;
    } else {
      datumType = consts.PJD_WGS84;
    }
    if (datum_params != null && datum_params.isNotEmpty) {
      datumParams = datum_params;
      if (datumParams[0] != 0 || datumParams[1] != 0 || datumParams[2] != 0) {
        datumType = consts.PJD_3PARAM;
      }
      if (datumParams.length > 3) {
        if (datumParams[3] != 0 ||
            datumParams[4] != 0 ||
            datumParams[5] != 0 ||
            datumParams[6] != 0) {
          datumType = consts.PJD_7PARAM;
          datumParams[3] *= consts.SEC_TO_RAD;
          datumParams[4] *= consts.SEC_TO_RAD;
          datumParams[5] *= consts.SEC_TO_RAD;
          datumParams[6] = (datumParams[6] / 1000000.0) + 1.0;
        }
      }
    }
  }

  // static bool _compareDatums(Datum source, Datum dest) {
  //   if (source.datumType != dest.datumType) {
  //     return false; // false, datums are not equal
  //   } else if (source.a != dest.a ||
  //       ((source.es - dest.es).abs()) > 0.000000000050) {
  //     // the tolerance for es is to ensure that GRS80 and WGS84
  //     // are considered identical
  //     return false;
  //   } else if (source.datumType == consts.PJD_3PARAM) {
  //     return (source.datumParams[0] == dest.datumParams[0] &&
  //         source.datumParams[1] == dest.datumParams[1] &&
  //         source.datumParams[2] == dest.datumParams[2]);
  //   } else if (source.datumType == consts.PJD_7PARAM) {
  //     return (source.datumParams[0] == dest.datumParams[0] &&
  //         source.datumParams[1] == dest.datumParams[1] &&
  //         source.datumParams[2] == dest.datumParams[2] &&
  //         source.datumParams[3] == dest.datumParams[3] &&
  //         source.datumParams[4] == dest.datumParams[4] &&
  //         source.datumParams[5] == dest.datumParams[5] &&
  //         source.datumParams[6] == dest.datumParams[6]);
  //   } else {
  //     return true; // datums are equal
  //   }
  // }

  // static bool _checkParams(int type) {
  //   return (type == consts.PJD_3PARAM || type == consts.PJD_7PARAM);
  // }

  // static Point datumTransform(Datum source, Datum dest, Point point) {
  //   // Short cut if the datums are identical.
  //   if (_compareDatums(source, dest)) {
  //     return point;
  //   }

  //   // Explicitly skip datum transform by setting 'datum=none' as parameter for either source or dest
  //   if (source.datumType == consts.PJD_NODATUM ||
  //       dest.datumType == consts.PJD_NODATUM) {
  //     return point;
  //   }

  //   // If this datum requires grid shifts, then apply it to geodetic coordinates.

  //   // Do we need to go through geocentric coordinates?
  //   if (source.es == dest.es &&
  //       source.a == dest.a &&
  //       !_checkParams(source.datumType) &&
  //       !_checkParams(dest.datumType)) {
  //     return point;
  //   }

  // Convert to geocentric coordinates.
  //   point = _geodeticToGeocentric(point, source.es, source.a);
  //   // Convert between datums
  //   if (_checkParams(source.datumType)) {
  //     point = _geocentricToWgs84(point, source.datumType, source.datumParams);
  //   }
  //   if (_checkParams(dest.datumType)) {
  //     point = _geocentricFromWgs84(point, dest.datumType, dest.datumParams);
  //   }
  //   return _geocentricToGeodetic(point, dest.es, dest.a, dest.b);
  // }

  /// The function Convert_Geodetic_To_Geocentric converts geodetic coordinates
  /// (latitude, longitude, and height) to geocentric coordinates (x, y, z),
  /// according to the current ellipsoid parameters.
  ///
  ///    latitude  : Geodetic latitude in radians                     (input)
  ///    longitude : Geodetic longitude in radians                    (input)
  ///    height    : Geodetic height, in meters                       (input)
  ///    x         : Calculated Geocentric x coordinate, in meters    (output)
  ///    y         : Calculated Geocentric y coordinate, in meters    (output)
  ///    z         : Calculated Geocentric z coordinate, in meters    (output)
  // static Point _geodeticToGeocentric(Point point, double es, double a) {
  //   var longitude = point.x;
  //   var latitude = point.y;
  //   var height = point.z ?? 0; //z value not always supplied

  //   var rn; // Earth radius at location
  //   var sinLat; // math.sin(latitude)
  //   var sin2Lat; // Square of math.sin(latitude)
  //   var cosLat; // math.cos(latitude)

  //   /// Don't blow up if latitude is just a little out of the value
  //   /// range as it may just be a rounding issue. Also removed longitude
  //   /// test, it should be wrapped by math.cos() and math.sin(). NFW for PROJ.4, Sep/2001.
  //   if (latitude < -consts.HALF_PI && latitude > -1.001 * consts.HALF_PI) {
  //     latitude = -consts.HALF_PI;
  //   } else if (latitude > consts.HALF_PI && latitude < 1.001 * consts.HALF_PI) {
  //     latitude = consts.HALF_PI;
  //   } else if (latitude < -consts.HALF_PI) {
  //     // latitude out of range
  //     // ..reportError('geocent:lat out of range:' + latitude);
  //     return Point.withZ(
  //       x: double.negativeInfinity,
  //       y: double.negativeInfinity,
  //       z: point.z,
  //     );
  //   } else if (latitude > consts.HALF_PI) {
  //     // latitude out of range
  //     return Point.withZ(
  //       x: double.infinity,
  //       y: double.infinity,
  //       z: point.z,
  //     );
  //   }

  //   if (longitude > math.pi) {
  //     longitude -= (2 * math.pi);
  //   }

  //   sinLat = math.sin(latitude);
  //   cosLat = math.cos(latitude);
  //   sin2Lat = sinLat * sinLat;
  //   rn = a / (math.sqrt(1.0e0 - es * sin2Lat));
  //   return Point.withZ(
  //     x: (rn + height) * cosLat * math.cos(longitude),
  //     y: (rn + height) * cosLat * math.sin(longitude),
  //     z: ((rn * (1 - es)) + height) * sinLat,
  //   );
  // }

  // static Point _geocentricToGeodetic(
  //     Point point, double es, double a, double b) {
  //   // local defintions and variables
  //   // end-criterium of loop, accuracy of sin(latitude)
  //   var genau = 1e-12;
  //   var genau2 = (genau * genau);
  //   var maxiter = 30;

  //   var p; // distance between semi-minor axis and location
  //   var rr; // distance between center and location
  //   var ct; // sin of geocentric latitude
  //   var st; // cos of geocentric latitude
  //   var rx;
  //   var rk;
  //   var rn; // Earth radius at location
  //   var cphi0; // cos of start or old geodetic latitude in iterations
  //   var sphi0; // sin of start or old geodetic latitude in iterations
  //   var cphi; // cos of searched geodetic latitude
  //   var sphi; // sin of searched geodetic latitude
  //   var sdphi; // end-criterium: addition-theorem of sin(latitude(iter)-latitude(iter-1))
  //   var iter; // # of continous iteration, max. 30 is always enough (s.a.)

  //   var x = point.x;
  //   var y = point.y;
  //   var z = point.z ?? 0.0; //z value not always supplied
  //   var longitude;
  //   var latitude;
  //   var height;

  //   p = math.sqrt(x * x + y * y);
  //   rr = math.sqrt(x * x + y * y + z * z);

  //   // special cases for latitude and longitude
  //   if (p / a < genau) {
  //     // special case, if pp=0. (x=0., y=0.)
  //     longitude = 0.0;

  //     // if (x,y,z)=(0.,0.,0.) then height becomes semi-minor axis
  //     // of ellipsoid (=center of mass), latitude becomes PI/2
  //     if (rr / a < genau) {
  //       latitude = consts.HALF_PI;
  //       height = -b;

  //       return Point.withZ(
  //         x: point.x,
  //         y: point.y,
  //         z: point.z,
  //       );
  //     }
  //   } else {
  //     // ellipsoidal (geodetic) longitude
  //     // interval: -PI < longitude <= +PI
  //     longitude = math.atan2(y, x);
  //   }

  //   /// --------------------------------------------------------------
  //   /// Following iterative algorithm was developped by
  //   /// "Institut for Erdmessung", University of Hannover, July 1988.
  //   /// Internet: www.ife.uni-hannover.de
  //   /// Iterative computation of cphi,sphi and height.
  //   /// Iteration of cphi and sphi to 10**-12 radian resp.
  //   /// 2*10**-7 arcsec.
  //   /// --------------------------------------------------------------
  //   ct = z / rr;
  //   st = p / rr;
  //   rx = 1.0 / math.sqrt(1.0 - es * (2.0 - es) * st * st);
  //   cphi0 = st * (1.0 - es) * rx;
  //   sphi0 = ct * rx;
  //   iter = 0;

  //   // loop to find sin(latitude) resp. latitude
  //   // until |sin(latitude(iter)-latitude(iter-1))| < genau
  //   do {
  //     iter++;
  //     rn = a / math.sqrt(1.0 - es * sphi0 * sphi0);

  //     // ellipsoidal (geodetic) height
  //     height = p * cphi0 + z * sphi0 - rn * (1.0 - es * sphi0 * sphi0);

  //     rk = es * rn / (rn + height);
  //     rx = 1.0 / math.sqrt(1.0 - rk * (2.0 - rk) * st * st);
  //     cphi = st * (1.0 - rk) * rx;
  //     sphi = ct * rx;
  //     sdphi = sphi * cphi0 - cphi * sphi0;
  //     cphi0 = cphi;
  //     sphi0 = sphi;
  //   } while (sdphi * sdphi > genau2 && iter < maxiter);

  //   // ellipsoidal (geodetic) latitude
  //   latitude = math.atan(sphi / cphi.abs());
  //   return Point.withZ(
  //     x: longitude,
  //     y: latitude,
  //     z: height,
  //   );
  // }

  // static Point _geocentricToWgs84(
  //     Point point, int datumType, List<double> datumParams) {
  //   if (datumType == consts.PJD_3PARAM) {
  //     // if( x[io] == HUGE_VAL )
  //     //    continue;
  //     return Point.withZ(
  //       x: point.x + datumParams[0],
  //       y: point.y + datumParams[1],
  //       z: point.z + datumParams[2],
  //     );
  //   } else if (datumType == consts.PJD_7PARAM) {
  //     var dxBf = datumParams[0];
  //     var dyBf = datumParams[1];
  //     var dzBf = datumParams[2];
  //     var rxBf = datumParams[3];
  //     var ryBf = datumParams[4];
  //     var rzBf = datumParams[5];
  //     var mBf = datumParams[6];
  //     // if( x[io] == HUGE_VAL )
  //     //    continue;
  //     return Point.withZ(
  //       x: mBf * (point.x - rzBf * point.y + ryBf * point.z) + dxBf,
  //       y: mBf * (rzBf * point.x + point.y - rxBf * point.z) + dyBf,
  //       z: mBf * (-ryBf * point.x + rxBf * point.y + point.z) + dzBf,
  //     );
  //   } else {
  //     return null;
  //   }
  // }

  // /// coordinate system definition,
  // /// point to transform in geocentric coordinates (x,y,z)
  // static Point _geocentricFromWgs84(
  //     Point point, int datumType, List<double> datumParams) {
  //   if (datumType == consts.PJD_3PARAM) {
  //     //if( x[io] == HUGE_VAL )
  //     //    continue;
  //     return Point.withZ(
  //       x: point.x - datumParams[0],
  //       y: point.y - datumParams[1],
  //       z: point.z - datumParams[2],
  //     );
  //   } else if (datumType == consts.PJD_7PARAM) {
  //     var dxBf = datumParams[0];
  //     var dyBf = datumParams[1];
  //     var dzBf = datumParams[2];
  //     var rxBf = datumParams[3];
  //     var ryBf = datumParams[4];
  //     var rzBf = datumParams[5];
  //     var mBf = datumParams[6];
  //     var xTmp = (point.x - dxBf) / mBf;
  //     var yTmp = (point.y - dyBf) / mBf;
  //     var zTmp = (point.z - dzBf) / mBf;
  //     //if( x[io] == HUGE_VAL )
  //     //    continue;

  //     return Point.withZ(
  //       x: xTmp + rzBf * yTmp - ryBf * zTmp,
  //       y: -rzBf * xTmp + yTmp + rxBf * zTmp,
  //       z: ryBf * xTmp - rxBf * yTmp + zTmp,
  //     );
  //   }

  //   return null;
  // }
}
