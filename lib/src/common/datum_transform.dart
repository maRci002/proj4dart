import 'package:proj4dart/src/classes/datum.dart';
import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/common/datum_utils.dart' as datum_utils;
import 'package:proj4dart/src/constants/values.dart' as consts;

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
  if (source.datumType == consts.PJD_NODATUM ||
      dest.datumType == consts.PJD_NODATUM) {
    return point;
  }

  // If this datum requires grid shifts, then apply it to geodetic coordinates.

  // Do we need to go through geocentric coordinates?
  // if (source.es === dest.es && source.a === dest.a && !checkParams(source.datumType) &&  !checkParams(dest.datumType)) {
  //   return point;
  // }

  // Convert to geocentric coordinates.
  point = datum_utils.geodeticToGeocentric(point, source.es, source.a);
  // Convert between datums
  if (checkParams(source.datumType)) {
    point = datum_utils.geocentricToWgs84(
        point, source.datumType, source.datumParams);
  }
  if (checkParams(dest.datumType)) {
    point = datum_utils.geocentricFromWgs84(
        point, dest.datumType, dest.datumParams);
  }
  return datum_utils.geocentricToGeodetic(point, dest.es, dest.a, dest.b);
}
