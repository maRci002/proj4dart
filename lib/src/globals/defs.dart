import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:wkt_parser/wkt_parser.dart';

/// Global class for storing predefined and user-defined Projection definitions
class ProjDefStore {
  static final _wgs84 = '+proj=longlat +datum=WGS84 +no_defs';
  static final _nad83 =
      '+title=NAD83 (long/lat) +proj=longlat +a=6378137.0 +b=6356752.31414036 +ellps=GRS80 +datum=NAD83 +units=degrees';
  static final _google =
      '+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext +no_defs';

  List<String> get codes => _defs.keys.toList();

  // Cached projections
  final Map<String, ProjParams> _defs = {
    'EPSG:4326': ProjParams(_wgs84),
    'EPSG:4269': ProjParams(_nad83),
    'EPSG:3857': ProjParams(_google),
    'WGS84': ProjParams(_wgs84),
    'EPSG:3785': ProjParams(_google),
    'GOOGLE': ProjParams(_google),
    'EPSG:900913': ProjParams(_google),
    'EPSG:102113': ProjParams(_google)
  };

  static final ProjDefStore _projDefs = ProjDefStore._internal();

  factory ProjDefStore() {
    return _projDefs;
  }

  ProjDefStore._internal();

  /// Add new param to store
  ProjParams register(String name, String def) {
    if (def[0] == '+') {
      var defObj = ProjParams(def);
      _defs[name] = defObj;
      return _defs[name];
    } else {
      throw Exception('WKT parser not yet implemented');
      // var wkt = WKT.parse(def);
      // print(wkt);
    }
  }

  // Return param from store
  ProjParams get(String code) {
    var def = _defs[code];
    if (def == null) {
      throw Exception('Projection not yet defined');
    }
    return def;
  }
}
