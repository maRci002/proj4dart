import 'dart:collection';

import 'package:proj4dart/proj4dart.dart';
import 'package:proj4dart/src/globals/projection_store.dart';
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
import 'classes/close_to_helper.dart';

void main() {
  group('Bulk tests', () {
    setUp(() => ProjectionStore().clearProjectionCache());

    test('Create all projections via proj4 def strings and find all of them',
        () {
      var proj4StringDefs = all_proj4_defs.testDefs;

      proj4StringDefs.forEach((key, value) => Projection.add(key, value));
      final projectionArray =
          proj4StringDefs.keys.map((key) => Projection(key)).toList();

      expect(projectionArray.length, proj4StringDefs.length);
    });

    test('Create all projections via ogc wkt strings and find all of them', () {
      var proj4OGCWktTestDefs = all_proj4_ogc_defs.testDefs;

      proj4OGCWktTestDefs.forEach((key, value) => Projection.add(key, value));
      final projectionArray =
          proj4OGCWktTestDefs.keys.map((key) => Projection(key)).toList();

      expect(projectionArray.length, proj4OGCWktTestDefs.length);
    });

    test('Create all projections via esri wkt strings and find all of them',
        () {
      var proj4ESRIWktTestDefs = all_proj4_esri_defs.testDefs;

      proj4ESRIWktTestDefs.forEach((key, value) => Projection.add(key, value));
      final projectionArray =
          proj4ESRIWktTestDefs.keys.map((key) => Projection(key)).toList();

      expect(projectionArray.length, proj4ESRIWktTestDefs.length);
    });

    test('Project / unproject test for all Proj4 def projections', () {
      var defs = all_proj4_defs.testDefs;
      var testResults = all_proj4_results.testResults;
      // Since each dart version may produce different average deltas (maybe it also depends on underlying Operating System)
      // We precalculate worstDeltas which will be printed
      var closeToHelpers = _getCloseToHelpers(defs, testResults);

      _checkProjectAndUnProjectResults(
        defs,
        testResults,
        closeToHelpers,
      );

      print(
          'Project / unproject test for all Proj4 def projections test were run against following closeTos:');
      closeToHelpers.forEach((key, value) {
        print(
            '$key : worstForwardX = ${value.worstForwardX}, worstForwardY = ${value.worstForwardY}, worstInverseX = ${value.worstInverseX}, worstInverseY = ${value.worstInverseY}');
      });
    });

    test('Project / unproject test for all OGC WKT projections', () {
      var defs = all_proj4_ogc_defs.testDefs;
      var testResults = all_proj4_ogc_results.testResults;
      // Since each dart version may produce different average deltas (maybe it also depends on underlying Operating System)
      // We precalculate worstDeltas which will be printed
      var closeToHelpers = _getCloseToHelpers(defs, testResults);

      _checkProjectAndUnProjectResults(
        defs,
        testResults,
        closeToHelpers,
      );

      print(
          'Project / unproject test for all OGC WKT projections test were run against following closeTos');
      closeToHelpers.forEach((key, value) {
        print(
            '$key : worstForwardX = ${value.worstForwardX}, worstForwardY = ${value.worstForwardY}, worstInverseX = ${value.worstInverseX}, worstInverseY = ${value.worstInverseY}');
      });
    });

    test('Project / unproject test for all ESRI WKT projections', () {
      var defs = all_proj4_esri_defs.testDefs;
      var testResults = all_proj4_esri_results.testResults;
      // Since each dart version may produce different average deltas (maybe it also depends on underlying Operating System)
      // We precalculate worstDeltas which will be printed
      var closeToHelpers = _getCloseToHelpers(defs, testResults);

      _checkProjectAndUnProjectResults(
        defs,
        testResults,
        closeToHelpers,
      );

      print(
          'Project / unproject test for all ESRI WKT projections test were run against following closeTos');
      closeToHelpers.forEach((key, value) {
        print(
            '$key : worstForwardX = ${value.worstForwardX}, worstForwardY = ${value.worstForwardY}, worstInverseX = ${value.worstInverseX}, worstInverseY = ${value.worstInverseY}');
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

  group('CloseTo calculators', () {
    test('Print avarage closeTos', () {
      // this is not real test
      var map = _getCloseToHelpers(
          all_proj4_defs.testDefs, all_proj4_results.testResults);

      print(
          'Projection | No. tests | avg delta forward_x | avg delta forward_y | avg delta inverse_x | avg delta inverse_y');
      print(':--- | :--- | :--- | :--- | :--- | :---');

      map.forEach((key, value) {
        print(
            '**$key** | ${value.testedAgainst} | *${value.avgForwardX}* | *${value.avgForwardY}* | *${value.avgInverseX}* | *${value.avgInverseY}*');
      });
    });

    test('Print worst closeTos as Map', () {
      // this is not real test
      var result = <String, Map<Type, CloseToHelper>>{};

      result['proj4 defs'] = _getCloseToHelpers(
          all_proj4_defs.testDefs, all_proj4_results.testResults);

      result['proj4 ogc wkt defs'] = _getCloseToHelpers(
          all_proj4_ogc_defs.testDefs, all_proj4_ogc_results.testResults);

      result['proj4 esri wkt defs'] = _getCloseToHelpers(
          all_proj4_esri_defs.testDefs, all_proj4_esri_results.testResults);

      result.forEach((key, value) {
        print('--------------------- $key start -----------------------------');
        print('var closeToHelpers = {');
        value.forEach((key, value) {
          print(
              '\'$key\' : CloseToHelper()..worstForwardX = ${value.worstForwardX}..worstForwardY = ${value.worstForwardY}..worstInverseX = ${value.worstInverseX}..worstInverseY = ${value.worstInverseY},');
        });
        print('};');
        print('--------------------- $key end -----------------------------');
      });
    });
  });
}

Point _getTestPointByKey(String key) {
  switch (key) {
    case 'EPSG:27200':
      return Point(x: 174.8009, y: -36.9341);
    case 'EPSG:3117':
      return Point(x: -72.62, y: 3.81);
    default:
      return Point(x: 17.888058560281515, y: 46.89226406700879);
  }
}

void _checkProjectAndUnProjectResults(
    Map<String, String> defs,
    Map<String, ProjectAndUnProjectResult> testResults,
    Map<Type, CloseToHelper> closeToHelpers) {
  testResults.forEach((key, value) {
    final point = _getTestPointByKey(key);

    final wgs = Projection.WGS84;
    final custom = Projection.parse(defs[key]);
    var closeToHelper = closeToHelpers[custom.runtimeType];

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
          expect(forwardResult.x,
              closeTo(value.forwardResult.x, closeToHelper.worstForwardX),
              reason: key);
        }
      }

      if (value.forwardResult.y != forwardResult.y) {
        if (value.forwardResult.y.isNaN) {
          expect(forwardResult.y, isNaN, reason: key);
        } else {
          expect(forwardResult.y,
              closeTo(value.forwardResult.y, closeToHelper.worstForwardY),
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
          expect(inverseResult.x,
              closeTo(value.inverseResult.x, closeToHelper.worstInverseX),
              reason: key);
        }
      }

      if (value.inverseResult.y != inverseResult.y) {
        if (value.inverseResult.y.isNaN) {
          expect(inverseResult.y, isNaN, reason: key);
        } else {
          expect(inverseResult.y,
              closeTo(value.inverseResult.y, closeToHelper.worstInverseY),
              reason: key);
        }
      }
    }
  });
}

Map<Type, CloseToHelper> _getCloseToHelpers(Map<String, String> defs,
    Map<String, ProjectAndUnProjectResult> testResults) {
  var closeHelperMap = <Type, CloseToHelper>{};

  testResults.forEach((key, value) {
    final point = _getTestPointByKey(key);

    final wgs = Projection.WGS84;
    final custom = Projection.parse(defs[key]);
    final type = custom.runtimeType;

    var currClose = closeHelperMap[type];
    currClose ??= closeHelperMap[type] = CloseToHelper();

    if (value.forwardResultError == null && value.inverseResultError == null) {
      currClose.testedAgainst++;

      final forwardResult = wgs.transform(custom, point);
      if (value.forwardResult.x.isFinite) {
        currClose.putForwardX((forwardResult.x - value.forwardResult.x).abs());
      }

      if (value.forwardResult.y.isFinite) {
        currClose.putForwardY((forwardResult.y - value.forwardResult.y).abs());
      }

      final inverseResult = custom.transform(wgs, value.forwardResult);
      if (value.inverseResult.x.isFinite) {
        currClose.putInverseX((inverseResult.x - value.inverseResult.x).abs());
      }

      if (value.inverseResult.y.isFinite) {
        currClose.putInverseY((inverseResult.y - value.inverseResult.y).abs());
      }
    }
  });

  var orderedByKey = SplayTreeMap<Type, CloseToHelper>.from(closeHelperMap,
      (left, right) => left.toString().compareTo(right.toString()));

  return orderedByKey;
}
