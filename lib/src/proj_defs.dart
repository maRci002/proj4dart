// import 'dart:convert';
import 'package:proj4dart/proj4dart.dart';

// import 'package:proj4dart/src/projections/epsg23700.dart';
// import 'package:proj4dart/src/projections/epsg4326.dart';
// import 'package:proj4dart/src/projections/longlat.dart';
// import 'package:proj4dart/src/projections/somerc.dart';

// Global class for storing predefined and user-defined Projection definitions
class ProjDefs {
  // Cached projections
  final Map<String, ProjParams> _defs = {
    // 'EPSG:4326': LongLat.init(json.decode(epsg4326JSON)),
    // 'EPSG:23700':
    //     SwissObliqueMercatorProjection.init(json.decode(epsg23700JSON)),
    'EPSG:4326': ProjParams('+proj=longlat +datum=WGS84 +no_defs'),
    'EPSG:3857': ProjParams(
        '+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext  +no_defs')
  };

  static final ProjDefs _projDefs = ProjDefs._internal();

  factory ProjDefs() {
    return _projDefs;
  }

  ProjDefs._internal();

  ProjParams register(String name, String def) {
    if (def[0] != '+') {
      throw Exception('WKT parser not yet implemented');
    }
    var defObj = ProjParams(def);
    _defs[name] = defObj;
    return _defs[name];
  }

  // Return a cached projection by its name
  ProjParams get(String name) {
    var def = _defs[name];
    if (def == null) {
      throw Exception('Projection not yet defined');
    }
    return def;
  }
}
