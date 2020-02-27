# PROJ4DART

> Proj4dart is a Dart library to transform point coordinates from one coordinate system to another, including datum transformations (Dart version of [proj4js/proj4js](https://github.com/proj4js/proj4js)).

## Installing

Add proj4dart to `pubspec.yml` (dependencies section), then run `pub get` to download the new dependencies.

```yml
dependencies:
  proj4dart: latest
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

If you wish to use one of the predefined ones the signature is:

```dart
  var projection = Projection('EPSG:4326');
```

### User-defined Projection

If you wish to define your own projection you can create it with a valid Proj4 string (here for [EPSG:23700](http://epsg.io/23700)):

```dart
+proj=somerc +lat_0=47.14439372222222 +lon_0=19.04857177777778 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +towgs84=52.17,-71.82,-14.9,0,0,0,0 +units=m +no_defs
```

The signature is:

```dart
var projection = Projection.add('EPSG:23700',
      '+proj=somerc +lat_0=47.14439372222222 +lon_0=19.04857177777778 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +towgs84=52.17,-71.82,-14.9,0,0,0,0 +units=m +no_defs');
```

At the moment proj4dart cannot consume WKT definitions (which is on the roadmap though).

### Transform between Projections

```dart
import 'package:proj4dart/proj4dart.dart';

void main() {
  // Define Point
  var pointSrc = Point(x: 17.888058560281515, y: 46.89226406700879);

  // Use built-in projection
  var epsgSrc = 'EPSG:4326';
  var projSrc = Projection(epsgSrc);

  // Define custom projection
  var epsgDst = 'EPSG:23700';
  var projDst = Projection.add(epsgDst,
      '+proj=somerc +lat_0=47.14439372222222 +lon_0=19.04857177777778 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +towgs84=52.17,-71.82,-14.9,0,0,0,0 +units=m +no_defs');

  // Forward transform (lonlat -> projected crs)
  var pointForward = projSrc.transform(projDst, pointSrc);
  print(
      'FORWARD: Transform point [${pointSrc.x}, ${pointSrc.y}] from $epsgSrc to $epsgDst: [${pointForward.x}, ${pointForward.y}]');
  // FORWARD: Transform point [17.888058560281515, 46.89226406700879] from EPSG:4326 to EPSG:23700: [561651.8408065987, 172658.61998377228]

  // Inverse transform (projected crs -> lonlat)
  var pointInverse = projDst.transform(projSrc, pointForward);
  print(
      'INVERSE: Transform point [${pointForward.x}, ${pointForward.y}] from $epsgDst to $epsgSrc: [${pointInverse.x}, ${pointInverse.y}]');
  // INVERSE: Transform point [561651.8408065987, 172658.61998377228] from EPSG:23700 to EPSG:4326: [17.888058565574845, 46.89226406698969]
}

```

## Accuracy

Proj4dart was tested with almost 4000 different Proj4 definitions. Forward and inverse transformations were both performed and checked in each case. All the tested Proj4 definitions can be found in [all_proj4_defs.dart](test/data/all_proj4_defs.dart). The expected forward and inverse results were pre-calculated using proj4js ([all_proj_tests.dart](test/data/all_proj4_tests.dart)).

Acceptance criteria was:

- precision delta of 0.000001 in case of LonLat
- precision delta of 0.00001 in case of projected CRS.

Example (using [EPSG:4326](http://epsg.io/4326.proj4) point of `[17.888058560281515, 46.89226406700879]` and transformed to [EPSG:23700](http://epsg.io/23700.proj4)):

| LIBRARY       | forward_x         | forward_y          | inverse_x           | inverse_y         |
| :------------ | :---------------- | :----------------- | :------------------ | :---------------- |
| **proj4js**   | 561651.8408065989 | 172658.61998377228 | 17.888058565574852  | 46.89226406698969 |
| **proj4dart** | 561651.8408065987 | 172658.61998377228 | 17.888058565574845  | 46.89226406698969 |
| *delta*       | *0.0000000002*    | *0.0*              | *0.000000000000007* | *0.0*             |

In some cases also manual PostGIS testing (PostgreSQL 12.1, PostGIS 3.0.0 r17983) was performed such as the following (using [EPSG:4326](http://epsg.io/4326.proj4) point of `[17.888058560281515, 46.89226406700879]` and transformed to [EPSG:23700](http://epsg.io/23700.proj4)):

```sql
SELECT
  ST_X(
    ST_Transform(
      ST_GeomFromText('POINT(17.888058560281515 46.89226406700879)', 4326),
      23700
    )
  ) AS forward_x,
  ST_Y(
    ST_Transform(
      ST_GeomFromText('POINT(17.888058560281515 46.89226406700879)', 4326),
      23700
    )
  ) AS forward_y,
  ST_X(
    ST_Transform(
      ST_Transform(
        ST_GeomFromText('POINT(17.888058560281515 46.89226406700879)', 4326),
        23700
      ),
      4326
    )
  ) AS inverse_x,
  ST_Y(
    ST_Transform(
      ST_Transform(
        ST_GeomFromText('POINT(17.888058560281515 46.89226406700879)', 4326),
        23700
      ),
      4326
    )
  ) AS inverse_y
;
```

which results compared to proj4dart results:

| LIBRARY       | forward_x         | forward_y          | inverse_x          | inverse_y          |
| :------------ | :---------------- | :----------------- | :----------------- | :----------------- |
| **PostGIS**   | 561651.8408065987 | 172658.6199837724  | 17.88805856557482  | 46.8922640683514   |
| **proj4dart** | 561651.8408065987 | 172658.61998377228 | 17.888058565574845 | 46.89226406698969  |
| *delta*       | *0.0*             | *0.00000000012*    | *0.0*              | *0.00000000136171* |

## Authors

Proj4dart was ported from proj4js by @maRci002 and [Gergely Padányi-Gulyás](https://twitter.com/fegyi001) (@fegyi001) at [Ulyssys Ltd](https://www.ulyssys.hu/index_en.html), Budapest, Hungary.
