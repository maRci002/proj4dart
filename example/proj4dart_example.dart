import 'package:proj4dart/proj4dart.dart';

void main() {
  var pointSrc = Point(x: 17.888058560281515, y: 46.89226406700879);
  var code = 'EPSG:3819';
  var projSrc = Projection('EPSG:4326');
  ProjDefStore().register(code,
      '+proj=laea +lat_0=90 +lon_0=0 +x_0=0 +y_0=0 +a=6371228 +b=6371228 +units=m +no_defs');

  var projDst = Projection(code);

  var pointDst = projSrc.transform(projDst, pointSrc);
  print(pointDst);
  print(projDst.transform(projSrc, pointDst));
}
