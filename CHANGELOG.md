# Changelog

## 1.0.5

- If WKT is Mercator projection then internal EPSG:3857 will be used
- If WKT definition contains an encapsulated proj4 string definition then it will be used

## 1.0.4

- Named Projection returns null instead of throwing Exception if Projection not found by name
- Some tests precalculate worst closeTos because these may depend on Dart version / OS

## 1.0.3

- add meta.dart to pubspec.yaml (avoid pub warning)

## 1.0.2

- Support ProjectionTuple
- Support Projection.parse
- Add more definitions
- Add more tests
  - support exception compare
  - use blacklist when necessary
  - make closeTo even strict
- Update wkt-parser-dart
- fix axis order in some cases

## 1.0.1

- Support OGC WKT definitions
- Support ESRI WKT definitions
- Simplify globals logic

## 1.0.0

- Initial version
- Can use 3 predefined projections + 5 aliases
- Can create and use any custom projections with Proj4 string
- Forward and inverse transformation between projections
- Tested with ~4000 existing projections (from epsg.io)
