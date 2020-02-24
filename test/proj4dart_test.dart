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

  group('Test all projections', () {
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

    test('somerc', () {
      code = 'EPSG:23700';
      ProjDefStore().register(code,
          '+proj=somerc +lat_0=47.14439372222222 +lon_0=19.04857177777778 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +towgs84=52.17,-71.82,-14.9,0,0,0,0 +units=m +no_defs');
      projDst = Projection(code);
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(649706.5890497895));
      expect(pointDst.y, equals(241213.69197525256));
    });

    test('merc', () {
      code = 'EPSG:3857';
      projDst = Projection(code);
      pointDst = projSrc.transform(projDst, pointSrc);
      expect(pointDst.x, equals(2119918.1616865788));
      expect(pointDst.y, equals(6026519.169750551));
    });
  });
}
