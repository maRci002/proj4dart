import 'dart:math' as math;

import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/common/utils.dart' as utils;
import 'package:proj4dart/src/constants/values.dart' as consts;

class StereographicSouthProjection extends Projection {
  static final List<String> names = [
    'stere',
    'Stereographic_South_Pole',
    'Polar Stereographic (variant B)'
  ];

  double lat0;
  double long0;
  double lat_ts;
  double x0;
  double y0;

  double sinlat0;
  double coslat0;
  double rh;
  double con;
  double cons;
  double ms1;
  double X0;
  double cosX0;
  double sinX0;

  double _ssfn(double phit, double sinphi, double eccen) {
    sinphi *= eccen;
    return (math.tan(0.5 * (consts.HALF_PI + phit)) *
        math.pow((1 - sinphi) / (1 + sinphi), 0.5 * eccen));
  }

  StereographicSouthProjection.init(ProjParams params)
      : lat0 = params.lat0,
        long0 = params.long0,
        lat_ts = params.lat_ts ?? double.nan, // fix js behavior
        x0 = params.x0,
        y0 = params.y0,
        super.init(params) {
    coslat0 = math.cos(lat0);
    sinlat0 = math.sin(lat0);
    if (sphere != null && sphere) {
      if (k0 == 1.0 && !lat_ts.isNaN && coslat0.abs() <= consts.EPSLN) {
        k0 = 0.5 * (1 + utils.sign(lat0) * math.sin(lat_ts));
      }
    } else {
      if (coslat0.abs() <= consts.EPSLN) {
        if (lat0 > 0) {
          //North pole
          //trace('stere:north pole');
          con = 1;
        } else {
          //South pole
          //trace('stere:south pole');
          con = -1;
        }
      }
      cons = math.sqrt(math.pow(1 + e, 1 + e) * math.pow(1 - e, 1 - e));
      if (k0 == 1 && !lat_ts.isNaN && coslat0.abs() <= consts.EPSLN) {
        k0 = 0.5 *
            cons *
            utils.msfnz(e, math.sin(lat_ts), math.cos(lat_ts)) /
            utils.tsfnz(e, con * lat_ts, con * math.sin(lat_ts));
      }
      ms1 = utils.msfnz(e, sinlat0, coslat0);
      X0 = 2 * math.atan(_ssfn(lat0, sinlat0, e)) - consts.HALF_PI;
      cosX0 = math.cos(X0);
      sinX0 = math.sin(X0);
    }
  }

  @override
  Point forward(Point p) {
    var lon = p.x;
    var lat = p.y;
    var sinlat = math.sin(lat);
    var coslat = math.cos(lat);
    var A, X, sinX, cosX, ts, rh;
    var dlon = utils.adjust_lon(lon - long0);

    if (((lon - long0).abs() - math.pi).abs() <= consts.EPSLN &&
        (lat + lat0).abs() <= consts.EPSLN) {
      //case of the origine point
      //trace('stere:this is the origin point');
      p.x = double.nan;
      p.y = double.nan;
      return p;
    }
    if (sphere != null && sphere) {
      //trace('stere:sphere case');
      A = 2 * k0 / (1 + sinlat0 * sinlat + coslat0 * coslat * math.cos(dlon));
      p.x = a * A * coslat * math.sin(dlon) + x0;
      p.y = a * A * (coslat0 * sinlat - sinlat0 * coslat * math.cos(dlon)) + y0;
      return p;
    } else {
      X = 2 * math.atan(_ssfn(lat, sinlat, e)) - consts.HALF_PI;
      cosX = math.cos(X);
      sinX = math.sin(X);
      if (coslat0.abs() <= consts.EPSLN) {
        ts = utils.tsfnz(e, lat * con, con * sinlat);
        rh = 2 * a * k0 * ts / cons;
        p.x = x0 + rh * math.sin(lon - long0);
        p.y = y0 - con * rh * math.cos(lon - long0);
        //trace(p.toString());
        return p;
      } else if (sinlat0.abs() < consts.EPSLN) {
        //Eq
        //trace('stere:equateur');
        A = 2 * a * k0 / (1 + cosX * math.cos(dlon));
        p.y = A * sinX;
      } else {
        //other case
        //trace('stere:normal case');
        A = 2 *
            a *
            k0 *
            ms1 /
            (cosX0 * (1 + sinX0 * sinX + cosX0 * cosX * math.cos(dlon)));
        p.y = A * (cosX0 * sinX - sinX0 * cosX * math.cos(dlon)) + y0;
      }
      p.x = A * cosX * math.sin(dlon) + x0;
    }
    //trace(p.toString());
    return p;
  }

  @override
  Point inverse(Point p) {
    p.x -= x0;
    p.y -= y0;
    double lon, lat, ts, ce, Chi;
    var rh = math.sqrt(p.x * p.x + p.y * p.y);
    if (sphere != null && sphere) {
      var c = 2 * math.atan(rh / (2 * a * k0));
      lon = long0;
      lat = lat0;
      if (rh <= consts.EPSLN) {
        p.x = lon;
        p.y = lat;
        return p;
      }
      lat = math.asin(math.cos(c) * sinlat0 + p.y * math.sin(c) * coslat0 / rh);
      if (coslat0.abs() < consts.EPSLN) {
        if (lat0 > 0) {
          lon = utils.adjust_lon(long0 + math.atan2(p.x, -1 * p.y));
        } else {
          lon = utils.adjust_lon(long0 + math.atan2(p.x, p.y));
        }
      } else {
        lon = utils.adjust_lon(long0 +
            math.atan2(p.x * math.sin(c),
                rh * coslat0 * math.cos(c) - p.y * sinlat0 * math.sin(c)));
      }
      p.x = lon;
      p.y = lat;
      return p;
    } else {
      if (coslat0.abs() <= consts.EPSLN) {
        if (rh <= consts.EPSLN) {
          lat = lat0;
          lon = long0;
          p.x = lon;
          p.y = lat;
          //trace(p.toString());
          return p;
        }
        p.x *= con;
        p.y *= con;
        ts = rh * cons / (2 * a * k0);
        lat = con * utils.phi2z(e, ts);
        lon = con * utils.adjust_lon(con * long0 + math.atan2(p.x, -1 * p.y));
      } else {
        ce = 2 * math.atan(rh * cosX0 / (2 * a * k0 * ms1));
        lon = long0;
        if (rh <= consts.EPSLN) {
          Chi = X0;
        } else {
          Chi =
              math.asin(math.cos(ce) * sinX0 + p.y * math.sin(ce) * cosX0 / rh);
          lon = utils.adjust_lon(long0 +
              math.atan2(p.x * math.sin(ce),
                  rh * cosX0 * math.cos(ce) - p.y * sinX0 * math.sin(ce)));
        }
        lat = -1 * utils.phi2z(e, math.tan(0.5 * (consts.HALF_PI + Chi)));
      }
    }
    p.x = lon;
    p.y = lat;

    //trace(p.toString());
    return p;
  }
}
