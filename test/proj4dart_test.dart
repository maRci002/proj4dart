import 'package:proj4dart/proj4dart.dart';
import 'package:proj4dart/src/common/parse_code.dart' as parser;
import 'package:proj4dart/src/projections/merc.dart';
import 'package:test/test.dart';

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
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(5751378.282186188));
      expect(pointDst.y, equals(8091280.535021808));
    });

    test('aeqd', () {
      code = 'EPSG:54032';
      ProjDefStore().register(code,
          '+proj=aeqd +lat_0=0 +lon_0=0 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs');
      projDst = Projection(code);
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(1607282.0134987913));
      expect(pointDst.y, equals(5342556.029608966));
    });

    test('cass', () {
      code = 'ESRI:54028';
      ProjDefStore().register(code,
          '+proj=cass +lat_0=0 +lon_0=0 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs');
      projDst = Projection(code);
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(1420288.7703307027));
      expect(pointDst.y, equals(5443103.122591051));
    });

    test('cea', () {
      code = 'EPSG:3410';
      ProjDefStore().register(code,
          '+proj=cea +lon_0=0 +lat_ts=30 +x_0=0 +y_0=0 +a=6371228 +b=6371228 +units=m +no_defs');
      projDst = Projection(code);
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(1833914.2737097454));
      expect(pointDst.y, equals(5425334.354003232));
    });

    test('eqc', () {
      code = 'EPSG:4087';
      ProjDefStore().register(code,
          '+proj=eqc +lat_ts=0 +lat_0=0 +lon_0=0 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs');
      projDst = Projection(code);
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(2119918.1616865788));
      expect(pointDst.y, equals(5289328.782139054));
    });

    test('eqdc', () {
      code = 'ESRI:102031';
      ProjDefStore().register(code,
          '+proj=eqdc +lat_0=30 +lon_0=10 +lat_1=43 +lat_2=62 +x_0=0 +y_0=0 +ellps=intl +units=m +no_defs');
      projDst = Projection(code);
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(673155.7616767967));
      expect(pointDst.y, equals(1986437.6933547938));
    });

    test('merc', () {
      code = 'EPSG:3857';
      projDst = Projection(code);
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(2119918.1616865788));
      expect(pointDst.y, equals(6026519.169750551));
    });

    test('somerc', () {
      code = 'EPSG:23700';
      ProjDefStore().register(code,
          '+proj=somerc +lat_0=47.14439372222222 +lon_0=19.04857177777778 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +towgs84=52.17,-71.82,-14.9,0,0,0,0 +units=m +no_defs');
      projDst = Projection(code);
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(649706.5890497895));
      expect(pointDst.y, equals(241213.69197525256));
    });

    test('sterea', () {
      code = 'EPSG:3844';
      ProjDefStore().register(code,
          '+proj=sterea +lat_0=46 +lon_0=25 +k=0.99975 +x_0=500000 +y_0=500000 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs');
      projDst = Projection(code);
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(51738.322607670096));
      expect(pointDst.y, equals(685395.0285154309));
      // inverse
      var pointInverse = projDst.transform(projSrc, pointDst);
      expect(pointInverse.x, equals(19.043548868657588));
      expect(pointInverse.y, equals(47.51484887877625));
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
      var pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(1949586.4195587242));
      expect(pointDst.y, equals(5708944.203997527));
    });
  });
}
