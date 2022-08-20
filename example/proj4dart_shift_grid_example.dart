import 'dart:io';

import 'package:proj4dart/proj4dart.dart';

void main() async {
  // read bytes from filesystem
  // In case of Flutter assets:
  // import 'package:flutter/services.dart' show rootBundle;
  // final bytes = (await rootBundle.load(fileName)).buffer.asUint8List();
  final bytes = await File(
    'test/test_resources/ntv2_0_downsampled.gsb',
  ).readAsBytes();

  // load nadgrid
  Projection.nadgrid('ntv2', bytes);

  // Define Point
  var pointSrc = Point(x: -44.382211538462, y: 40.3768);

  //  Define some projection which has '+nadgrids='
  var projSrc = Projection.add(
    'ntv2_from',
    '+proj=longlat +ellps=clrk66 +nadgrids=@ignorable,ntv2,null',
  );
  ;

  // Use built-in projection
  var projDst = Projection.WGS84;

  // Forward transform (projected crs -> lonlat)
  var pointForward = projSrc.transform(projDst, pointSrc);
  print(
      'FORWARD: Transform point ${pointSrc.toArray()} from ntv2_from to WGS84: ${pointForward.toArray()}');
  // FORWARD: Transform point [-44.382211538462, 40.3768] from ntv2_from to WGS84: [-44.38074905319326, 40.37745745991217]

  // Inverse transform (lonlat -> projected crs)
  var pointInverse = projDst.transform(projSrc, pointForward);
  print(
      'INVERSE: Transform point ${pointForward.toArray()} from WGS84 to ntv2_from: ${pointInverse.toArray()}');
  // INVERSE: Transform point [-44.38074905319326, 40.37745745991217] from WGS84 to ntv2_from: [-44.38074905319326, 40.37745745991217]
}
