import 'package:proj4dart/proj4dart.dart';
import 'package:proj4dart/src/proj_store.dart';

void main() {
  ProjStore().start();
  ProjDefStore().register('EPSG:23700',
      '+proj=somerc +lat_0=47.14439372222222 +lon_0=19.04857177777778 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +towgs84=52.17,-71.82,-14.9,0,0,0,0 +units=m +no_defs');

  var epsg23700 = Projection('EPSG:23700');
  var epsg4326 = Projection('EPSG:4326');
  var epsg3857 = Projection('EPSG:3857');

  var point =
      epsg23700.transform(epsg4326, Point.fromArray([649706.59, 241212.75]));

  print(point);

  var point2 =
      epsg23700.transform(epsg3857, Point.fromArray([649706.59, 241212.75]));

  print(point2);
}
