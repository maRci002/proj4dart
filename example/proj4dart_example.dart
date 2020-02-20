// import 'package:proj4dart/proj4dart.dart';
import 'package:proj4dart/src/common/proj_string.dart';

void main() {
  // var epsg23700Proj = Projection('EPSG:23700');
  // var epsg4326Proj = Projection('EPSG:4326');

  // var point = epsg23700Proj.transform(
  //     epsg4326Proj, Point.fromArray([561651.8404032991, 172658.61999188608]));
  // print(point.toString());

  // var point2 = epsg4326Proj.transform(
  //     epsg23700Proj, Point.fromArray([17.888058560281515, 46.89226406700879]));
  // print(point2.toString());

  var epsg4326 = '+proj=longlat +datum=WGS84 +no_defs';
  var epsg3857 =
      '+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext  +no_defs';
  var epsg23700 =
      '+proj=somerc +lat_0=47.14439372222222 +lon_0=19.04857177777778 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +towgs84=52.17,-71.82,-14.9,0,0,0,0 +units=m +no_defs';

  var defEpsg4326 = ProjString(epsg4326);
  var defEpsg3857 = ProjString(epsg3857);
  var defEpsg23700 = ProjString(epsg23700);
  print('$defEpsg4326, $defEpsg3857, $defEpsg23700');
}
