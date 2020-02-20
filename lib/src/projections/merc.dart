import 'package:proj4dart/src/common/utils.dart' as utils;
import 'package:proj4dart/src/point.dart';

import 'package:proj4dart/src/projection.dart';

class MercProjection extends Projection {
  @override
  final List<String> names = ['merc'];

  double x0;
  double y0;
  double lat_ts;
  double sphere;

  MercProjection.init(Map<String, dynamic> map)
      :
        // var con = map['b']/map['a']
        super.init(map);

  @override
  Point forward(Point p) {
    throw UnimplementedError();
  }

  @override
  Point inverse(Point p) {
    throw UnimplementedError();
  }
}
