import 'package:proj4dart/src/ellipsoid.dart';
import 'package:proj4dart/src/proj_coordinate.dart';

class Datum {
  static final TYPE_UNKNOWN = 0;
  static final TYPE_WGS84 = 1;
  static final TYPE_3PARAM = 2;
  static final TYPE_7PARAM = 3;
  static final TYPE_GRIDSHIFT = 4;

  static final List<double> DEFAULT_TRANSFORM = [0.0, 0.0, 0.0];

  static final Datum WGS84 = Datum('WGS84', 0, 0, 0, Ellipsoid.WGS84, 'WGS84');
  static final Datum GGRS87 = Datum('GGRS87', -199.87, 74.79, 246.62,
      Ellipsoid.GRS80, 'Greek_Geodetic_Reference_System_1987');
  static final Datum NAD83 =
      Datum('NAD83', 0, 0, 0, Ellipsoid.GRS80, 'North_American_Datum_1983');
  static final Datum NAD27 = Datum.v3(
      'NAD27',
      '@conus,@alaska,@ntv2_0.gsb,@ntv1_can.dat',
      Ellipsoid.CLARKE_1866,
      'North_American_Datum_1927');
  static final Datum POTSDAM = Datum('potsdam', 606.0, 23.0, 413.0,
      Ellipsoid.BESSEL, 'Potsdam Rauenberg 1950 DHDN');
  static final Datum CARTHAGE = Datum('carthage', -263.0, 6.0, 431.0,
      Ellipsoid.CLARKE_1880, 'Carthage 1934 Tunisia');
  static final Datum HERMANNSKOGEL = Datum(
      'hermannskogel', 653.0, -212.0, 449.0, Ellipsoid.BESSEL, 'Hermannskogel');
  static final Datum IRE65 = Datum.v2('ire65', 482.530, -130.596, 564.557,
      -1.042, -0.214, -0.631, 8.15, Ellipsoid.MOD_AIRY, 'Ireland 1965');
  static final Datum NZGD49 = Datum.v2(
      'nzgd49',
      59.47,
      -5.04,
      187.44,
      0.47,
      -0.1,
      1.024,
      -4.5993,
      Ellipsoid.INTERNATIONAL,
      'Zealand Geodetic Datum 1949');
  static final Datum OSEB36 = Datum.v2('OSGB36', 446.448, -125.157, 542.060,
      0.1502, 0.2470, 0.8421, -20.4894, Ellipsoid.AIRY, 'Airy 1830');

  String code;
  String name;
  Ellipsoid ellipsoid;
  var transform = DEFAULT_TRANSFORM;

  Datum(String code, double deltaX, double deltaY, double deltaZ,
      Ellipsoid ellipsoid, String name)
      : code = code,
        transform = [deltaX, deltaY, deltaZ],
        ellipsoid = ellipsoid,
        name = name;

  Datum.v2(String code, double deltaX, double deltaY, double deltaZ, double rx,
      double ry, double rz, double mbf, Ellipsoid ellipsoid, String name)
      : code = code,
        transform = [deltaX, deltaY, deltaZ, rx, ry, rz, mbf],
        ellipsoid = ellipsoid,
        name = name;

  Datum.v3(String code, String transformSpec, Ellipsoid ellipsoid, String name)
      : code = code,
        transform = null,
        ellipsoid = ellipsoid,
        name = name;

  Datum.v4(
      String code, List<double> transform, Ellipsoid ellipsoid, String name) {
    this.code = code;
    this.name = name;
    this.ellipsoid = ellipsoid;
    if (transform != null) this.transform = transform;
  }

  String getCode() {
    return code;
  }

  String getName() {
    return name;
  }

  @override
  String toString() {
    return '[Datum-' + name + ']';
  }

  Ellipsoid getEllipsoid() {
    return ellipsoid;
  }

  List<double> getTransformToWGS84() {
    return transform;
  }

  int getTransformType() {
    if (transform == null) return TYPE_WGS84;
    if (isIdentity(transform)) return TYPE_WGS84;
    if (transform.length == 3) return TYPE_3PARAM;
    if (transform.length == 7) return TYPE_7PARAM;
    return TYPE_WGS84;
  }

  static bool isIdentity(List<double> transform) {
    for (var i = 0; i < transform.length; i++) {
      if (i == 6) {
        if (transform[i] != 1.0 && transform[i] != 0.0) {
          return false;
        }
      } else if (transform[i] != 0.0) return false;
    }
    return true;
  }

  bool hasTransformToWGS84() {
    var transformType = getTransformType();
    return transformType == TYPE_3PARAM || transformType == TYPE_7PARAM;
  }

  static final double ELLIPSOID_E2_TOLERANCE = 0.000000000050;

  bool isEqual(Datum datum) {
    // false if tranforms are not equal
    if (getTransformType() != datum.getTransformType()) {
      return false;
    }
    // false if ellipsoids are not (approximately) equal
    if (ellipsoid.getEquatorRadius() != ellipsoid.getEquatorRadius()) {
      if ((ellipsoid.getEccentricitySquared() -
                  datum.ellipsoid.getEccentricitySquared())
              .abs() >
          ELLIPSOID_E2_TOLERANCE) {
        return false;
      }
    }
    // false if transform parameters are not identical
    if (getTransformType() == TYPE_3PARAM ||
        getTransformType() == TYPE_7PARAM) {
      for (var i = 0; i < transform.length; i++) {
        if (transform[i] != datum.transform[i]) return false;
      }
      return true;
    }
    return true; // datums are equal
  }

  void transformFromGeocentricToWgs84(ProjCoordinate p) {
    if (transform.length == 3) {
      p.x += transform[0];
      p.y += transform[1];
      p.z += transform[2];
    } else if (transform.length == 7) {
      var Dx_BF = transform[0];
      var Dy_BF = transform[1];
      var Dz_BF = transform[2];
      var Rx_BF = transform[3];
      var Ry_BF = transform[4];
      var Rz_BF = transform[5];
      var M_BF = transform[6];
      var x_out = M_BF * (p.x - Rz_BF * p.y + Ry_BF * p.z) + Dx_BF;
      var y_out = M_BF * (Rz_BF * p.x + p.y - Rx_BF * p.z) + Dy_BF;
      var z_out = M_BF * (-Ry_BF * p.x + Rx_BF * p.y + p.z) + Dz_BF;
      p.x = x_out;
      p.y = y_out;
      p.z = z_out;
    }
  }

  void transformToGeocentricFromWgs84(ProjCoordinate p) {
    if (transform.length == 3) {
      p.x -= transform[0];
      p.y -= transform[1];
      p.z -= transform[2];
    } else if (transform.length == 7) {
      var Dx_BF = transform[0];
      var Dy_BF = transform[1];
      var Dz_BF = transform[2];
      var Rx_BF = transform[3];
      var Ry_BF = transform[4];
      var Rz_BF = transform[5];
      var M_BF = transform[6];
      var x_tmp = (p.x - Dx_BF) / M_BF;
      var y_tmp = (p.y - Dy_BF) / M_BF;
      var z_tmp = (p.z - Dz_BF) / M_BF;
      p.x = x_tmp + Rz_BF * y_tmp - Ry_BF * z_tmp;
      p.y = -Rz_BF * x_tmp + y_tmp + Rx_BF * z_tmp;
      p.z = Ry_BF * x_tmp - Rx_BF * y_tmp + z_tmp;
    }
  }
}
