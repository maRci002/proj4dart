import 'package:proj4dart/src/datum2.dart';
import 'package:proj4dart/src/ellipsoid.dart';

class DatumParameters {
  static final SIXTH = .1666666666666666667; /* 1/6 */
  static final RA4 = .04722222222222222222; /* 17/360 */
  static final RA6 = .02215608465608465608; /* 67/3024 */
  static final RV4 = .06944444444444444444; /* 5/72 */
  static final RV6 = .04243827160493827160; /* 55/1296 */

  Datum datum = null;
  var datumTransform = null as List<double>;

  Ellipsoid ellipsoid;
  double a = double.nan;
  double es = double.nan;

  DatumParameters() {
    // Default datum is WGS84
    // setDatum(Datum.WGS84);
  }

  Datum getDatum() {
    if (datum != null) {
      return datum;
    }
    // if no ellipsoid was specified, return WGS84 as the default
    if (ellipsoid == null && !isDefinedExplicitly()) {
      return Datum.WGS84;
    }
    // if ellipsoid was WGS84, return that datum
    if (ellipsoid == Ellipsoid.WGS84) return Datum.WGS84;
    // otherwise, return a custom datum with the specified ellipsoid
    return Datum.v4('User', datumTransform, getEllipsoid(), 'User-defined');
  }

  bool isDefinedExplicitly() {
    return !(a.isNaN || es.isNaN);
  }

  Ellipsoid getEllipsoid() {
    if (ellipsoid != null) {
      return ellipsoid;
    }
    return Ellipsoid.v2('user', a, es, 'User-defined');
  }

  void setDatumTransform(List<double> datumTransform) {
    datumTransform = datumTransform;
    // force new Datum to be created
    datum = null;
  }

  void setDatum(Datum datum) {
    datum = datum;
  }

  void setEllipsoid(Ellipsoid ellipsoid) {
    ellipsoid = ellipsoid;
    es = ellipsoid.eccentricity2;
    a = ellipsoid.equatorRadius;
  }

  void setA(double a) {
    ellipsoid = null; // force user-defined ellipsoid
    a = a;
  }

  void setB(double b) {
    ellipsoid = null; // force user-defined ellipsoid
    es = 1.0 - (b * b) / (a * a);
  }

  void setES(double es) {
    ellipsoid = null; // force user-defined ellipsoid
    es = es;
  }

  void setRF(double rf) {
    ellipsoid = null; // force user-defined ellipsoid
    es = rf * (2.0 - rf);
  }

  void setR_A() {
    ellipsoid = null; // force user-defined ellipsoid
    a *= 1.0 - es * (SIXTH + es * (RA4 + es * RA6));
  }

  void setF(double f) {
    ellipsoid = null; // force user-defined ellipsoid
    var rf = 1.0 / f;
    es = rf * (2.0 - rf);
  }

  double getA() {
    return a;
  }

  double getES() {
    return es;
  }
}
