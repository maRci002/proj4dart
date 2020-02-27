import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/globals/defs.dart';

/// Global class for storing predefined and user-defined Projections
class ProjStore {
  // Projection array
  final List<Projection> _projections = [];
  // Proj4 definitions, where the key is a proj4 definition and value is the index of the adjacent projection in the _projections array
  final Map<String, int> _srsCodes = {};

  bool get isEmpty => _projections.isEmpty;

  static final ProjStore _projStore = ProjStore._internal();

  factory ProjStore() {
    return _projStore;
  }

  ProjStore._internal();

  /// Initialize the store
  void start() {
    ProjDefStore().codes.forEach((n) {
      Projection.register(n, ProjDefStore().get(n));
    });
  }

  /// Add projection to the store
  void add(Projection proj, String defCode) {
    var length = _projections.length;
    if (defCode == null) {
      return;
    }
    _projections.add(proj);
    _srsCodes[defCode] = length;
  }

  /// Get projection from the store
  Projection get(String srsCode) {
    if (srsCode == null) {
      return null;
    }
    if (_srsCodes[srsCode] != null &&
        _projections[_srsCodes[srsCode]] != null) {
      return _projections[_srsCodes[srsCode]];
    }
    return null;
  }
}
