# PROJ4DART

> Proj4dart is a Dart library to transform point coordinates from one coordinate system to another, including datum transformations (Dart version of [proj4js/proj4js](https://github.com/proj4js/proj4js)).

Tested with almost 4000 different Proj4 definitions with a precision delta of 0.000001 in case of LonLat and 0.00001 in case of projected CRS. Forward and inverse transformations were both performed and checked in each case.

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
      '+proj=somerc +lat_0=47.14439372222222 +lon_0=19.04857177777778 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +towgs84=52.17,-71.82,-14.9,0,0,0,0 +units=m +no_defs ');

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
