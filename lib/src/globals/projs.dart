import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/constants/initializers.dart';

/// Global class for storing predefined and user-defined Projections
class ProjStore {
  // Key: Cordinate System / Country / Code / !Any alias!
  // Value: Projection
  final Map<String, Projection> _projectionCache = {};

  bool get isEmpty => _projectionCache.isEmpty;

  static final ProjStore _projStore = ProjStore._internal();

  factory ProjStore() {
    return _projStore;
  }

  /// Private constructor
  ProjStore._internal() {
    var wgs84 = ProjParams('+proj=longlat +datum=WGS84 +no_defs');
    var nad83 = ProjParams(
        '+title=NAD83 (long/lat) +proj=longlat +a=6378137.0 +b=6356752.31414036 +ellps=GRS80 +datum=NAD83 +units=degrees');
    var google = ProjParams(
        '+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext +no_defs');

    register('WGS84', wgs84);
    register('EPSG:4326', wgs84);
    register('EPSG:4269', nad83);
    register('EPSG:3857', google);
    register('EPSG:3785', google);
    register('GOOGLE', google);
    register('EPSG:900913', google);
    register('EPSG:102113', google);
  }

  /// Get projection from the store
  Projection get(String srsCode) {
    return _projectionCache[srsCode];
  }

  /// Register a projection to the store
  Projection register(String code, ProjParams params) {
    var projName = params.proj;
    var initializer = initializers[projName];

    if (initializer == null) {
      throw Exception(
          'Projection initializer not found by projname: $projName');
    }

    return _projectionCache[code] = initializer(params);
  }
}
