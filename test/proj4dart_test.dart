import 'package:proj4dart/proj4dart.dart';
import 'package:proj4dart/src/common/parse_code.dart' as parser;
import 'package:test/test.dart';

void main() {
  group('proj4', () {
    test('Get EPSG:4326 from cache', () {
      var proj1 = ProjDefs().get('EPSG:4326');
      expect(proj1 != null && proj1 is ProjParams, true);
    });

    test('Get Google mercator from cache', () {
      var proj1 = ProjDefs().get('EPSG:3857');
      var proj2 = ProjDefs().get('GOOGLE');
      var proj3 = ProjDefs().get('EPSG:900913');
      expect(proj1 != null && proj1 is ProjParams, true);
      expect(proj2 != null && proj2 is ProjParams, true);
      expect(proj3 != null && proj3 is ProjParams, true);
    });

    test('Register and get EPSG:23700', () {
      var proj1 = ProjDefs().register('EPSG:23700',
          '+proj=somerc +lat_0=47.14439372222222 +lon_0=19.04857177777778 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +towgs84=52.17,-71.82,-14.9,0,0,0,0 +units=m +no_defs');
      expect(proj1 != null && proj1 is ProjParams, true);
    });

    test('Parser test', () {
      var proj1 = parser.parse('EPSG:3857');
      expect(proj1 != null && proj1 is ProjParams, true);
    });
  });
  group('epsg23700 <--> epsg4326', () {
    var epsg23700Proj;
    var epsg4326Proj;

    setUp(() {
      epsg23700Proj = Projection('EPSG:23700');
      epsg4326Proj = Projection('EPSG:4326');
    });

    test('EPSG:23700 to EPSG:4326', () {
      var point = epsg23700Proj.transform(epsg4326Proj,
          Point.fromArray([561651.8404032991, 172658.61999188608]));
      print(point.toString());
      expect(
          point.toString(),
          Point(
            x: 17.888058560281515,
            y: 46.89226406700879,
          ).toString());
    });

    test('EPSG:4326 to EPSG:23700', () {
      var point = epsg4326Proj.transform(epsg23700Proj,
          Point.fromArray([17.888058560281515, 46.89226406700879]));
      print(point.toString());
      expect(
          point.toString(),
          Point(
            x: 561651.8408065987,
            y: 172658.61998377228,
          ).toString());
    });

    test('proj cache can find', () {
      var projection = Projection('EPSG:4326');
      print(projection.title);
      expect(projection.title, 'WGS 84 (long/lat)');
    });

    test('proj cache cannot find', () {
      expect(() => Projection('EPSG:1234'), throwsException);
    });

    test('register projection', () {
      var projection = Projection.register(
          'EPSG:4326', '+proj=longlat +datum=WGS84 +no_defs');
      var projection1 = Projection.register('EPSG:3857',
          '+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext +no_defs');
      var projection2 = Projection.register('EPSG:23700',
          '+proj=somerc +lat_0=47.14439372222222 +lon_0=19.04857177777778 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +towgs84=52.17,-71.82,-14.9,0,0,0,0 +units=m +no_defs');
      expect(projection, null);
      expect(projection1, null);
      expect(projection2, null);
    });
  });
}
