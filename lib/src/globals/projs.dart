import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/globals/defs.dart';

class ProjStore {
  final List<Projection> _projections = [];
  final _srsCodes = {};

  static final ProjStore _projStore = ProjStore._internal();

  factory ProjStore() {
    return _projStore;
  }

  ProjStore._internal();

  void add(Projection proj, String defCode) {
    var length = _projections.length;
    if (defCode == null) {
      return;
    }
    _projections.add(proj);
    _srsCodes[defCode] = length;
  }

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

  void start() {
    ProjDefStore().codes().forEach((n) {
      Projection.register(n, ProjDefStore().get(n));
    });
  }

  List<Projection> getProjections() {
    return _projections;
  }
}
