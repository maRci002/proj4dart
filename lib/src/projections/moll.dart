import 'dart:math' as math;

import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/common/utils.dart' as utils;
import 'package:proj4dart/src/constants/values.dart' as consts;

class MollweideProjection extends Projection {
  static final List<String> names = ['Mollweide', 'moll'];

  double long0;
  double x0;
  double y0;

  MollweideProjection.init(ProjParams params)
      : long0 = params.long0,
        x0 = params.x0,
        y0 = params.y0,
        super.init(params);

  @override
  Point forward(Point p) {
    var lon = p.x;
    var lat = p.y;

    var delta_lon = utils.adjust_lon(lon - long0);
    var theta = lat;
    var con = math.pi * math.sin(lat);

    // Iterate using the Newton-Raphson method to find theta
    while (true) {
      var delta_theta =
          -(theta + math.sin(theta) - con) / (1 + math.cos(theta));
      theta += delta_theta;
      if (delta_theta.abs() < consts.EPSLN) {
        break;
      }
    }
    theta /= 2;

    // If the latitude is 90 deg, force the x coordinate to be "0 + false easting"
    // this is done here because of precision problems with "cos(theta)"
    if (math.pi / 2 - lat.abs() < consts.EPSLN) {
      delta_lon = 0;
    }
    var x = 0.900316316158 * a * delta_lon * math.cos(theta) + x0;
    var y = 1.4142135623731 * a * math.sin(theta) + y0;

    p.x = x;
    p.y = y;
    return p;
  }

  @override
  Point inverse(Point p) {
    double theta;
    double arg;
    p.x -= x0;
    p.y -= y0;
    arg = p.y / (1.4142135623731 * a);

    // Because of division by zero problems, 'arg' can not be 1.  Therefore
    // a number very close to one is used instead.
    if (arg.abs() > 0.999999999999) {
      arg = 0.999999999999;
    }
    theta = math.asin(arg);
    var lon = utils
        .adjust_lon(long0 + (p.x / (0.900316316158 * a * math.cos(theta))));
    if (lon < (-math.pi)) {
      lon = -math.pi;
    }
    if (lon > math.pi) {
      lon = math.pi;
    }
    arg = (2 * theta + math.sin(2 * theta)) / math.pi;
    if (arg.abs() > 1) {
      arg = 1;
    }
    var lat = math.asin(arg);

    p.x = lon;
    p.y = lat;
    return p;
  }
}
