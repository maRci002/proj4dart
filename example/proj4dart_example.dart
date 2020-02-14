import 'package:proj4dart/proj4dart.dart';

void main() {
  var epsg23700Proj = Projection('EPSG:23700');
  var epsg4326Proj = Projection('EPSG:4326');

  var point = epsg23700Proj.transform(
      epsg4326Proj, Point.fromArray([561651.8404032991, 172658.61999188608]));
  print(point.toString());

  var point2 = epsg4326Proj.transform(
      epsg23700Proj, Point.fromArray([17.888058560281515, 46.89226406700879]));
  print(point2.toString());
}
