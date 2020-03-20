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

    void checkProjectAndUnProjectResults(Map<String, String> defs,
        Map<String, ProjectAndUnProjectResult> testResults) {
      final testPoint = Point(x: 17.888058560281515, y: 46.89226406700879);

      testResults.forEach((key, value) {
        final point =
            key == 'EPSG:3117' ? Point(x: -72.62, y: 3.81) : testPoint;

        final wgs = Projection.WGS84;
        final custom = Projection.parse(defs[key]);

        if (value.forwardResultError != null) {
          try {
            wgs.transform(custom, point);
          } on Exception catch (error) {
            expect(
              value.forwardResultError,
              error.toString().substring('Exception: '.length),
              reason: key,
            );
          }
        } else {
          final forwardResult = wgs.transform(custom, point);

          if (value.forwardResult.x != forwardResult.x) {
            if (value.forwardResult.x.isNaN) {
              expect(forwardResult.x, isNaN, reason: key);
            } else {
              expect(forwardResult.x, closeTo(value.forwardResult.x, 0.00001),
                  reason: key);
            }
          }

          if (value.forwardResult.y != forwardResult.y) {
            if (value.forwardResult.y.isNaN) {
              expect(forwardResult.y, isNaN, reason: key);
            } else {
              expect(forwardResult.y, closeTo(value.forwardResult.y, 0.00001),
                  reason: key);
            }
          }
        }

        if (value.inverseResultError != null) {
          try {
            custom.transform(wgs, value.forwardResult);
          } on Exception catch (error) {
            expect(
              value.inverseResultError,
              error.toString().substring('Exception: '.length),
              reason: key,
            );
          }
        } else {
          final inverseResult = custom.transform(wgs, value.forwardResult);

          if (value.inverseResult.x != inverseResult.x) {
            if (value.inverseResult.x.isNaN) {
              expect(inverseResult.x, isNaN, reason: key);
            } else {
              expect(inverseResult.x, closeTo(value.inverseResult.x, 0.000001),
                  reason: key);
            }
          }

          if (value.inverseResult.y != inverseResult.y) {
            if (value.inverseResult.y.isNaN) {
              expect(inverseResult.y, isNaN, reason: key);
            } else {
              expect(inverseResult.y, closeTo(value.inverseResult.y, 0.000001),
                  reason: key);
            }
          }
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
      checkProjectAndUnProjectResults(
          proj4StringDefs, all_proj4_results.testResults);
    });

    test('Project / unproject test for all OGC WKT projections', () {
      checkProjectAndUnProjectResults(
          proj4OGCWktTestDefs, all_proj4_ogc_results.testResults);
    });

    test('Project / unproject test for all ESRI WKT projections', () {
      checkProjectAndUnProjectResults(
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

    test('Should be able to override predefined projection', () {
      expect(Projection('GOOGLE').runtimeType, PseudoMercatorProjection);
      var projStr =
          '+proj=utm +zone=48 +south +ellps=aust_SA +towgs84=-134,-48,149,0,0,0,0 +units=m +no_defs';
      var proj = Projection.add('GOOGLE', projStr);
      expect(proj.runtimeType, UniversalTransverseMercatorProjection);
    });

    test('ProjectionTuple should create the same result as "plain" Projections',
        () {
      final defs = all_proj4_defs.testDefs;
      final from = Projection.parse(defs['EPSG:23700']);
      final to = Projection.parse(defs['EPSG:28426']);
      final tuple = ProjectionTuple(fromProj: from, toProj: to);

      final plainForwardResult = from.transform(
          to, Point.fromArray([561651.8408065987, 172658.61998377228]));
      final plainInverseResult =
          to.transform(from, Point.copy(plainForwardResult));

      final tupleForwardResult = tuple
          .forward(Point.fromArray([561651.8408065987, 172658.61998377228]));
      final tupleInverseResult = tuple.inverse(Point.copy(tupleForwardResult));

      expect(plainForwardResult.toString(), tupleForwardResult.toString());
      expect(plainInverseResult.toString(), tupleInverseResult.toString());
    });
  });
}
