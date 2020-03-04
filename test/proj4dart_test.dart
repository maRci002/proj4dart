import 'package:proj4dart/proj4dart.dart';
import 'package:proj4dart/src/projections/merc.dart';
import 'package:proj4dart/src/projections/utm.dart';
import 'package:test/test.dart';

import './classes/project_and_unproject_result.dart';
import './data/all_proj4_defs.dart' as all_proj4_defs;
import './data/all_proj4_tests.dart' as all_proj4_tests;

void main() {
  group('Bulk tests', () {
    test('Create all projections without exception and find all of them', () {
      all_proj4_defs.testDefs
          .forEach((key, value) => Projection.add(key, value));

      var projectionArray =
          all_proj4_defs.testDefs.keys.map((key) => Projection(key));

      expect(projectionArray.length, all_proj4_defs.testDefs.length);
    });

    test('Project / UnProject test for all projections', () {
      all_proj4_defs.testDefs
          .forEach((key, value) => Projection.add(key, value));

      var wgs = Projection('EPSG:4326');

      all_proj4_tests.testResults.forEach((key, value) {
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
  });

  group('Internal operation tests', () {
    test('should create two different instance', () {
      var code = 'EPSG:20348';
      var projStr =
          '+proj=utm +zone=48 +south +ellps=aust_SA +towgs84=-134,-48,149,0,0,0,0 +units=m +no_defs';

      expect(
          identical(
              Projection.add(code, projStr), Projection.add(code, projStr)),
          false);
    });

    test('should return same instance', () {
      var code = 'EPSG:20348';
      var projStr =
          '+proj=utm +zone=48 +south +ellps=aust_SA +towgs84=-134,-48,149,0,0,0,0 +units=m +no_defs';

      Projection.add(code, projStr);

      expect(identical(Projection(code), Projection(code)), true);
    });

    test('should able to override predifined projection', () {
      expect(Projection('GOOGLE').runtimeType, PseudoMercatorProjection);

      var projStr =
          '+proj=utm +zone=48 +south +ellps=aust_SA +towgs84=-134,-48,149,0,0,0,0 +units=m +no_defs';

      var proj = Projection.add('GOOGLE', projStr);
      expect(proj.runtimeType, UniversalTransverseMercatorProjection);
    });
  });
}
