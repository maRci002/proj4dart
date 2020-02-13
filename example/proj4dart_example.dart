import 'package:proj4dart/proj4dart.dart';
import 'package:proj4dart/src/projections/epsg23700.dart';
import 'package:proj4dart/src/projections/epsg4326.dart';

import 'dart:convert';

void main() {
  var epsg23700Proj = Projection.fromJson(json.decode(epsg23700JSON));
  var epsg4326Proj = Projection.fromJson(json.decode(epsg4326JSON));

  var point = epsg23700Proj.transform(
      epsg4326Proj, Point.fromArray([561651.8404032991, 172658.61999188608]));
  print(point.toString());

  var point2 = epsg4326Proj.transform(
      epsg23700Proj, Point.fromArray([17.888058560281515, 46.89226406700879]));

  print(point2.toString());
}
