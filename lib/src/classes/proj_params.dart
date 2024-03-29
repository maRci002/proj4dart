import 'package:proj4dart/src/classes/datum.dart';
import 'package:proj4dart/src/classes/nadgrid.dart';
import 'package:proj4dart/src/common/derive_constants.dart' as dc;
import 'package:proj4dart/src/constants/datums.dart' as datums;
import 'package:proj4dart/src/constants/prime_meridians.dart' as consts_pm;
import 'package:proj4dart/src/constants/units.dart' as consts_units;
import 'package:proj4dart/src/constants/values.dart' as consts;
import 'package:wkt_parser/wkt_parser.dart' as wkt_parser;

class ProjParams {
  Map<String, Object?> map = {};
  String? srsCode;

  String? get title => map['title'] as String?;
  String? get datumCode => map['datumCode'] as String?;
  String? get proj => map['proj'] as String?;
  double? get rf => map['rf'] as double?;
  double? get lat0 => map['lat0'] as double?;
  double? get lat1 => map['lat1'] as double?;
  double? get lat2 => map['lat2'] as double?;
  double? get lat_ts => map['lat_ts'] as double?;
  double get long0 => map['long0'] as double? ?? double.nan;
  double? get long1 => map['long1'] as double?;
  double? get long2 => map['long2'] as double?;
  double? get alpha => map['alpha'] as double?;
  double? get longc => map['longc'] as double?;
  double? get x0 => map['x0'] as double?;
  double? get y0 => map['y0'] as double?;
  double? get k0 => map['k0'] as double?;
  double? get k => map['k'] as double?;
  double? get a => map['a'] as double?;
  double? get b => map['b'] as double?;
  bool? get R_A => map['R_A'] as bool?;
  int? get zone => map['zone'] as int?;
  bool? get utmSouth => map['utmSouth'] as bool?;
  List<double>? get datum_params => map['datum_params'] is List<double>
      ? map['datum_params'] as List<double>?
      : _parseDatumParams(map['datum_params'] as List<dynamic>?);
  double? get to_meter => map['to_meter'] as double?;
  String? get units => map['units'] as String?;
  double? get from_greenwich => map['from_greenwich'] as double?;
  String? get nadgrids => map['nadgrids'] as String?;
  String? get axis => map['axis'] as String?;
  bool? get no_defs => map['no_defs'] as bool?;

  // Extra properties
  String? get ellps => map['ellps'] as String?;
  String? get datumName => map['datumName'] as String?;
  bool? get sphere => map['sphere'] as bool?;
  double? get es => map['es'] as double?;
  double? get e => map['e'] as double?;
  double? get ep2 => map['ep2'] as double?;

  // Datum properties
  Datum? get datum => map['datum'] as Datum?;

  /// Default constructor
  ProjParams(String defData) {
    srsCode = defData;
    var paramObj = <String, dynamic>{};
    defData.split('+').map((v) => v.trim())
        // .where((a) => a != null)
        .forEach((a) {
      var split = a.split('=');
      if (split.length == 2) {
        paramObj[split[0]] = split[1];
      } else if (split.length == 1 && split[0].isNotEmpty) {
        paramObj[split[0]] = true;
      }
    });
    _iterateProps(paramObj);
    _addExtraProps();
  }

  /// Construct ProjParams from ProjWKT
  ProjParams.fromWKT(wkt_parser.ProjWKT wkt) {
    _iterateProps(wkt.map);
    _addExtraProps();
  }

  /// Populate map object with parameters
  void _iterateProps(Map<String, dynamic> paramObj) {
    paramObj.forEach((key, v) {
      switch (key) {
        case 'title':
          map['title'] = v;
          break;
        case 'rf':
          map['rf'] = v is double ? v : double.parse(v);
          break;
        case 'lat_0':
          map['lat0'] = v is double ? v : double.parse(v) * consts.D2R;
          break;
        case 'lat_1':
          map['lat1'] = v is double ? v : double.parse(v) * consts.D2R;
          break;
        case 'lat_2':
          map['lat2'] = v is double ? v : double.parse(v) * consts.D2R;
          break;
        case 'lat_ts':
          map['lat_ts'] = v is double ? v : double.parse(v) * consts.D2R;
          break;
        case 'lon_0':
          map['long0'] = v is double ? v : double.parse(v) * consts.D2R;
          break;
        case 'lon_1':
          map['long1'] = v is double ? v : double.parse(v) * consts.D2R;
          break;
        case 'lon_2':
          map['long2'] = v is double ? v : double.parse(v) * consts.D2R;
          break;
        case 'alpha':
          map['alpha'] = v is double ? v : double.parse(v) * consts.D2R;
          break;
        case 'lonc':
          map['longc'] = v is double ? v : double.parse(v) * consts.D2R;
          break;
        case 'x_0':
          map['x0'] = v is double ? v : double.parse(v);
          break;
        case 'y_0':
          map['y0'] = v is double ? v : double.parse(v);
          break;
        case 'k_0':
          map['k0'] = v is double ? v : double.parse(v);
          break;
        case 'k':
          map['k0'] = v is double ? v : double.parse(v);
          break;
        case 'a':
          map['a'] = v is double ? v : double.parse(v);
          break;
        case 'b':
          map['b'] = v is double ? v : double.parse(v);
          break;
        case 'r_a':
          map['R_A'] = true;
          break;
        case 'zone':
          map['zone'] = v is int ? v : int.parse(v);
          break;
        case 'south':
          map['utmSouth'] = true;
          break;
        case 'towgs84':
          map['datum_params'] = _getDatumParamsFromString(v.toString());
          break;
        case 'to_meter':
          map['to_meter'] = v is double ? v : double.parse(v);
          break;
        case 'units':
          map['units'] = v;
          var unit = consts_units.match(v);
          if (unit != null) {
            map['to_meter'] = unit.to_meter;
          }
          break;
        case 'from_greenwich':
          map['from_greenwich'] =
              v is double ? v : double.parse(v) * consts.D2R;
          break;
        case 'pm':
          var primeMeridian = consts_pm.match(v);
          map['from_greenwich'] =
              (primeMeridian ?? (v is double ? v : double.parse(v))) *
                  consts.D2R;
          break;
        case 'datum':
          map['datumCode'] = v;
          break;
        case 'projName':
          map['proj'] = v;
          break;
        case 'proj':
          map['proj'] = v;
          break;
        case 'nadgrids':
          if (v == '@null') {
            map['datumCode'] = 'none';
          } else {
            map['nadgrids'] = v;
          }
          break;
        case 'datum_params':
          map['datum_params'] = v;
          break;
        case 'axis': //e.g. 'enu'
          var legalAxis = 'ewnsud';
          var axis = v.toString();
          if (axis.length == 3 &&
              legalAxis.contains(axis[0]) &&
              legalAxis.contains(axis[1]) &&
              legalAxis.contains(axis[2])) {
            map['axis'] = v;
          }
          break;
        default:
          // Add all other properties as well (those will not have a getter but still can be accessed via map['myKey'])
          map[key] = v;
          break;
      }
    });
    if (datumCode != null && datumCode != 'WGS84') {
      map['datumCode'] = datumCode!.toLowerCase();
    }
  }

  /// Get datum, sphere and eccentricity parameters
  void _addExtraProps() {
    if (datumCode != null && datumCode != 'none') {
      var datumDef = datums.match(datumCode!);
      if (datumDef != null) {
        map['datum_params'] = datumDef.towgs84 != null
            ? _getDatumParamsFromString(datumDef.towgs84!)
            : null;
        map['ellps'] = datumDef.ellipse;
        map['datumName'] = datumDef.datumName /* ?? datumCode*/;
      }
    }
    map['k0'] = k0 ?? 1.0;
    map['axis'] = axis ?? 'enu';
    map['ellps'] = ellps ?? 'wgs84';
    var sphere = dc.sphere(a, b, rf, ellps!, map['sphere'] as bool?);
    var ecc = dc.eccentricity(sphere['a'] as double, sphere['b'] as double,
        sphere['rf'] as double?, R_A);
    var parsedNadgrids = Nadgird.getNadgrids(nadgrids);
    map['a'] = sphere['a'];
    map['b'] = sphere['b'];
    map['rf'] = sphere['rf'];
    map['sphere'] = sphere['sphere'];
    map['es'] = ecc['es'];
    map['e'] = ecc['e'];
    map['ep2'] = ecc['ep2'];
    if (datum == null) {
      map['datum'] =
          Datum(datumCode, datum_params, a!, b!, es!, ep2!, parsedNadgrids);
    }
  }

  /// Get datum parameters from towgs84 parameter as double list
  List<double> _getDatumParamsFromString(String towgs84) {
    return towgs84.split(',').map(double.parse).toList();
  }

  /// Parse to List<double> if possible for the getter function to work
  List<double>? _parseDatumParams(List<dynamic>? paramsList) {
    return paramsList != null
        ? paramsList.map((e) => double.parse(e.toString())).toList()
        : null;
  }
}
