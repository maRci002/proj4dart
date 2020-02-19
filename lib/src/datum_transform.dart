import 'package:proj4dart/src/constants/values.dart' as consts;
import 'package:proj4dart/src/datum2.dart';
import 'package:proj4dart/src/datum_utils.dart' as datum_utils;
import 'package:proj4dart/src/point.dart';

bool checkParams(int type) {
  return (type == consts.PJD_3PARAM || type == consts.PJD_7PARAM);
}

Point transform(Datum source, Datum dest, Point point) {
  // Short cut if the datums are identical.
  if (datum_utils.compareDatums(source, dest)) {
    return point; // in this case, zero is sucess,
    // whereas cs_compare_datums returns 1 to indicate TRUE
    // confusing, should fix this
  }

  // Explicitly skip datum transform by setting 'datum=none' as parameter for either source or dest
  if (source.datum_type == consts.PJD_NODATUM ||
      dest.datum_type == consts.PJD_NODATUM) {
    return point;
  }

  // If this datum requires grid shifts, then apply it to geodetic coordinates.

  // Do we need to go through geocentric coordinates?
  // if (source.es === dest.es && source.a === dest.a && !checkParams(source.datum_type) &&  !checkParams(dest.datum_type)) {
  //   return point;
  // }

  // Convert to geocentric coordinates.
  point = datum_utils.geodeticToGeocentric(point, source.es, source.a);
  // Convert between datums
  if (checkParams(source.datum_type)) {
    point = datum_utils.geocentricToWgs84(
        point, source.datum_type, source.datum_params);
  }
  if (checkParams(dest.datum_type)) {
    point = datum_utils.geocentricFromWgs84(
        point, dest.datum_type, dest.datum_params);
  }
  return datum_utils.geocentricToGeodetic(point, dest.es, dest.a, dest.b);
}
