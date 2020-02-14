// See: https://github.com/Proj4J/proj4j/blob/master/trunk/src/main/java/org/osgeo/proj4j/parser/Proj4Parser.java
import 'package:proj4dart/proj4dart.dart';
import 'package:proj4dart/src/datum2.dart';
import 'package:proj4dart/src/datum_parameters.dart';
import 'package:proj4dart/src/proj_keyword.dart';
import 'package:proj4dart/src/proj_math.dart';

class ProjParser {
  static Projection parse(String def) {
    print(def);
    var args = def.replaceAll('  ', ' ').split(' ');
    if (args == null) {
      return null;
    }
    var params = _createParameterMap(args);
    var datumParam = DatumParameters();
    parseDatum(params, datumParam);
    print(params);
    print('');

    return null;
  }

  static void parseDatum(Map params, DatumParameters datumParam) {
    String towgs84 = params[ProjKeyword.towgs84];
    if (towgs84 != null) {
      var datumConvParams = parseToWGS84(towgs84);
      datumParam.setDatumTransform(datumConvParams);
    }
    var code = params[ProjKeyword.datum] as String;
    if (code != null) {
      Datum datum = registry.getDatum(code);
      if (datum == null) {
        throw Exception('Unknown datum: ' + code);
      }
      datumParam.setDatum(datum);
    }
  }

  static List<double> parseToWGS84(String paramList) {
    var numStr = paramList.split(',');
    if (!(numStr.length == 3 || numStr.length == 7)) {
      throw Exception(
          'Invalid number of values (must be 3 or 7) in +towgs84: $paramList');
    }
    var param = List<double>(numStr.length);
    for (var i = 0; i < numStr.length; i++) {
      param[i] = double.parse(numStr[i]);
    }
    if (param.length > 3) {
      if (param[3] == 0.0 &&
          param[4] == 0.0 &&
          param[5] == 0.0 &&
          param[6] == 0.0) {
        param = [param[0], param[1], param[2]];
      }
    }
    if (param.length > 3) {
      param[3] *= ProjectionMath.SECONDS_TO_RAD;
      param[4] *= ProjectionMath.SECONDS_TO_RAD;
      param[5] *= ProjectionMath.SECONDS_TO_RAD;
      param[6] = (param[6] / ProjectionMath.MILLION) + 1;
    }
    return param;
  }

  static Map _createParameterMap(List<String> args) {
    var params = {};
    for (var i = 0; i < args.length; i++) {
      var arg = args[i];
      // strip leading "+" if any
      if (arg.startsWith('+')) {
        arg = arg.substring(1);
      }
      var index = arg.indexOf('=');
      if (index != -1) {
        // param of form pppp=vvvv
        var key = arg.substring(0, index);
        var value = arg.substring(index + 1);
        params[key] = value;
      } else {
        params[arg] = null;
      }
    }
    return params;
  }
}
