import 'dart:convert';

import 'package:proj4dart/proj4dart.dart';
import 'package:proj4dart/src/projections/epsg23700.dart';
import 'package:proj4dart/src/projections/epsg4326.dart';
import 'package:test/test.dart';

void main() {
  group('epsg23700 <--> epsg4326', () {
    var epsg23700Proj;
    var epsg4326Proj;

    setUp(() {
      epsg23700Proj = Projection.fromJson(json.decode(epsg23700JSON));
      epsg4326Proj = Projection.fromJson(json.decode(epsg4326JSON));
    });

    test('EPSG:23700 to EPSG:4326', () {
      var point = epsg23700Proj.transform(epsg4326Proj,
          Point.fromArray([561651.8404032991, 172658.61999188608]));

      print(point.toString());
      expect(
          point.toString(),
          Point(
            x: 17.888058560281515,
            y: 46.89226406700879,
          ).toString());
    });

    test('EPSG:4326 to EPSG:23700', () {
      var point = epsg4326Proj.transform(epsg23700Proj,
          Point.fromArray([17.888058560281515, 46.89226406700879]));

      print(point.toString());
      expect(
          point.toString(),
          Point(
            x: 561651.8408065987,
            y: 172658.61998377228,
          ).toString());
    });
  });
}
