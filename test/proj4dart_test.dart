import 'package:proj4dart/proj4dart.dart';
import 'package:proj4dart/src/common/parse_code.dart' as parser;
import 'package:proj4dart/src/projections/merc.dart';
import 'package:test/test.dart';

void main() {
  group('proj4', () {
    test('Get EPSG:4326 from cache', () {
      var proj1 = ProjDefStore().get('EPSG:4326');
      expect(proj1 != null && proj1 is ProjParams, true);
    });

    test('Get Google mercator from cache', () {
      var proj1 = ProjDefStore().get('EPSG:3857');
      var proj2 = ProjDefStore().get('GOOGLE');
      var proj3 = ProjDefStore().get('EPSG:900913');
      expect(proj1 != null && proj1 is ProjParams, true);
      expect(proj2 != null && proj2 is ProjParams, true);
      expect(proj3 != null && proj3 is ProjParams, true);
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
      expect(projections.length, 2);
    });
  });

  group('All projections', () {
    var pointSrc = Point(x: 19.043548857256127, y: 47.51484887728807);
    var projSrc = Projection('EPSG:4326');
    Projection projDst;
    Point pointDst;

    test('aea', () {
      ProjDefStore().register('EPSG:3005',
          '+proj=aea +lat_1=50 +lat_2=58.5 +lat_0=45 +lon_0=-126 +x_0=1000000 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs');
      projDst = Projection('EPSG:3005');
      pointDst =
          projDst.transform(projSrc, projSrc.transform(projDst, pointSrc));
      print(pointDst);
      expect(pointSrc.x, closeTo(pointDst.x, 0.000001));
      expect(pointSrc.y, closeTo(pointDst.y, 0.000001));
    });

    test('merc', () {
      projDst = Projection('EPSG:3857');
      pointDst =
          projDst.transform(projSrc, projSrc.transform(projDst, pointSrc));
      print(pointDst);
      expect(pointSrc.x, closeTo(pointDst.x, 0.000001));
      expect(pointSrc.y, closeTo(pointDst.y, 0.000001));
    });
  });
}
