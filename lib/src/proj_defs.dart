import 'package:proj4dart/proj4dart.dart';

// Global class for storing predefined and user-defined Projection definitions
class ProjDefStore {
  static final _wgs84 = '+proj=longlat +datum=WGS84 +no_defs';
  // static final _nad83 =
  //     '+title=NAD83 (long/lat) +proj=longlat +a=6378137.0 +b=6356752.31414036 +ellps=GRS80 +datum=NAD83 +units=degrees';
  static final _google =
      '+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext +no_defs';

  // Cached projections
  final Map<String, ProjParams> _defs = {
    'EPSG:4326': ProjParams(_wgs84),
    // 'EPSG:4269': ProjParams(_nad83),
    'EPSG:3857': ProjParams(_google),
    // 'WGS84': ProjParams(_wgs84),
    // 'EPSG:3785': ProjParams(_google),
    // 'GOOGLE': ProjParams(_google),
    // 'EPSG:900913': ProjParams(_google),
    // 'EPSG:102113': ProjParams(_google)
  };

  static final ProjDefStore _projDefs = ProjDefStore._internal();

  factory ProjDefStore() {
    return _projDefs;
  }

  ProjDefStore._internal();

  ProjParams register(String name, String def) {
    if (def[0] != '+') {
      throw Exception('WKT parser not yet implemented');
    }
    var defObj = ProjParams(def);
    _defs[name] = defObj;
    return _defs[name];
  }

  // Return a cached proj parameter object by its name
  ProjParams get(String name) {
    var def = _defs[name];
    if (def == null) {
      throw Exception('Projection not yet defined');
    }
    return def;
  }

  List<String> names() {
    List<String> names = [];
    _defs.forEach((key, value) => names.add(key));
    return names;
  }
}