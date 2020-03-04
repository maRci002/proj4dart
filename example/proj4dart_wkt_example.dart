import 'package:proj4dart/proj4dart.dart';

void main() {
  var pointSrc = Point(x: 17.888058560281515, y: 46.89226406700879);

  // Use built-in projection
  var epsgSrc = 'EPSG:4326';
  var projSrc = Projection(epsgSrc);

  // Define custom projection
  var epsgDst = 'EPSG:3857';
  var epsgDestDef =
      'PROJCS["HD72 / EOV",GEOGCS["HD72",DATUM["Hungarian_Datum_1972",SPHEROID["GRS 1967",6378160,298.247167427,AUTHORITY["EPSG","7036"]],TOWGS84[52.17,-71.82,-14.9,0,0,0,0],AUTHORITY["EPSG","6237"]],PRIMEM["Greenwich",0,AUTHORITY["EPSG","8901"]],UNIT["degree",0.0174532925199433,AUTHORITY["EPSG","9122"]],AUTHORITY["EPSG","4237"]],PROJECTION["Hotine_Oblique_Mercator_Azimuth_Center"],PARAMETER["latitude_of_center",47.14439372222222],PARAMETER["longitude_of_center",19.04857177777778],PARAMETER["azimuth",90],PARAMETER["rectified_grid_angle",90],PARAMETER["scale_factor",0.99993],PARAMETER["false_easting",650000],PARAMETER["false_northing",200000],UNIT["metre",1,AUTHORITY["EPSG","9001"]],AXIS["Y",EAST],AXIS["X",NORTH],AUTHORITY["EPSG","23700"]]';
  var projDst = Projection.add(epsgDst, epsgDestDef);

  // Forward transform (lonlat -> projected crs)
  var pointForward = projSrc.transform(projDst, pointSrc);
  print(
      'FORWARD: Transform point [${pointSrc.x}, ${pointSrc.y}] from $epsgSrc to $epsgDst: [${pointForward.x}, ${pointForward.y}]');
  // FORWARD: Transform point [17.888058560281515, 46.89226406700879] from EPSG:4326 to EPSG:23700: [561651.8408065987, 172658.61998377228]

  // // Inverse transform (projected crs -> lonlat)
  // var pointInverse = projDst.transform(projSrc, pointForward);
  // print(
  //     'INVERSE: Transform point [${pointForward.x}, ${pointForward.y}] from $epsgDst to $epsgSrc: [${pointInverse.x}, ${pointInverse.y}]');
  // // INVERSE: Transform point [561651.8408065987, 172658.61998377228] from EPSG:23700 to EPSG:4326: [17.888058565574845, 46.89226406698969]
}
