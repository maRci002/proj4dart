import 'package:proj4dart/proj4dart.dart';
import 'package:wkt_parser/wkt_parser.dart';

void main() {
  var wkt =
      'PROJCS["HD72 / EOV",GEOGCS["HD72",DATUM["Hungarian_Datum_1972",SPHEROID["GRS 1967",6378160,298.247167427,AUTHORITY["EPSG","7036"]],TOWGS84[52.17,-71.82,-14.9,0,0,0,0],AUTHORITY["EPSG","6237"]],PRIMEM["Greenwich",0,AUTHORITY["EPSG","8901"]],UNIT["degree",0.0174532925199433,AUTHORITY["EPSG","9122"]],AUTHORITY["EPSG","4237"]],PROJECTION["Hotine_Oblique_Mercator_Azimuth_Center"],PARAMETER["latitude_of_center",47.14439372222222],PARAMETER["longitude_of_center",19.04857177777778],PARAMETER["azimuth",90],PARAMETER["rectified_grid_angle",90],PARAMETER["scale_factor",0.99993],PARAMETER["false_easting",650000],PARAMETER["false_northing",200000],UNIT["metre",1,AUTHORITY["EPSG","9001"]],AXIS["Y",EAST],AXIS["X",NORTH],AUTHORITY["EPSG","23700"]]';
  Projection.add('EPSG:23700', wkt);
}
