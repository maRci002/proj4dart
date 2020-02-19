import 'package:proj4dart/src/constants/values.dart';
import 'package:proj4dart/src/datum2.dart';
import 'package:proj4dart/src/datum_utils.dart';
import 'package:proj4dart/src/point.dart';

class DatumTransform {
  static bool checkParams(int type) {
    return (type == ConstValues.PJD_3PARAM || type == ConstValues.PJD_7PARAM);
  }

  static Point transform(Datum source, Datum dest, Point point) {
    // Short cut if the datums are identical.
    if (DatumUtils.compareDatums(source, dest)) {
      return point; // in this case, zero is sucess,
      // whereas cs_compare_datums returns 1 to indicate TRUE
      // confusing, should fix this
    }

    // Explicitly skip datum transform by setting 'datum=none' as parameter for either source or dest
    if (source.datum_type == ConstValues.PJD_NODATUM ||
        dest.datum_type == ConstValues.PJD_NODATUM) {
      return point;
    }

    // If this datum requires grid shifts, then apply it to geodetic coordinates.

    // Do we need to go through geocentric coordinates?
    // if (source.es === dest.es && source.a === dest.a && !checkParams(source.datum_type) &&  !checkParams(dest.datum_type)) {
    //   return point;
    // }

    // Convert to geocentric coordinates.
    point = DatumUtils.geodeticToGeocentric(point, source.es, source.a);
    // Convert between datums
    if (checkParams(source.datum_type)) {
      point = DatumUtils.geocentricToWgs84(
          point, source.datum_type, source.datum_params);
    }
    if (checkParams(dest.datum_type)) {
      point = DatumUtils.geocentricFromWgs84(
          point, dest.datum_type, dest.datum_params);
    }
    return DatumUtils.geocentricToGeodetic(point, dest.es, dest.a, dest.b);
  }
}
