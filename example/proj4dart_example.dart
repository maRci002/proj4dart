import 'package:proj4dart/proj4dart.dart';

void main() {
  // var epsg23700Proj = Projection('EPSG:23700');
  // var epsg4326Proj = Projection('EPSG:4326');

  // var point = epsg23700Proj.transform(
  //     epsg4326Proj, Point.fromArray([561651.8404032991, 172658.61999188608]));
  // print(point.toString());

  // var point2 = epsg4326Proj.transform(
  //     epsg23700Proj, Point.fromArray([17.888058560281515, 46.89226406700879]));
  // print(point2.toString());

  var epsg23700 =
      '+proj=somerc +lat_0=47.14439372222222 +lon_0=19.04857177777778 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +towgs84=52.17,-71.82,-14.9,0,0,0,0 +units=m +no_defs';

  var projEpsg23700 = ProjDefs().register('EPSG:23700', epsg23700);
  print(projEpsg23700);

  var projEpsg3857 = ProjDefs().get('EPSG:3857');
  print(projEpsg3857);

  var projEpsg4326 = ProjDefs().get('EPSG:4326');
  print(projEpsg4326);
}
