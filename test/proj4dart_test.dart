import 'package:proj4dart/proj4dart.dart';
import 'package:proj4dart/src/projections/merc.dart';
import 'package:proj4dart/src/projections/utm.dart';
import 'package:test/test.dart';

import './classes/project_and_unproject_result.dart';
import './data/all_proj4_defs.dart' as all_proj4_defs;
import './data/all_proj4_ogc_wkt_defs.dart' as all_proj4_ogc_defs;
import './data/all_proj4_esri_wkt_defs.dart' as all_proj4_esri_defs;
import './results/all_proj4_results.dart' as all_proj4_results;
import './results/all_proj4_ogc_wkt_results.dart' as all_proj4_ogc_results;
import './results/all_proj4_esri_wkt_results.dart' as all_proj4_esri_results;

void main() {
  group('Bulk tests', () {
    test('Create all projections via proj4 def strings and find all of them',
        () {
      all_proj4_defs.testDefs
          .forEach((key, value) => Projection.add(key, value));
      var projectionArray =
          all_proj4_defs.testDefs.keys.map((key) => Projection(key));
      expect(projectionArray.length, all_proj4_defs.testDefs.length);
    });

    test('Create all projections via ogc wkt strings and find all of them', () {
      all_proj4_ogc_defs.OGCWktTestDefs.forEach(
          (key, value) => Projection.add(key, value));
      var projectionArray =
          all_proj4_ogc_defs.OGCWktTestDefs.keys.map((key) => Projection(key));
      expect(projectionArray.length, all_proj4_ogc_defs.OGCWktTestDefs.length);
    });

    test('Create all projections via esri wkt strings and find all of them',
        () {
      all_proj4_esri_defs.ESRIWktTestDefs.forEach(
          (key, value) => Projection.add(key, value));
      var projectionArray = all_proj4_esri_defs.ESRIWktTestDefs.keys
          .map((key) => Projection(key));
      expect(
          projectionArray.length, all_proj4_esri_defs.ESRIWktTestDefs.length);
    });

    test('Project / unproject test for all Proj4 def projections', () {
      all_proj4_defs.testDefs
          .forEach((key, value) => Projection.add(key, value));
      var wgs = Projection.WGS84;
      all_proj4_results.testResults.forEach((key, value) {
        var testPoint = Point(x: 17.888058560281515, y: 46.89226406700879);
        if (key == 'EPSG:3117') {
          testPoint = Point(x: -72.62, y: 3.81);
        }
        var custom = Projection(key);
        var projectResult = wgs.transform(custom, testPoint);
        var unProjectResult = custom.transform(wgs, value.wgsToCustom);
        var result = ProjectAndUnProjectResult(projectResult, unProjectResult);
        if (value.customToWgs.x.isNaN) {
          expect(result.customToWgs.x, isNaN);
        } else {
          expect(result.customToWgs.x, closeTo(value.customToWgs.x, 0.000001));
        }
        if (value.customToWgs.y.isNaN) {
          expect(result.customToWgs.y, isNaN);
        } else {
          expect(result.customToWgs.y, closeTo(value.customToWgs.y, 0.000001));
        }
        if (value.wgsToCustom.x.isNaN) {
          expect(result.wgsToCustom.x, isNaN);
        } else {
          expect(result.wgsToCustom.x, closeTo(value.wgsToCustom.x, 0.00001));
        }
        if (value.wgsToCustom.y.isNaN) {
          expect(result.wgsToCustom.y, isNaN);
        } else {
          expect(result.wgsToCustom.y, closeTo(value.wgsToCustom.y, 0.00001));
        }
      });
    });

    test('Project / unproject test for all OGC WKT projections', () {
      all_proj4_ogc_defs.OGCWktTestDefs.forEach(
          (key, value) => Projection.add(key, value));
      var wgs = Projection.WGS84;
      all_proj4_ogc_results.testResults.forEach((key, value) {
        var testPoint = Point(x: 17.888058560281515, y: 46.89226406700879);
        var custom = Projection(key);
        var projectResult = wgs.transform(custom, testPoint);
        var unProjectResult = custom.transform(wgs, value.wgsToCustom);
        var result = ProjectAndUnProjectResult(projectResult, unProjectResult);
        if (value.customToWgs.x.isNaN) {
          expect(result.customToWgs.x, isNaN);
        } else {
          expect(result.customToWgs.x, closeTo(value.customToWgs.x, 0.000001));
        }
        if (value.customToWgs.y.isNaN) {
          expect(result.customToWgs.y, isNaN);
        } else {
          expect(result.customToWgs.y, closeTo(value.customToWgs.y, 0.000001));
        }
        if (value.wgsToCustom.x.isNaN) {
          expect(result.wgsToCustom.x, isNaN);
        } else {
          expect(result.wgsToCustom.x, closeTo(value.wgsToCustom.x, 0.00001));
        }
        if (value.wgsToCustom.y.isNaN) {
          expect(result.wgsToCustom.y, isNaN);
        } else {
          expect(result.wgsToCustom.y, closeTo(value.wgsToCustom.y, 0.00001));
        }
      });
    });

    test('Project / unproject test for all ESRI WKT projections', () {
      all_proj4_esri_defs.ESRIWktTestDefs.forEach(
          (key, value) => Projection.add(key, value));
      var wgs = Projection.WGS84;
      all_proj4_esri_results.testResults.forEach((key, value) {
        var testPoint = Point(x: 17.888058560281515, y: 46.89226406700879);
        var custom = Projection(key);
        var projectResult = wgs.transform(custom, testPoint);
        var unProjectResult = custom.transform(wgs, value.wgsToCustom);
        var result = ProjectAndUnProjectResult(projectResult, unProjectResult);
        if (value.customToWgs.x.isNaN) {
          expect(result.customToWgs.x, isNaN);
        } else {
          expect(result.customToWgs.x, closeTo(value.customToWgs.x, 0.000001));
        }
        if (value.customToWgs.y.isNaN) {
          expect(result.customToWgs.y, isNaN);
        } else {
          expect(result.customToWgs.y, closeTo(value.customToWgs.y, 0.000001));
        }
        if (value.wgsToCustom.x.isNaN) {
          expect(result.wgsToCustom.x, isNaN);
        } else {
          expect(result.wgsToCustom.x, closeTo(value.wgsToCustom.x, 0.00001));
        }
        if (value.wgsToCustom.y.isNaN) {
          expect(result.wgsToCustom.y, isNaN);
        } else {
          expect(result.wgsToCustom.y, closeTo(value.wgsToCustom.y, 0.00001));
        }
      });
    });
  });

  group('Internal operation tests', () {
    test('Should create two different instances', () {
      var code = 'EPSG:20348';
      var projStr =
          '+proj=utm +zone=48 +south +ellps=aust_SA +towgs84=-134,-48,149,0,0,0,0 +units=m +no_defs';
      expect(
          identical(
              Projection.add(code, projStr), Projection.add(code, projStr)),
          false);
    });

    test('Should return same instance', () {
      var code = 'EPSG:20348';
      var projStr =
          '+proj=utm +zone=48 +south +ellps=aust_SA +towgs84=-134,-48,149,0,0,0,0 +units=m +no_defs';
      Projection.add(code, projStr);
      expect(identical(Projection(code), Projection(code)), true);
    });

    test('Should be able to override predifined projection', () {
      expect(Projection('GOOGLE').runtimeType, PseudoMercatorProjection);
      var projStr =
          '+proj=utm +zone=48 +south +ellps=aust_SA +towgs84=-134,-48,149,0,0,0,0 +units=m +no_defs';
      var proj = Projection.add('GOOGLE', projStr);
      expect(proj.runtimeType, UniversalTransverseMercatorProjection);
    });
  });
}
