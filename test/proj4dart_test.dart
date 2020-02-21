import 'package:proj4dart/proj4dart.dart';
import 'package:proj4dart/src/common/parse_code.dart' as parser;
import 'package:proj4dart/src/proj_store.dart';
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
      var projection = MercProjection.init(ProjDefStore().get('EPSG:3857'));
      expect(projection != null && projection is Projection, true);
    });

    test('ProjStore init', () {
      ProjStore().start();
      var projections = ProjStore().getProjections();
      expect(projections.length, 2);
    });
  });
}
