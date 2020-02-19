import 'package:proj4dart/src/constants/values.dart' as consts;

class Datum {
  int datum_type;
  List<double> datum_params;
  double a;
  double b;
  double es;
  double ep2;

  Datum(String datumCode, List<String> datumParams, a, b, es, ep2) {
    if (datumCode == null || datumCode == 'none') {
      datum_type = consts.PJD_NODATUM;
    } else {
      datum_type = consts.PJD_WGS84;
    }
    if (datumParams != null) {
      datum_params = datumParams.map((e) => double.parse(e));
      if (datum_params[0] != 0 ||
          datum_params[1] != 0 ||
          datum_params[2] != 0) {
        datum_type = consts.PJD_3PARAM;
      }
      if (datum_params.length > 3) {
        if (datum_params[3] != 0 ||
            datum_params[4] != 0 ||
            datum_params[5] != 0 ||
            datum_params[6] != 0) {
          datum_type = consts.PJD_7PARAM;
          datum_params[3] *= consts.SEC_TO_RAD;
          datum_params[4] *= consts.SEC_TO_RAD;
          datum_params[5] *= consts.SEC_TO_RAD;
          datum_params[6] = (datum_params[6] / 1000000.0) + 1.0;
        }
      }
    }
    a = a;
    b = b;
    es = es;
    ep2 = ep2;
  }
}
