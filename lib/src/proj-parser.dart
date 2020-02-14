// See: https://github.com/Proj4J/proj4j/blob/master/trunk/src/main/java/org/osgeo/proj4j/parser/Proj4Parser.java
import 'package:proj4dart/proj4dart.dart';

class ProjParser {
  static Projection parse(String def) {
    print(def);
    var args = def.replaceAll('  ', ' ').split(' ');
    if (args == null) {
      return null;
    }
    var params = _createParameterMap(args);
    print(params);
    print('');

    return null;
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
