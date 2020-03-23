import 'package:proj4dart/proj4dart.dart';

void main() {
  // Define Point
  var pointSrc = Point(x: 17.888058560281515, y: 46.89226406700879);

  // Use built-in projection
  var projSrc = Projection('EPSG:4326');

  // Find Projection by name or define it if not exists
  var projDst = Projection('EPSG:23700') ??
      Projection.add(
        'EPSG:23700',
        '+proj=somerc +lat_0=47.14439372222222 +lon_0=19.04857177777778 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +towgs84=52.17,-71.82,-14.9,0,0,0,0 +units=m +no_defs',
      );

  // Forward transform (lonlat -> projected crs)
  var pointForward = projSrc.transform(projDst, pointSrc);
  print(
      'FORWARD: Transform point ${pointSrc.toArray()} from EPSG:4326 to EPSG:23700: ${pointForward.toArray()}');
  // FORWARD: Transform point [17.888058560281515, 46.89226406700879] from EPSG:4326 to EPSG:23700: [561651.8408065987, 172658.61998377228]

  // Inverse transform (projected crs -> lonlat)
  var pointInverse = projDst.transform(projSrc, pointForward);
  print(
      'INVERSE: Transform point ${pointForward.toArray()} from EPSG:23700 to EPSG:4326: ${pointInverse.toArray()}');
  // INVERSE: Transform point [561651.8408065987, 172658.61998377228] from EPSG:23700 to EPSG:4326: [17.888058565574845, 46.89226406698969]
}
