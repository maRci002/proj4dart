import 'package:mgrs_dart/mgrs_dart.dart';

class Point {
  double x;
  double y;
  double z;
  double m; // utils.toPoint() uses m coordinate

  Point({this.x, this.y})
      : z = null,
        m = null;

  Point.withZ({this.x, this.y, this.z});

  Point.withM({this.x, this.y, this.z, this.m});

  Point.fromArray(List<double> array)
      : x = array[0],
        y = array[1],
        z = array.length > 2 ? array[2] : null,
        m = array.length > 3 ? array[3] : null;

  Point.fromString(String coordsString) {
    var coords = coordsString.split(',');
    x = double.parse(coords[0]);
    y = double.parse(coords[1]);
    z = coords.length > 2 ? double.parse(coords[2]) : null;
    m = coords.length > 3 ? double.parse(coords[3]) : null;
  }

  Point.fromMGRS(String mgrsString) {
    var point = Mgrs.toPoint(mgrsString);
    x = point[0];
    y = point[1];
    z = 0;
    m = 0;
  }

  String toMGRS(int accuracy) {
    return Mgrs.forward([x, y], accuracy);
  }

  List<double> toArray() {
    var res = [x, y];
    if (z != null) {
      res.add(z);

      if (m != null) {
        res.add(m);
      }
    }
    return res;
  }

  Point.copy(Point p) {
    x = p.x;
    y = p.y;
    z = p.z;
    m = p.m;
  }

  Point copyWith({double x, double y, double z, double m}) {
    return Point.withM(
      x: x ?? this.x,
      y: y ?? this.y,
      z: z ?? this.z,
      m: m ?? this.m,
    );
  }

  @override
  String toString() {
    return '{ x: $x, y: $y, z: $z, m: $m }';
  }
}
