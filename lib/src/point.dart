class Point {
  final double x;
  final double y;
  final double z;

  Point({this.x, this.y}) : z = null;

  Point.withZ({this.x, this.y, this.z});

  Point.fromArray(List<double> array)
      : x = array[0],
        y = array[1],
        z = array.length > 2 ? array[2] : null;

  @override
  String toString() {
    return '{ x: $x, y: $y, z: $z }';
  }
}
