import 'package:proj4dart/src/point.dart';

class Projection {
  double x0;
  double y0;
  double lat0;
  double long0;
  double es0;
  double b;
  double a;
  double e;
  double lat_ts;
  double k0;
  double es;
  var sphere;
  double k;

  void init() {}

  Point forward(Point p) {
    return p;
  }

  void inverse(Point p) {}
}
