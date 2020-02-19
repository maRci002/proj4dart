import 'package:proj4dart/src/common/utils.dart';
import 'package:proj4dart/src/projections/projection.dart';
import 'dart:math' as math;

class Merc extends Projection {
  @override
  void init() {
    var con = b / a;
    es = 1 - con * con;
    x0 ??= 0;
    y0 ??= 0;
    e = math.sqrt(es);
    if (lat_ts != null) {
      if (sphere) {
        k0 = math.cos(lat_ts);
      } else {
        k0 = Utils.msfnz(e, math.sin(lat_ts), math.cos(lat_ts));
      }
    } else {
      if (k0 == null) {
        if (k != null) {
          k0 = k;
        } else {
          k0 = 1;
        }
      }
    }
  }
}
