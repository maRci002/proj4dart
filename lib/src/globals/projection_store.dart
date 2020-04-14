import 'package:meta/meta.dart';
import 'package:proj4dart/src/classes/projection.dart';

/// Global class for storing predefined and user-defined Projections
class ProjectionStore {
  // WGS84 Projection which is not overrideable
  final Projection WGS84;

  // EPSG:3857 Projection which is not overrideable
  final Projection GOOGLE;

  // Key: Cordinate System / Country / Code / !Any alias!
  // Value: Projection
  final Map<String, Projection> _projectionCache;

  bool get isEmpty => _projectionCache.isEmpty;

  /// Clear Projection Cache only for testing purpose
  @visibleForTesting
  void clearProjectionCache() {
    _projectionCache.clear();
  }

  static final ProjectionStore _projStore = ProjectionStore._internal();

  factory ProjectionStore() {
    return _projStore;
  }

  /// Private constructor
  ProjectionStore._internalInitializer(
      {Projection wgs84, Projection nad83, Projection google})
      : WGS84 = wgs84,
        GOOGLE = google,
        _projectionCache = {} {
    register('WGS84', wgs84);
    register('EPSG:4326', wgs84);
    register('EPSG:4269', nad83);
    register('EPSG:3857', google);
    register('EPSG:3785', google);
    register('GOOGLE', google);
    register('EPSG:900913', google);
    register('EPSG:102113', google);
  }

  /// Private helper constructor
  ProjectionStore._internal()
      : this._internalInitializer(
            wgs84: Projection.parse('+proj=longlat +datum=WGS84 +no_defs'),
            nad83: Projection.parse(
                '+title=NAD83 (long/lat) +proj=longlat +a=6378137.0 +b=6356752.31414036 +ellps=GRS80 +datum=NAD83 +units=degrees'),
            google: Projection.parse(
              '+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext +no_defs',
            ));

  /// Get Projection from the store
  Projection get(String srsCode) {
    return _projectionCache[srsCode];
  }

  /// Registers Projection to the store
  Projection register(String code, Projection projection) {
    if (_projectionCache.containsKey(code)) {
      print(
          'Warning a Projection was already registered with the following name: $code, it will be overridden');
    }

    return _projectionCache[code] = projection;
  }
}
