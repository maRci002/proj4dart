import 'package:proj4dart/proj4dart.dart';

void main() {
  var pointSrc = Point(x: 17.888058560281515, y: 46.89226406700879);
  var code = 'EPSG:3819';
  var projSrc = Projection('EPSG:4326');
  ProjDefStore().register(code,
      '+proj=lcc +lat_1=-22.24472222222222 +lat_2=-22.29472222222222 +lat_0=-22.26972222222222 +lon_0=166.4425 +x_0=8.313000000000001 +y_0=-2.354 +ellps=intl +towgs84=-10.18,-350.43,291.37,0,0,0,0 +units=m +no_defs');

  var projDst = Projection(code);

  var pointDst = projSrc.transform(projDst, pointSrc);
  print(pointDst);
  print(projDst.transform(projSrc, pointDst));
}
