import 'package:proj4dart/proj4dart.dart';

void main() {
  var pointSrc = Point(x: 17.888058560281515, y: 46.89226406700879);
  var code = 'EPSG:3819';
  var projSrc = Projection('EPSG:4326');
  ProjDefStore().register(code,
      '+proj=longlat +ellps=bessel +towgs84=595.48,121.69,515.35,4.115,-2.9383,0.853,-3.408 +no_defs');

  var projDst = Projection(code);

  var pointDst = projSrc.transform(projDst, pointSrc);
  print(pointDst);
  print(projDst.transform(projSrc, pointDst));
}
