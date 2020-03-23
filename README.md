# PROJ4DART

> Proj4dart is a Dart library to transform point coordinates from one coordinate system to another, including datum transformations (Dart version of [proj4js/proj4js](https://github.com/proj4js/proj4js)).

## Installing

Add proj4dart to `pubspec.yml` (dependencies section), then run `pub get` to download the new dependencies.

```yml
dependencies:
  proj4dart: any # or the latest version on Pub
```

## Using

### Predefined Projection

There are 3 predefined Projections and 5 aliases by default:

- [EPSG:4326](http://epsg.io/4326), which has the following alias:
  - WGS84
- [EPSG:4269](http://epsg.io/4269)
- [EPSG:3857](http://epsg.io/3857), which has the following aliases:
  - EPSG:3785
  - GOOGLE
  - EPSG:900913
  - EPSG:102113

If you wish to use one of the predefined ones use `Named Projection` which has the following signature:

```dart
  var projection = Projection('EPSG:4326');
```

### User-defined Projection

Proj4dart supports `Proj4 definition strings`, `OGC WKT definitions` and `ESRI WKT definitions`. They can be obtained from [epsg.io](https://epsg.io).

#### With Proj4 string definition

If you wish to define your own projection you can create it with a valid Proj4 string (here for [EPSG:23700](http://epsg.io/23700)):

```dart
+proj=somerc +lat_0=47.14439372222222 +lon_0=19.04857177777778 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +towgs84=52.17,-71.82,-14.9,0,0,0,0 +units=m +no_defs
```

The signature is:

```dart
var def = '+proj=somerc +lat_0=47.14439372222222 +lon_0=19.04857177777778 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +towgs84=52.17,-71.82,-14.9,0,0,0,0 +units=m +no_defs';

// Named Projection signature, later find it from anywhere via Projection('EPSG:23700')
var namedProjection = Projection.add('EPSG:23700', def);
// Projection without name signature
var projection = Projection.parse(def);
```

For full example visit [example/proj4dart_example.dart](example/proj4dart_example.dart)

#### With OGC WKT definition

If you wish to define your own projection you can create it with a valid OGC WKT string (here for [EPSG:23700](http://epsg.io/23700)):

```dart
PROJCS["HD72 / EOV",GEOGCS["HD72",DATUM["Hungarian_Datum_1972",SPHEROID["GRS 1967",6378160,298.247167427,AUTHORITY["EPSG","7036"]],TOWGS84[52.17,-71.82,-14.9,0,0,0,0],AUTHORITY["EPSG","6237"]],PRIMEM["Greenwich",0,AUTHORITY["EPSG","8901"]],UNIT["degree",0.0174532925199433,AUTHORITY["EPSG","9122"]],AUTHORITY["EPSG","4237"]],PROJECTION["Hotine_Oblique_Mercator_Azimuth_Center"],PARAMETER["latitude_of_center",47.14439372222222],PARAMETER["longitude_of_center",19.04857177777778],PARAMETER["azimuth",90],PARAMETER["rectified_grid_angle",90],PARAMETER["scale_factor",0.99993],PARAMETER["false_easting",650000],PARAMETER["false_northing",200000],UNIT["metre",1,AUTHORITY["EPSG","9001"]],AXIS["Y",EAST],AXIS["X",NORTH],AUTHORITY["EPSG","23700"]]
```

The signature is:

```dart
var def = 'PROJCS["HD72 / EOV",GEOGCS["HD72",DATUM["Hungarian_Datum_1972",SPHEROID["GRS 1967",6378160,298.247167427,AUTHORITY["EPSG","7036"]],TOWGS84[52.17,-71.82,-14.9,0,0,0,0],AUTHORITY["EPSG","6237"]],PRIMEM["Greenwich",0,AUTHORITY["EPSG","8901"]],UNIT["degree",0.0174532925199433,AUTHORITY["EPSG","9122"]],AUTHORITY["EPSG","4237"]],PROJECTION["Hotine_Oblique_Mercator_Azimuth_Center"],PARAMETER["latitude_of_center",47.14439372222222],PARAMETER["longitude_of_center",19.04857177777778],PARAMETER["azimuth",90],PARAMETER["rectified_grid_angle",90],PARAMETER["scale_factor",0.99993],PARAMETER["false_easting",650000],PARAMETER["false_northing",200000],UNIT["metre",1,AUTHORITY["EPSG","9001"]],AXIS["Y",EAST],AXIS["X",NORTH],AUTHORITY["EPSG","23700"]]';

// Named Projection signature, later find it from anywhere via Projection('EPSG:23700')
var namedProjection = Projection.add('EPSG:23700', def);
// Projection without name signature
var projection = Projection.parse(def);
```

For full example visit [example/proj4dart_ogc_wkt_example.dart](example/proj4dart_ogc_wkt_example.dart)

#### With ESRI WKT definition

If you wish to define your own projection you can create it with a valid ESRI WKT string (here for [EPSG:23700](http://epsg.io/23700)):

```dart
PROJCS["HD72_EOV",GEOGCS["GCS_HD72",DATUM["D_Hungarian_1972",SPHEROID["GRS_1967",6378160,298.247167427]],PRIMEM["Greenwich",0],UNIT["Degree",0.017453292519943295]],PROJECTION["Hotine_Oblique_Mercator_Azimuth_Center"],PARAMETER["latitude_of_center",47.14439372222222],PARAMETER["longitude_of_center",19.04857177777778],PARAMETER["azimuth",90],PARAMETER["scale_factor",0.99993],PARAMETER["false_easting",650000],PARAMETER["false_northing",200000],UNIT["Meter",1]]
```

The signature is:

```dart
var def = 'PROJCS["HD72_EOV",GEOGCS["GCS_HD72",DATUM["D_Hungarian_1972",SPHEROID["GRS_1967",6378160,298.247167427]],PRIMEM["Greenwich",0],UNIT["Degree",0.017453292519943295]],PROJECTION["Hotine_Oblique_Mercator_Azimuth_Center"],PARAMETER["latitude_of_center",47.14439372222222],PARAMETER["longitude_of_center",19.04857177777778],PARAMETER["azimuth",90],PARAMETER["scale_factor",0.99993],PARAMETER["false_easting",650000],PARAMETER["false_northing",200000],UNIT["Meter",1]]');

// Named Projection signature, later find it from anywhere via Projection('EPSG:23700')
var namedProjection = Projection.add('EPSG:23700', def);
// Projection without name signature
var projection = Projection.parse(def);
```

For full example visit [example/proj4dart_esri_wkt_example.dart](example/proj4dart_esri_wkt_example.dart)

### Transform between Projections

```dart
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

```

### Transform between Projections using ProjectionTuple

```dart
import 'package:proj4dart/proj4dart.dart';

void main() {
  // Define Point
  var pointSrc = Point(x: 17.888058560281515, y: 46.89226406700879);

  // Define ProjectionTuple which makes vice versa conversions even easier
  var tuple = ProjectionTuple(
    // Use built-in projection
    fromProj: Projection('EPSG:4326'),
    // Define custom projection
    toProj: Projection.parse(
      '+proj=somerc +lat_0=47.14439372222222 +lon_0=19.04857177777778 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +towgs84=52.17,-71.82,-14.9,0,0,0,0 +units=m +no_defs',
    ),
  );

  // Forward transform (lonlat -> projected crs)
  var pointForward = tuple.forward(pointSrc);
  print(
      'FORWARD: Transform point ${pointSrc.toArray()} from EPSG:4326 to EPSG:23700: ${pointForward.toArray()}');
  // FORWARD: Transform point [17.888058560281515, 46.89226406700879] from EPSG:4326 to EPSG:23700: [561651.8408065987, 172658.61998377228]

  // Inverse transform (projected crs -> lonlat)
  var pointInverse = tuple.inverse(pointForward);
  print(
      'INVERSE: Transform point ${pointForward.toArray()} from EPSG:23700 to EPSG:4326: ${pointInverse.toArray()}');
  // INVERSE: Transform point [561651.8408065987, 172658.61998377228] from EPSG:23700 to EPSG:4326: [17.888058565574845, 46.89226406698969]
}

```

## Accuracy

Proj4dart was tested with

- **8444** Proj4 definitions ([test/data/all_proj4_defs.dart](test/data/all_proj4_defs.dart#L65))
- **5642** OGC WKT definitions ([test/data/all_proj4_ogc_wkt_defs.dart](test/data/all_proj4_ogc_wkt_defs.dart#L1029))
- **7426** ESRI WKT definitions ([test/data/all_proj4_esri_wkt_defs.dart](test/data/all_proj4_esri_wkt_defs.dart#L1083))

Forward and inverse transformations were both performed and checked in each case. The expected forward and inverse results were pre-calculated using proj4js ([test/results/all_proj4_results.dart](test/results/all_proj4_results.dart), [test/results/all_proj4_ogc_wkt_results.dart](test/results/all_proj4_ogc_wkt_results.dart), [test/results/all_proj4_esri_wkt_results.dart](test/results/all_proj4_esri_wkt_results.dart)).

The following table shows the avarage deltas of different Projections (using [EPSG:4326](http://epsg.io/4326.proj4) point of `[17.888058560281515, 46.89226406700879]` and transformed to [Custom CRS defined with Proj4 definition string](test/data/all_proj4_defs.dart#L65) which gave the `forward result` then transformed back the received forward result which gave the `inverse result`):

| Projection                                   | No. tests | avg delta forward_x      | avg delta forward_y      | avg delta inverse_x       | avg delta inverse_y       |
|:---------------------------------------------|:----------|:-------------------------|:-------------------------|:--------------------------|:--------------------------|
| **Albers Projection**                        | 58        | *2.8260822953849e-9*     | *1.6378431484617036e-9*  | *1.0719394720518753e-14*  | *1.0903155772870503e-14*  |
| **Azimuthal Equidistant Projection**         | 12        | *7.761021455128987e-11*  | *1.5522042910257974e-10* | *1.7763568394002505e-15*  | *1.1842378929335002e-15*  |
| **Cassini Projection**                       | 33        | *3.9510654680656665e-10* | *3.3866275440562856e-10* | *3.2297397080004555e-16*  | *0.0*                     |
| **Central Cylindrical Projection**           | 5         | *0.0*                    | *0.0*                    | *0.0*                     | *0.0*                     |
| **Equidistant Conic Projection**             | 9         | *1.2935035758548312e-11* | *0.0*                    | *1.578983857244667e-15*   | *0.0*                     |
| **Equidistant Cylindrical Projection**       | 25        | *0.0*                    | *0.0*                    | *0.0*                     | *0.0*                     |
| **Geocentric Projection**                    | 196       | *0.0*                    | *0.0*                    | *9.06304509898087e-17*    | *0.0*                     |
| **Gnomic Projection**                        | 2         | *0.0*                    | *0.0*                    | *3.552713678800501e-15*   | *0.0*                     |
| **Hotine Oblique Mercator Projection**       | 51        | *4.460304683330012e-9*   | *8.017819959158991e-9*   | *6.339155779820502e-15*   | *3.901018941428001e-15*   |
| **Krovak Projection**                        | 9         | *9.054525030983819e-10*  | *1.448724004957411e-9*   | *1.578983857244667e-15*   | *3.157967714489334e-15*   |
| **Lambert Azimuthal Equal-Area Projection**  | 20        | *5.820766091346741e-11*  | *0.0*                    | *5.329070518200751e-16*   | *0.0*                     |
| **Lambert Conformal Conic Projection**       | 2028      | *1.8960008225716005e-8*  | *1.2588414830372427e-8*  | *4.613097105712702e-14*   | *8.064379757884726e-14*   |
| **LongLat**                                  | 1152      | *1.6961740653995446e-16* | *0.0*                    | *2.312964634635743e-16*   | *2.7755575615628914e-16*  |
| **Miller Cylindrical Projection**            | 2         | *0.0*                    | *0.0*                    | *0.0*                     | *0.0*                     |
| **Mollweide Projection**                     | 2         | *0.0*                    | *0.0*                    | *0.0*                     | *0.0*                     |
| **New Zealand Map Grid Projection**          | 1         | *0.0*                    | *0.0*                    | *0.000003294908452744494* | *0.000008533214440831216* |
| **Orthographic Projection**                  | 2         | *0.0*                    | *0.0*                    | *7.105427357601002e-15*   | *3.552713678800501e-15*   |
| **Polyconic Projection**                     | 10        | *0.0*                    | *0.0*                    | *1.1842378929335002e-15*  | *0.0*                     |
| **Pseudo Mercator Projection**               | 25        | *0.0*                    | *3.7252902984619143e-10* | *1.4210854715202004e-16*  | *2.842170943040401e-16*   |
| **Robinson Projection**                      | 2         | *0.0*                    | *0.0*                    | *0.0*                     | *0.0*                     |
| **Sinusoidal Projection**                    | 3         | *0.0*                    | *0.0*                    | *0.0*                     | *0.0*                     |
| **Stereographic North Projection**           | 21        | *2.217434701465425e-11*  | *2.993536846978324e-10*  | *4.906128413581644e-15*   | *1.3534147347811431e-15*  |
| **Stereographic South Projection**           | 44        | *2.43414258446509e-10*   | *2.063731004268861e-10*  | *1.3726393759001935e-15*  | *0.0*                     |
| **Swiss Oblique Mercator Projection**        | 5         | *4.656612873077393e-11*  | *0.0*                    | *1.4210854715202005e-15*  | *0.0*                     |
| **Transverse Mercator Projection**           | 3445      | *7.527289676908484e-12*  | *5.01819311793899e-12*   | *3.966550829771659e-13*   | *3.0942861377693824e-13*  |
| **Universal Transverse Mercator Projection** | 1279      | *3.4847229055075836e-10* | *3.429655454604303e-10*  | *3.4304936617033767e-15*  | *2.4999548951684524e-15*  |
| **Van der Grinten Projection**               | 2         | *3.3760443329811096e-9*  | *2.3283064365386963e-9*  | *0.0*                     | *0.0*                     |

Example (using [EPSG:4326](http://epsg.io/4326.proj4) point of `[17.888058560281515, 46.89226406700879]` and transformed to [EPSG:23700](http://epsg.io/23700.proj4) defined with Proj4 definition string):

| LIBRARY       | forward_x         | forward_y          | inverse_x           | inverse_y         |
|:--------------|:------------------|:-------------------|:--------------------|:------------------|
| **proj4dart** | 561651.8408065987 | 172658.61998377228 | 17.888058565574845  | 46.89226406698969 |
| **proj4js**   | 561651.8408065989 | 172658.61998377228 | 17.888058565574852  | 46.89226406698969 |
| *delta*       | *0.0000000002*    | *0.0*              | *0.000000000000007* | *0.0*             |

In some cases also manual PostGIS testing (PostgreSQL 12.1, PostGIS 3.0.0 r17983) was performed such as the following (using [EPSG:4326](http://epsg.io/4326.proj4) point of `[17.888058560281515, 46.89226406700879]` and transformed to [EPSG:23700](http://epsg.io/23700.proj4) defined with Proj4 definition string):

| LIBRARY       | forward_x         | forward_y          | inverse_x           | inverse_y          |
|:--------------|:------------------|:-------------------|:--------------------|:-------------------|
| **proj4dart** | 561651.8408065987 | 172658.61998377228 | 17.888058565574845  | 46.89226406698969  |
| **PostGIS**   | 561651.8408065987 | 172658.6199837724  | 17.88805856557482   | 46.8922640683514   |
| *delta*       | *0.0*             | *0.00000000012*    | *0.000000000000025* | *0.00000000136171* |

## Used by

- Proj4dart is currently the default projection handler of [flutter_map](https://github.com/johnpryan/flutter_map).

## Authors

Proj4dart was ported from proj4js by @maRci002 and [Gergely Padányi-Gulyás (@fegyi001)](https://twitter.com/fegyi001) at [Ulyssys Ltd](https://www.ulyssys.hu/index_en.html), Budapest, Hungary.
