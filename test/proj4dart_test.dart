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
    Map<String, String> proj4StringDefs;
    Map<String, String> proj4OGCWktTestDefs;
    Map<String, String> proj4ESRIWktTestDefs;

    setUp(() {
      proj4StringDefs = all_proj4_defs.testDefs;
      proj4OGCWktTestDefs = all_proj4_ogc_defs.testDefs;
      proj4ESRIWktTestDefs = all_proj4_esri_defs.testDefs;
    });

    void checkProjectAndUnProjectResult(Map<String, String> defs,
        Map<String, ProjectAndUnProjectResult> testResults) {
      final wgs = Projection.WGS84;
      final testPoint = Point(x: 17.888058560281515, y: 46.89226406700879);

      defs.forEach((key, value) => Projection.add(key, value));
      testResults.forEach((key, value) {
        final point =
            key == 'EPSG:3117' ? Point(x: -72.62, y: 3.81) : testPoint;

        final custom = Projection(key);
        final projectResult = wgs.transform(custom, point);
        final unProjectResult = custom.transform(wgs, value.wgsToCustom);
        final result =
            ProjectAndUnProjectResult(projectResult, unProjectResult);

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
    }

    test('Create all projections via proj4 def strings and find all of them',
        () {
      proj4StringDefs.forEach((key, value) => Projection.add(key, value));
      final projectionArray =
          proj4StringDefs.keys.map((key) => Projection(key));

      expect(projectionArray.length, proj4StringDefs.length);
    });

    test('Create all projections via ogc wkt strings and find all of them', () {
      proj4OGCWktTestDefs.forEach((key, value) => Projection.add(key, value));
      final projectionArray =
          proj4OGCWktTestDefs.keys.map((key) => Projection(key));

      expect(projectionArray.length, proj4OGCWktTestDefs.length);
    });

    test('Create all projections via esri wkt strings and find all of them',
        () {
      proj4ESRIWktTestDefs.forEach((key, value) => Projection.add(key, value));
      final projectionArray =
          proj4ESRIWktTestDefs.keys.map((key) => Projection(key));

      expect(projectionArray.length, proj4ESRIWktTestDefs.length);
    });

    test('Project / unproject test for all Proj4 def projections', () {
      checkProjectAndUnProjectResult(
          proj4StringDefs, all_proj4_results.testResults);
    });

    test('Project / unproject test for all OGC WKT projections', () {
      checkProjectAndUnProjectResult(
          proj4OGCWktTestDefs, all_proj4_ogc_results.testResults);
    });

    test('Project / unproject test for all ESRI WKT projections', () {
      checkProjectAndUnProjectResult(
          proj4ESRIWktTestDefs, all_proj4_esri_results.testResults);
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
