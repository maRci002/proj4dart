import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/globals/defs.dart';

class ProjStore {
  final List<Projection> _projections = [];
  final _names = {};

  static final ProjStore _projStore = ProjStore._internal();

  factory ProjStore() {
    return _projStore;
  }

  ProjStore._internal();

  void add(List<String> names, Projection proj) {
    var length = _projections.length;
    if (names == null) {
      return;
    }
    _projections.add(proj);
    names.forEach((n) => _names[n.toLowerCase()] = length);
  }

  Projection getByName(String projName) {
    if (projName == null) {
      return null;
    }
    var n = projName.toLowerCase();
    if (_names[n] != null && _projections[_names[n]] != null) {
      return _projections[_names[n]];
    }
    return null;
  }

  Projection get(String epsg) {
    var params = ProjDefStore().get(epsg);
    if (params == null) {
      return null;
    }
    return getByName(params.proj);
  }

  void start() {
    ProjDefStore().names().forEach((n) {
      Projection.register(n, ProjDefStore().get(n));
    });
  }

  List<Projection> getProjections() {
    return _projections;
  }
}
