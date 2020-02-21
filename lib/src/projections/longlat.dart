import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';

class LongLat extends Projection {
  static final List<String> names = ['longlat', 'identity'];

  final String datumCode;
  final String datumName;

  LongLat.init(ProjParams params)
      : datumCode = params.datumCode,
        datumName = params.datumName,
        super.init(params);

  @override
  Point forward(Point p) {
    return p;
  }

  @override
  Point inverse(Point p) {
    return p;
  }
}
