import 'package:proj4dart/proj4dart.dart';
import 'package:proj4dart/src/common/parse_code.dart' as parser;
import 'package:proj4dart/src/projections/merc.dart';
import 'package:test/test.dart';

import './classes/project_and_unproject_result.dart';
import './data/all_proj4_defs.dart' as all_proj4_defs;
import './data/all_proj4_tests.dart' as all_proj4_tests;

void main() {
  group('Parse and add projections', () {
    setUp(() {
      ProjStore().start();
    });

    test('Get EPSG:4326 from cache', () {
      var proj1 = ProjDefStore().get('EPSG:4326');
      expect(proj1 != null && proj1 is ProjParams, true);
    });

    test('Get Google mercator from cache', () {
      var proj1 = ProjDefStore().get('EPSG:3857');
      expect(proj1 != null && proj1 is ProjParams, true);
    });

    test('Register and get EPSG:23700', () {
      var proj1 = ProjDefStore().register('EPSG:23700',
          '+proj=somerc +lat_0=47.14439372222222 +lon_0=19.04857177777778 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +towgs84=52.17,-71.82,-14.9,0,0,0,0 +units=m +no_defs');
      expect(proj1 != null && proj1 is ProjParams, true);
    });

    test('Parser test', () {
      var proj1 = parser.parse('EPSG:3857');
      expect(proj1 != null && proj1 is ProjParams, true);
    });

    test('Projection init', () {
      var projection =
          PseudoMercatorProjection.init(ProjDefStore().get('EPSG:3857'));
      expect(projection != null && projection is Projection, true);
    });

    test('ProjStore init', () {
      ProjStore().start();
      var projections = ProjStore().getProjections();
      expect(projections.length, greaterThan(0));
    });
  });

  group('Test all projections (forward and inverse)', () {
    var pointSrc = Point(x: 19.043548857256127, y: 47.51484887728807);
    var projSrc = Projection('EPSG:4326');
    Projection projDst;
    Point pointDst;
    String code;

    test('aea', () {
      code = 'EPSG:3005';
      ProjDefStore().register(code,
          '+proj=aea +lat_1=50 +lat_2=58.5 +lat_0=45 +lon_0=-126 +x_0=1000000 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs');
      projDst = Projection(code);
      // forward
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(5751378.282186188));
      expect(pointDst.y, equals(8091280.535021808));
    });

    test('aeqd', () {
      code = 'EPSG:54032';
      ProjDefStore().register(code,
          '+proj=aeqd +lat_0=0 +lon_0=0 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs');
      projDst = Projection(code);
      // forward
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(1607282.0134987913));
      expect(pointDst.y, equals(5342556.029608966));
    });

    test('cass', () {
      code = 'ESRI:54028';
      ProjDefStore().register(code,
          '+proj=cass +lat_0=0 +lon_0=0 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs');
      projDst = Projection(code);
      // forward
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(1420288.7703307027));
      expect(pointDst.y, equals(5443103.122591051));
    });

    test('cea', () {
      code = 'EPSG:3410';
      ProjDefStore().register(code,
          '+proj=cea +lon_0=0 +lat_ts=30 +x_0=0 +y_0=0 +a=6371228 +b=6371228 +units=m +no_defs');
      projDst = Projection(code);
      // forward
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(1833914.2737097454));
      expect(pointDst.y, equals(5425334.354003232));
    });

    test('eqc', () {
      code = 'EPSG:4087';
      ProjDefStore().register(code,
          '+proj=eqc +lat_ts=0 +lat_0=0 +lon_0=0 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs');
      projDst = Projection(code);
      // forward
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(2119918.1616865788));
      expect(pointDst.y, equals(5289328.782139054));
    });

    test('eqdc', () {
      code = 'ESRI:102031';
      ProjDefStore().register(code,
          '+proj=eqdc +lat_0=30 +lon_0=10 +lat_1=43 +lat_2=62 +x_0=0 +y_0=0 +ellps=intl +units=m +no_defs');
      projDst = Projection(code);
      // forward
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(673155.7616767967));
      expect(pointDst.y, equals(1986437.6933547938));
    });

    test('geocent', () {
      code = 'EPSG:4328 (deprecated)';
      ProjDefStore()
          .register(code, '+proj=geocent +datum=WGS84 +units=m +no_defs');
      projDst = Projection(code);
      // forward
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(4079459.1719848895));
      expect(pointDst.y, equals(1408139.648291708));
      // inverse
      var pointInverse = projDst.transform(projSrc, pointDst);
      expect(pointInverse.x, equals(19.043548857256127));
      expect(pointInverse.y, equals(0.0));
    });

    test('gnom', () {
      code = 'EPSG:102018';
      ProjDefStore().register(code,
          '+proj=gnom +lat_0=90 +lon_0=0 +x_0=6300000 +y_0=6300000 +ellps=WGS84 +datum=WGS84 +units=m +no_defs');
      projDst = Projection(code);
      // forward
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(8205986.12760191));
      expect(pointDst.y, equals(778251.7846476855));
      // inverse
      var pointInverse = projDst.transform(projSrc, pointDst);
      expect(pointInverse.x, equals(19.04354885725613));
      expect(pointInverse.y, equals(47.51484887728807));
    });

    test('krovak', () {
      code = 'EPSG:5514';
      ProjDefStore().register(code,
          '+proj=krovak +lat_0=49.5 +lon_0=24.83333333333333 +alpha=30.28813972222222 +k=0.9999 +x_0=0 +y_0=0 +ellps=bessel +towgs84=589,76,480,0,0,0,0 +units=m +no_defs');
      projDst = Projection(code);
      // forward
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, closeTo(-435519.15848986834, 0.000001));
      expect(pointDst.y, closeTo(-1363291.3954732278, 0.000001));
      // inverse
      var pointInverse = projDst.transform(projSrc, pointDst);
      expect(pointInverse.x, closeTo(19.04354886801534, 0.000001));
      expect(pointInverse.y, closeTo(47.51484887961953, 0.000001));
    });

    test('laea', () {
      code = 'EPSG:3575';
      ProjDefStore().register(code,
          '+proj=laea +lat_0=90 +lon_0=10 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs');
      projDst = Projection(code);
      // forward
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(727750.9169808805));
      expect(pointDst.y, equals(-4572343.094675259));
      // inverse
      var pointInverse = projDst.transform(projSrc, pointDst);
      expect(pointInverse.x, equals(19.043548857256127));
      expect(pointInverse.y, equals(47.51484887950526));
    });

    test('lcc', () {
      code = 'EPSG:3034';
      ProjDefStore().register(code,
          '+proj=lcc +lat_1=35 +lat_2=65 +lat_0=52 +lon_0=10 +x_0=4000000 +y_0=2800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs');
      projDst = Projection(code);
      // forward
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(4657201.005260742));
      expect(pointDst.y, equals(2358353.0358781572));
      // inverse
      var pointInverse = projDst.transform(projSrc, pointDst);
      expect(pointInverse.x, equals(19.04354885725613));
      expect(pointInverse.y, equals(47.51484887727113));
    });

    test('mill', () {
      code = 'ESRI:54003';
      ProjDefStore().register(code,
          '+proj=mill +lat_0=0 +lon_0=0 +x_0=0 +y_0=0 +R_A +datum=WGS84 +units=m +no_defs');
      projDst = Projection(code);
      // forward
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, closeTo(2119918.161686579, 0.000001));
      expect(pointDst.y, closeTo(5699317.715932648, 0.000001));
      // inverse
      var pointInverse = projDst.transform(projSrc, pointDst);
      expect(pointInverse.x, closeTo(19.04354885725613, 0.000001));
      expect(pointInverse.y, closeTo(47.51450080384157, 0.000001));
    });

    test('moll', () {
      code = 'EPSG:53009';
      ProjDefStore().register(code,
          '+proj=moll +lon_0=0 +x_0=0 +y_0=0 +a=6371000 +b=6371000 +units=m +no_defs');
      projDst = Projection(code);
      // forward
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(1492737.4163506601));
      expect(pointDst.y, equals(5604516.569123491));
      // inverse
      var pointInverse = projDst.transform(projSrc, pointDst);
      expect(pointInverse.x, equals(19.043548857256123));
      expect(pointInverse.y, equals(47.51484887728807));
    });

    test('nzmg', () {
      code = 'EPSG:27200';
      ProjDefStore().register(code,
          '+proj=nzmg +lat_0=-41 +lon_0=173 +x_0=2510000 +y_0=6023150 +ellps=intl +towgs84=59.47,-5.04,187.44,0.47,-0.1,1.024,-4.5993 +units=m +no_defs');
      projDst = Projection(code);
      var pSrc = Point(x: 171.80, y: -43.06);
      // forward
      pointDst = projSrc.transform(projDst, pSrc);
      expect(pointDst.x, equals(2412264.402162615));
      expect(pointDst.y, equals(5793452.345673523));
      // inverse
      var pointInverse = projDst.transform(projSrc, pointDst);
      expect(pointInverse.x, closeTo(171.80000012145595, 0.000001));
      expect(pointInverse.y, closeTo(-43.059999918291126, 0.000001));
    });

    test('merc', () {
      code = 'EPSG:3857';
      projDst = Projection(code);
      // forward
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(2119918.1616865788));
      expect(pointDst.y, equals(6026519.169750551));
      // inverse
      var pointInverse = projDst.transform(projSrc, pointDst);
      expect(pointInverse.x, equals(19.043548857256127));
      expect(pointInverse.y, equals(47.514848877288046));
    });

    test('omerc', () {
      code = 'EPSG:29702';
      ProjDefStore().register(code,
          '+proj=omerc +lat_0=-18.9 +lonc=44.10000000000001 +alpha=18.9 +k=0.9995000000000001 +x_0=400000 +y_0=800000 +gamma=18.9 +ellps=intl +towgs84=-189,-242,-91,0,0,0,0 +pm=paris +units=m +no_defs');
      projDst = Projection(code);
      // forward
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, closeTo(-1247973.4166138354, 0.000001));
      expect(pointDst.y, closeTo(9103629.638676804, 0.000001));
      // inverse
      var pointInverse = projDst.transform(projSrc, pointDst);
      expect(pointInverse.x, closeTo(19.043548843468, 0.000001));
      expect(pointInverse.y, closeTo(47.51484887937237, 0.000001));
    });

    test('poly', () {
      code = 'EPSG:5880';
      ProjDefStore().register(code,
          '+proj=poly +lat_0=0 +lon_0=-54 +x_0=5000000 +y_0=10000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs');
      projDst = Projection(code);
      // forward
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(9726405.590576228));
      expect(pointDst.y, equals(17665759.337315112));
      // inverse
      var pointInverse = projDst.transform(projSrc, pointDst);
      expect(pointInverse.x, equals(19.043548857256095));
      expect(pointInverse.y, equals(47.51484887728806));
    });

    test('qsc', () {
      code = 'EPSG:qsc';
      ProjDefStore()
          .register(code, '+proj=qsc +lat_0=0 +lon_0=0 +units=m +datum=WGS84');
      projDst = Projection(code);
      // forward
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(2289944.202733204));
      expect(pointDst.y, equals(6884110.562573651));
      // inverse
      var pointInverse = projDst.transform(projSrc, pointDst);
      expect(pointInverse.x, equals(19.043548857256116));
      expect(pointInverse.y, equals(47.51484887728806));
    });

    test('robin', () {
      code = 'ESRI:54030';
      ProjDefStore().register(code,
          '+proj=robin +lon_0=0 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs');
      projDst = Projection(code);
      // forward
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(1587634.0111816782));
      expect(pointDst.y, equals(5068600.79388094));
      // inverse
      var pointInverse = projDst.transform(projSrc, pointDst);
      expect(pointInverse.x, equals(19.043548857256127));
      expect(pointInverse.y, equals(47.51484887728808));
    });

    test('sinu', () {
      code = 'ESRI:54008';
      ProjDefStore().register(code,
          '+proj=sinu +lon_0=0 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs');
      // forward
      projDst = Projection(code);
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(1434404.3007320191));
      expect(pointDst.y, equals(5264485.776092447));
      // inverse
      var pointInverse = projDst.transform(projSrc, pointDst);
      expect(pointInverse.x, equals(19.043548857256127));
      expect(pointInverse.y, equals(47.51484887728806));
    });

    test('somerc', () {
      code = 'EPSG:23700';
      ProjDefStore().register(code,
          '+proj=somerc +lat_0=47.14439372222222 +lon_0=19.04857177777778 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +towgs84=52.17,-71.82,-14.9,0,0,0,0 +units=m +no_defs');
      projDst = Projection(code);
      // forward
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(649706.5890497895));
      expect(pointDst.y, equals(241213.69197525256));
      // inverse
      var pointInverse = projDst.transform(projSrc, pointDst);
      expect(pointInverse.x, equals(19.043548862382636));
      expect(pointInverse.y, equals(47.51484887721948));
    });

    test('stere', () {
      code = 'EPSG:3995';
      ProjDefStore().register(code,
          '+proj=stere +lat_0=90 +lat_ts=71 +lon_0=0 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs');
      projDst = Projection(code);
      // forward
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(1576419.7638628334));
      expect(pointDst.y, equals(-4566976.061209708));
      // inverse
      var pointInverse = projDst.transform(projSrc, pointDst);
      expect(pointInverse.x, equals(19.04354885725613));
      expect(pointInverse.y, equals(47.51484887727112));
    });

    test('sterea', () {
      code = 'EPSG:3844';
      ProjDefStore().register(code,
          '+proj=sterea +lat_0=46 +lon_0=25 +k=0.99975 +x_0=500000 +y_0=500000 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs');
      projDst = Projection(code);
      // forward
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(51738.322607670096));
      expect(pointDst.y, equals(685395.0285154309));
      // inverse
      var pointInverse = projDst.transform(projSrc, pointDst);
      expect(pointInverse.x, equals(19.043548868657588));
      expect(pointInverse.y, equals(47.51484887877625));
    });

    test('tmerc', () {
      code = 'ESRI:31491';
      ProjDefStore().register(code,
          '+proj=tmerc +lat_0=0 +lon_0=3 +k=1 +x_0=1500000 +y_0=0 +ellps=bessel +units=m +no_defs');
      projDst = Projection(code);
      // forward
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(2706729.615899314));
      expect(pointDst.y, equals(5390125.655406518));
      // inverse
      var pointInverse = projDst.transform(projSrc, pointDst);
      expect(pointInverse.x, equals(19.043515103790405));
      expect(pointInverse.y, equals(47.51484931168959));
    });

    test('utm', () {
      code = 'EPSG:32633';
      ProjDefStore()
          .register(code, '+proj=utm +zone=33 +datum=WGS84 +units=m +no_defs');
      projDst = Projection(code);
      // forward
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(804425.6558439163));
      expect(pointDst.y, equals(5270308.132769558));
      // inverse
      var pointInverse = projDst.transform(projSrc, pointDst);
      expect(pointInverse.x, equals(19.043548857256134));
      expect(pointInverse.y, equals(47.51484887728806));
    });

    test('vandg', () {
      code = 'ESRI:54029';
      ProjDefStore().register(code,
          '+proj=vandg +lon_0=0 +x_0=0 +y_0=0 +R_A +datum=WGS84 +units=m +no_defs');
      projDst = Projection(code);
      // forward
      var pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(1949586.4195587242));
      expect(pointDst.y, equals(5708944.203997527));
    });
  });

  group('Bulk tests', () {
    test('Register all defs without exception', () {
      var defsArray = [];
      all_proj4_defs.testDefs.forEach(
          (key, value) => defsArray.add(ProjDefStore().register(key, value)));
      expect(defsArray.length, all_proj4_defs.testDefs.length);
    });

    test('Project / UnProject test for all projections', () {
      all_proj4_defs.testDefs
          .forEach((key, value) => ProjDefStore().register(key, value));
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
          expect(result.wgsToCustom.x, closeTo(value.wgsToCustom.x, 0.000001));
        }
        if (value.wgsToCustom.y.isNaN) {
          expect(result.wgsToCustom.y, isNaN);
        } else {
          expect(result.wgsToCustom.y, closeTo(value.wgsToCustom.y, 0.000001));
        }
      });
    });

    // WARNING: This should pass only if all projection algorithm are implemented
    test('Create all projections without exception', () {
      all_proj4_defs.testDefs
          .forEach((key, value) => ProjDefStore().register(key, value));

      var projectionArray = [];
      all_proj4_defs.testDefs.keys
          .forEach((key) => projectionArray.add(Projection(key)));
      expect(projectionArray.length, all_proj4_defs.testDefs.length);
    });
  });
}
