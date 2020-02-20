import 'package:proj4dart/src/constants/prime_meridian.dart' as consts_pm;
import 'package:proj4dart/src/constants/units.dart' as consts_units;
import 'package:proj4dart/src/constants/values.dart' as consts;

class ProjParams {
  String datumCode;
  String proj;
  String datum;
  double rf;
  double lat0;
  double lat1;
  double lat2;
  double lat_ts;
  double long0;
  double long1;
  double long2;
  double alpha;
  double longc;
  double x0;
  double y0;
  double k0;
  double a;
  double b;
  bool R_A;
  int zone;
  bool utmSouth;
  List<double> datum_params;
  double to_meter;
  String units;
  double from_greenwich;
  String nadgrids;
  String axis;

  Map<String, dynamic> map = {};

  ProjParams(String defData) {
    var paramObj = {} as dynamic;
    defData
        .split('+')
        .map((v) => v.trim())
        .where((a) => a != null)
        .forEach((a) {
      var split = a.split('=');
      if (split.length == 2) {
        paramObj[split[0]] = split[1];
      } else if (split.length == 1 && split[0].isNotEmpty) {
        paramObj[split[0]] = true;
      }
    });
    paramObj.forEach((key, v) {
      switch (key) {
        case 'rf':
          rf = double.parse(v);
          map['rf'] = rf;
          break;
        case 'lat_0':
          lat0 = double.parse(v) * consts.D2R;
          map['lat0'] = lat0;
          break;
        case 'lat_1':
          lat1 = double.parse(v) * consts.D2R;
          map['lat1'] = lat1;
          break;
        case 'lat_2':
          lat2 = double.parse(v) * consts.D2R;
          map['lat2'] = lat2;
          break;
        case 'lat_ts':
          lat_ts = double.parse(v) * consts.D2R;
          map['lat_ts'] = lat_ts;
          break;
        case 'lon_0':
          long0 = double.parse(v) * consts.D2R;
          map['long0'] = long0;
          break;
        case 'lon_1':
          long1 = double.parse(v) * consts.D2R;
          map['long1'] = long1;
          break;
        case 'lon_2':
          long2 = double.parse(v) * consts.D2R;
          map['long2'] = long2;
          break;
        case 'alpha':
          alpha = double.parse(v) * consts.D2R;
          map['alpha'] = alpha;
          break;
        case 'lonc':
          longc = double.parse(v) * consts.D2R;
          map['longc'] = longc;
          break;
        case 'x_0':
          x0 = double.parse(v);
          map['x0'] = x0;
          break;
        case 'y_0':
          y0 = double.parse(v);
          map['y0'] = y0;
          break;
        case 'k_0':
          k0 = double.parse(v);
          map['k0'] = k0;
          break;
        case 'k':
          k0 = double.parse(v);
          map['k0'] = k0;
          break;
        case 'a':
          a = double.parse(v);
          map['a'] = a;
          break;
        case 'b':
          b = double.parse(v);
          map['b'] = b;
          break;
        case 'r_a':
          R_A = true;
          map['R_A'] = R_A;
          break;
        case 'zone':
          zone = int.parse(v);
          map['zone'] = zone;
          break;
        case 'south':
          utmSouth = true;
          map['utmSouth'] = utmSouth;
          break;
        case 'towgs84':
          datum_params = [];
          v.toString().split(',').forEach((element) {
            datum_params.add(double.parse(element));
          });
          map['datum_params'] = datum_params;
          break;
        case 'to_meter':
          to_meter = double.parse(v);
          map['to_meter'] = to_meter;
          break;
        case 'units':
          units = v;
          map['units'] = units;
          var unit = consts_units.match(v);
          if (unit != null) {
            to_meter = unit.to_meter;
            map['to_meter'] = to_meter;
          }
          break;
        case 'from_greenwich':
          from_greenwich = double.parse(v) * consts.D2R;
          map['from_greenwich'] = from_greenwich;
          break;
        case 'pm':
          var primeMeridian = consts_pm.match(v);
          from_greenwich = (primeMeridian ?? double.parse(v)) * consts.D2R;
          map['from_greenwich'] = from_greenwich;
          break;
        case 'nadgrids':
          if (v == '@null') {
            datumCode = 'none';
            map['datumCode'] = datumCode;
          } else {
            nadgrids = v;
            map['nadgrids'] = nadgrids;
          }
          break;
        case 'axis': //e.g. 'enu'
          var legalAxis = 'ewnsud';
          var axis = v.toString();
          if (axis.length == 3 &&
              legalAxis.contains(axis[0]) &&
              legalAxis.contains(axis[1]) &&
              legalAxis.contains(axis[2])) {
            axis = v;
            map['axis'] = axis;
          }
          break;
        default:
          break;
      }
    });
    if (datumCode != null && datumCode != 'WGS84') {
      datumCode = datumCode.toLowerCase();
      map['datumCode'] = datumCode;
    }
  }
}
