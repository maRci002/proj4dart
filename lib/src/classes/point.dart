import 'package:mgrs_dart/mgrs_dart.dart';

class Point {
  double x;
  double y;
  double? z;
  double? m; // utils.toPoint() uses m coordinate

  Point({required this.x, required this.y})
      : z = null,
        m = null;

  Point.withZ({required this.x, required this.y, this.z});

  Point.withM({required this.x, required this.y, this.z, this.m});

  Point.fromArray(List<double> array)
      : x = array[0],
        y = array[1],
        z = array.length > 2 ? array[2] : null,
        m = array.length > 3 ? array[3] : null;

  factory Point.fromString(String coordsString) {
    var coords = coordsString.split(',');
    var x = double.parse(coords[0]);
    var y = double.parse(coords[1]);
    var z = coords.length > 2 ? double.parse(coords[2]) : null;
    var m = coords.length > 3 ? double.parse(coords[3]) : null;

    return Point.withM(x: x, y: y, z: z, m: m);
  }

  factory Point.fromMGRS(String mgrsString) {
    var point = Mgrs.toPoint(mgrsString);
    var x = point[0];
    var y = point[1];
    var z = 0.0;
    var m = 0.0;

    return Point.withM(x: x, y: y, z: z, m: m);
  }

  String toMGRS(int accuracy) {
    return Mgrs.forward([x, y], accuracy);
  }

  List<double> toArray() {
    var res = <double>[x, y];
    if (z != null) {
      res.add(z!);

      if (m != null) {
        res.add(m!);
      }
    }
    return res;
  }

  Point.copy(Point p)
      : x = p.x,
        y = p.y,
        z = p.z,
        m = p.m;

  Point copyWith({double? x, double? y, double? z, double? m}) {
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
