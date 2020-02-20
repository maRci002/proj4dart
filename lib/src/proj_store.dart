import 'package:proj4dart/proj4dart.dart';
import 'package:proj4dart/src/projection.dart';
import 'package:proj4dart/src/projections/longlat.dart';
import 'package:proj4dart/src/projections/merc.dart';

List<Projection> projs = [
  MercProjection.init(ProjDefStore().get('EPSG:3857').map),
  LongLat.init(ProjDefStore().get('EPSG:4326').map)
];

class ProjStore {
  final List<Projection> _projections = [];
  final _names = {};

  static final ProjStore _projStore = ProjStore._internal();

  factory ProjStore() {
    return _projStore;
  }

  ProjStore._internal();

  dynamic add(Projection proj, i) {
    var length = _projections.length;
    if (proj.names == null) {
      return true;
    }
    _projections[length] = proj;
    proj.names.forEach((n) => _names[n.toLowerCase()] = length);
  }

  Projection get(String name) {
    if (name == null) {
      return null;
    }
    var n = name.toLowerCase();
    if (_names[n] != null && _projections[_names[n]] != null) {
      return _projections[_names[n]];
    }
    return null;
  }

  void start() {
    projs.forEach((p) => _projections.add(p));
  }

  List<Projection> getProjections() {
    return _projections;
  }
}
