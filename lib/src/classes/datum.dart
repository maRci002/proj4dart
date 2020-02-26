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
}
