import 'package:proj4dart/proj4dart.dart';
import 'package:proj4dart/src/proj_store.dart';
import 'package:proj4dart/src/projections/longlat.dart';
import 'package:proj4dart/src/projections/merc.dart';
import 'package:proj4dart/src/projections/somerc.dart';

void main() {
  var map = ProjDefStore().get('EPSG:3857').map;
  print(map);
  var projection = MercProjection.init(map);
  print(projection);

  ProjStore().start();

  print('ok');

  var epsg23700 = SwissObliqueMercatorProjection.init(ProjParams(
          '+proj=somerc +lat_0=47.14439372222222 +lon_0=19.04857177777778 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +towgs84=52.17,-71.82,-14.9,0,0,0,0 +units=m +no_defs')
      .map);

  var epsg4326 =
      LongLat.init(ProjParams('+proj=longlat +datum=WGS84 +no_defs').map);

  var point = epsg23700.transform(
      epsg4326, Point.fromArray([561651.8404032991, 172658.61999188608]));

  print(point);
}
