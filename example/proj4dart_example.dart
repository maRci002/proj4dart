import 'package:proj4dart/proj4dart.dart';

void main() {
  var pointSrc = Point(x: 17.888058560281515, y: 46.89226406700879);
  var code = 'EPSG:3819';
  var projSrc = Projection('EPSG:4326');
  ProjDefStore().register(code,
      '+proj=tmerc +lat_0=4.596200416666666 +lon_0=-71.07750791666666 +k=1 +x_0=1000000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs');

  var projDst = Projection(code);

  var pointDst = projSrc.transform(projDst, pointSrc);
  print(pointDst);
  print(projDst.transform(projSrc, pointDst));
}
