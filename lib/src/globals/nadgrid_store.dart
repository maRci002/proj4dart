import 'package:meta/meta.dart';
import 'package:proj4dart/src/classes/nadgrid.dart';

/// Global class for storing Nadgrids
class NadgridStore {
  final Map<String, Nadgird> _nadgridCache = {};

  bool get isEmpty => _nadgridCache.isEmpty;

  /// Clear Nadgird Cache only for testing purpose
  @visibleForTesting
  void clearNadgirdCache() {
    _nadgridCache.clear();
  }

  static final NadgridStore _nadgridStore = NadgridStore._internal();

  factory NadgridStore() {
    return _nadgridStore;
  }

  /// Private constructor
  NadgridStore._internal();

  /// Get Nadgird from the store
  Nadgird? get(String gridName) {
    return _nadgridCache[gridName];
  }

  /// Registers Nadgird to the store
  Nadgird register(String gridName, Nadgird nadgrid) {
    return _nadgridCache[gridName] = nadgrid;
  }
}
