import 'package:proj4dart/proj4dart.dart';

// var _codes = ['3857', '900913', '3785', '102113'];

bool _testObj(dynamic code) {
  return code is String;
}

bool _testDef(String name) {
  return ProjDefStore().names().contains(name);
}

bool _testWKT(String code) {
  var isWkt = false;
  var codeWords = [
    'PROJECTEDCRS',
    'PROJCRS',
    'GEOGCS',
    'GEOCCS',
    'PROJCS',
    'LOCAL_CS',
    'GEODCRS',
    'GEODETICCRS',
    'GEODETICDATUM',
    'ENGCRS',
    'ENGINEERINGCRS'
  ];
  for (var i = 0; i < codeWords.length; i++) {
    if (code.contains(codeWords[i])) {
      isWkt = true;
      break;
    }
  }
  return isWkt;
}

bool _testProj(String code) {
  return code[0] == '+';
}

ProjParams parse(dynamic code) {
  if (_testObj(code)) {
    //check to see if this is a WKT string
    if (_testDef(code)) {
      return ProjDefStore().get(code);
    }
    if (_testWKT(code)) {
      throw Exception('WKT is not yet implemented');
    }
    if (_testProj(code)) {
      return ProjParams(code);
    }
  } else {
    return code as ProjParams;
  }
  return null;
}
