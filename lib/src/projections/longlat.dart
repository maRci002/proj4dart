import 'package:proj4dart/src/point.dart';
import 'package:proj4dart/src/projection.dart';

class LongLat extends Projection {
  @override
  final List<String> names = ['longlat', 'identity'];

  final String datumCode;
  final String datumName;

  LongLat.init(Map<String, dynamic> map)
      : datumCode = map['datumCode'],
        datumName = map['datumName'],
        super.init(map);

  @override
  Point forward(Point p) {
    return p;
  }

  @override
  Point inverse(Point p) {
    return p;
  }
}
