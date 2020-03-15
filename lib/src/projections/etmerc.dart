import 'dart:math' as math;

import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/common/utils.dart' as utils;

class ExtendedTransverseMercatorProjection extends Projection {
  static final List<String> names = [
    'Extended_Transverse_Mercator',
    'Extended Transverse Mercator',
    'etmerc'
  ];

  double x0;
  double y0;
  double long0;
  double lat0;
  double Qn;
  double Zb;
  List<double> cgb;
  List<double> cbg;
  List<double> utg;
  List<double> gtu;

  ExtendedTransverseMercatorProjection.init(ProjParams params)
      : super.init(params) {
    es = params.es;
    if (es == null || es <= 0) {
      throw Exception('Incorrect elliptical usage');
    }
    x0 = x0 ?? 0;
    y0 = y0 ?? 0;
    if (long0 == null || long0.isNaN) {
      long0 = 0;
    }
    lat0 = lat0 ?? 0;

    cgb = List<double>(6);
    cbg = List<double>(6);
    utg = List<double>(6);
    gtu = List<double>(6);

    var f = es / (1 + math.sqrt(1 - es));
    var n = f / (2 - f);
    var np = n;

    cgb[0] = n *
        (2 +
            n *
                (-2 / 3 +
                    n *
                        (-2 +
                            n *
                                (116 / 45 +
                                    n * (26 / 45 + n * (-2854 / 675))))));
    cbg[0] = n *
        (-2 +
            n *
                (2 / 3 +
                    n *
                        (4 / 3 +
                            n *
                                (-82 / 45 +
                                    n * (32 / 45 + n * (4642 / 4725))))));

    np = np * n;
    cgb[1] = np *
        (7 / 3 +
            n *
                (-8 / 5 +
                    n * (-227 / 45 + n * (2704 / 315 + n * (2323 / 945)))));
    cbg[1] = np *
        (5 / 3 +
            n *
                (-16 / 15 +
                    n * (-13 / 9 + n * (904 / 315 + n * (-1522 / 945)))));

    np = np * n;
    cgb[2] = np *
        (56 / 15 + n * (-136 / 35 + n * (-1262 / 105 + n * (73814 / 2835))));
    cbg[2] =
        np * (-26 / 15 + n * (34 / 21 + n * (8 / 5 + n * (-12686 / 2835))));

    np = np * n;
    cgb[3] = np * (4279 / 630 + n * (-332 / 35 + n * (-399572 / 14175)));
    cbg[3] = np * (1237 / 630 + n * (-12 / 5 + n * (-24832 / 14175)));

    np = np * n;
    cgb[4] = np * (4174 / 315 + n * (-144838 / 6237));
    cbg[4] = np * (-734 / 315 + n * (109598 / 31185));

    np = np * n;
    cgb[5] = np * (601676 / 22275);
    cbg[5] = np * (444337 / 155925);

    np = math.pow(n, 2);
    Qn = k0 / (1 + n) * (1 + np * (1 / 4 + np * (1 / 64 + np / 256)));

    utg[0] = n *
        (-0.5 +
            n *
                (2 / 3 +
                    n *
                        (-37 / 96 +
                            n *
                                (1 / 360 +
                                    n * (81 / 512 + n * (-96199 / 604800))))));
    gtu[0] = n *
        (0.5 +
            n *
                (-2 / 3 +
                    n *
                        (5 / 16 +
                            n *
                                (41 / 180 +
                                    n * (-127 / 288 + n * (7891 / 37800))))));

    utg[1] = np *
        (-1 / 48 +
            n *
                (-1 / 15 +
                    n *
                        (437 / 1440 +
                            n * (-46 / 105 + n * (1118711 / 3870720)))));
    gtu[1] = np *
        (13 / 48 +
            n *
                (-3 / 5 +
                    n *
                        (557 / 1440 +
                            n * (281 / 630 + n * (-1983433 / 1935360)))));

    np = np * n;
    utg[2] = np *
        (-17 / 480 + n * (37 / 840 + n * (209 / 4480 + n * (-5569 / 90720))));
    gtu[2] = np *
        (61 / 240 +
            n * (-103 / 140 + n * (15061 / 26880 + n * (167603 / 181440))));

    np = np * n;
    utg[3] = np * (-4397 / 161280 + n * (11 / 504 + n * (830251 / 7257600)));
    gtu[3] = np * (49561 / 161280 + n * (-179 / 168 + n * (6601661 / 7257600)));

    np = np * n;
    utg[4] = np * (-4583 / 161280 + n * (108847 / 3991680));
    gtu[4] = np * (34729 / 80640 + n * (-3418889 / 1995840));

    np = np * n;
    utg[5] = np * (-20648693 / 638668800);
    gtu[5] = np * (212378941 / 319334400);

    var Z = utils.gatg(cbg, lat0);
    Zb = -Qn * (Z + utils.clens(gtu, 2 * Z));
  }

  @override
  Point forward(Point p) {
    var Ce = utils.adjust_lon(p.x - long0);
    var Cn = p.y;

    Cn = utils.gatg(cbg, Cn);
    var sin_Cn = math.sin(Cn);
    var cos_Cn = math.cos(Cn);
    var sin_Ce = math.sin(Ce);
    var cos_Ce = math.cos(Ce);

    Cn = math.atan2(sin_Cn, cos_Ce * cos_Cn);
    Ce = math.atan2(sin_Ce * cos_Cn, utils.hypot(sin_Cn, cos_Cn * cos_Ce));
    Ce = utils.asinhy(math.tan(Ce));

    var tmp = utils.clens_cmplx(gtu, 2 * Cn, 2 * Ce);

    Cn = Cn + tmp[0];
    Ce = Ce + tmp[1];

    double x;
    double y;

    if (Ce.abs() <= 2.623395162778) {
      x = a * (Qn * Ce) + x0;
      y = a * (Qn * Cn + Zb) + y0;
    } else {
      x = double.infinity;
      y = double.infinity;
    }

    p.x = x;
    p.y = y;

    return p;
  }

  @override
  Point inverse(Point p) {
    var Ce = (p.x - x0) * (1 / a);
    var Cn = (p.y - y0) * (1 / a);

    Cn = (Cn - Zb) / Qn;
    Ce = Ce / Qn;

    double lon;
    double lat;

    if (Ce.abs() <= 2.623395162778) {
      var tmp = utils.clens_cmplx(utg, 2 * Cn, 2 * Ce);

      Cn = Cn + tmp[0];
      Ce = Ce + tmp[1];
      Ce = math.atan(utils.sinh(Ce));

      var sin_Cn = math.sin(Cn);
      var cos_Cn = math.cos(Cn);
      var sin_Ce = math.sin(Ce);
      var cos_Ce = math.cos(Ce);

      Cn = math.atan2(sin_Cn * cos_Ce, utils.hypot(sin_Ce, cos_Ce * cos_Cn));
      Ce = math.atan2(sin_Ce, cos_Ce * cos_Cn);

      lon = utils.adjust_lon(Ce + long0);
      lat = utils.gatg(cgb, Cn);
    } else {
      lon = double.infinity;
      lat = double.infinity;
    }

    p.x = lon;
    p.y = lat;

    return p;
  }
}
