import 'package:proj4dart/proj4dart.dart';

void main() {
  // ProjDefStore().register('EPSG:23700',
  //     '+proj=somerc +lat_0=47.14439372222222 +lon_0=19.04857177777778 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +towgs84=52.17,-71.82,-14.9,0,0,0,0 +units=m +no_defs');

  // var epsg23700 = Projection('EPSG:23700');
  // var epsg4326 = Projection('EPSG:4326');
  // var epsg3857 = Projection('EPSG:3857');

  // var pointEpsg23700 = Point.fromArray([649706.59, 241212.75]);
  // var point = epsg23700.transform(epsg4326, pointEpsg23700);
  // var point2 = epsg23700.transform(epsg3857, pointEpsg23700);
  // var point3 = epsg4326.transform(epsg23700, point);
  // var point4 = epsg3857.transform(epsg23700, point2);

  // print('EPSG:23700: $pointEpsg23700');
  // print('EPSG:23700 -> EPSG:4326: $point');
  // print('EPSG:23700 -> EPSG:3857: $point2');
  // print('EPSG:23700 -> EPSG:4326 -> EPSG:23700: $point3');
  // print('EPSG:23700 -> EPSG:3857 -> EPSG:23700: $point4');

  var pointSrc = Point(x: 19.043548857256127, y: 47.51484887728807);
  var code = 'EPSG:3995';
  ProjDefStore().register(code, '+proj=geocent +datum=WGS84 +units=m +no_defs');

  var projSrc = Projection('EPSG:4326');
  var projDst = Projection(code);

  var pointDst = projSrc.transform(projDst, pointSrc);
  print(pointDst);
  print(projDst.transform(projSrc, pointDst));
}
