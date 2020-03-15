import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/common/utils.dart' as utils;
import 'package:proj4dart/src/constants/values.dart' as consts;

var COEFS_X = [
  [1.0000, 2.2199e-17, -7.15515e-05, 3.1103e-06],
  [0.9986, -0.000482243, -2.4897e-05, -1.3309e-06],
  [0.9954, -0.00083103, -4.48605e-05, -9.86701e-07],
  [0.9900, -0.00135364, -5.9661e-05, 3.6777e-06],
  [0.9822, -0.00167442, -4.49547e-06, -5.72411e-06],
  [0.9730, -0.00214868, -9.03571e-05, 1.8736e-08],
  [0.9600, -0.00305085, -9.00761e-05, 1.64917e-06],
  [0.9427, -0.00382792, -6.53386e-05, -2.6154e-06],
  [0.9216, -0.00467746, -0.00010457, 4.81243e-06],
  [0.8962, -0.00536223, -3.23831e-05, -5.43432e-06],
  [0.8679, -0.00609363, -0.000113898, 3.32484e-06],
  [0.8350, -0.00698325, -6.40253e-05, 9.34959e-07],
  [0.7986, -0.00755338, -5.00009e-05, 9.35324e-07],
  [0.7597, -0.00798324, -3.5971e-05, -2.27626e-06],
  [0.7186, -0.00851367, -7.01149e-05, -8.6303e-06],
  [0.6732, -0.00986209, -0.000199569, 1.91974e-05],
  [0.6213, -0.010418, 8.83923e-05, 6.24051e-06],
  [0.5722, -0.00906601, 0.000182, 6.24051e-06],
  [0.5322, -0.00677797, 0.000275608, 6.24051e-06]
];

var COEFS_Y = [
  [-5.20417e-18, 0.0124, 1.21431e-18, -8.45284e-11],
  [0.0620, 0.0124, -1.26793e-09, 4.22642e-10],
  [0.1240, 0.0124, 5.07171e-09, -1.60604e-09],
  [0.1860, 0.0123999, -1.90189e-08, 6.00152e-09],
  [0.2480, 0.0124002, 7.10039e-08, -2.24e-08],
  [0.3100, 0.0123992, -2.64997e-07, 8.35986e-08],
  [0.3720, 0.0124029, 9.88983e-07, -3.11994e-07],
  [0.4340, 0.0123893, -3.69093e-06, -4.35621e-07],
  [0.4958, 0.0123198, -1.02252e-05, -3.45523e-07],
  [0.5571, 0.0121916, -1.54081e-05, -5.82288e-07],
  [0.6176, 0.0119938, -2.41424e-05, -5.25327e-07],
  [0.6769, 0.011713, -3.20223e-05, -5.16405e-07],
  [0.7346, 0.0113541, -3.97684e-05, -6.09052e-07],
  [0.7903, 0.0109107, -4.89042e-05, -1.04739e-06],
  [0.8435, 0.0103431, -6.4615e-05, -1.40374e-09],
  [0.8936, 0.00969686, -6.4636e-05, -8.547e-06],
  [0.9394, 0.00840947, -0.000192841, -4.2106e-06],
  [0.9761, 0.00616527, -0.000256, -4.2106e-06],
  [1.0000, 0.00328947, -0.000319159, -4.2106e-06]
];

var FXC = 0.8487;
var FYC = 1.3523;
var C1 = consts.R2D / 5; // rad to 5-degree interval
var RC1 = 1 / C1;
var NODES = 18;

class RobinsonProjection extends Projection {
  static final List<String> names = ['Robinson', 'robin'];

  double x0;
  double y0;
  double long0;
  @override
  double es;
  String title;

  RobinsonProjection.init(ProjParams params)
      : x0 = params.x0 ?? 0.0,
        y0 = params.y0 ?? 0.0,
        long0 = params.long0 == null || params.long0.isNaN ? 0.0 : params.long0,
        es = 0.0,
        title = params.title ?? 'Robinson',
        super.init(params);

  @override
  Point forward(Point ll) {
    var lon = utils.adjust_lon(ll.x - long0);

    var dphi = ll.y.abs();
    var i = (dphi * C1).floor();
    if (i < 0) {
      i = 0;
    } else if (i >= NODES) {
      i = NODES - 1;
    }
    dphi = consts.R2D * (dphi - RC1 * i);
    var xy = Point(
        x: _poly3_val(COEFS_X[i], dphi) * lon, y: _poly3_val(COEFS_Y[i], dphi));
    if (ll.y < 0) {
      xy.y = -xy.y;
    }

    xy.x = xy.x * a * FXC + x0;
    xy.y = xy.y * a * FYC + y0;
    return xy;
  }

  @override
  Point inverse(Point xy) {
    var ll =
        Point(x: (xy.x - x0) / (a * FXC), y: (xy.y - y0).abs() / (a * FYC));

    if (ll.y >= 1) {
      // pathologic case
      ll.x /= COEFS_X[NODES][0];
      ll.y = xy.y < 0 ? -consts.HALF_PI : consts.HALF_PI;
    } else {
      // find table interval
      var i = (ll.y * NODES).floor();
      if (i < 0) {
        i = 0;
      } else if (i >= NODES) {
        i = NODES - 1;
      }
      for (;;) {
        if (COEFS_Y[i][0] > ll.y) {
          --i;
        } else if (COEFS_Y[i + 1][0] <= ll.y) {
          ++i;
        } else {
          break;
        }
      }
      // linear interpolation in 5 degree interval
      var coefs = COEFS_Y[i];
      var t = 5 * (ll.y - coefs[0]) / (COEFS_Y[i + 1][0] - coefs[0]);
      // find t so that poly3_val(coefs, t) = ll.y
      t = _newton_rapshon(
          (x) => (_poly3_val(coefs, x) - ll.y) / _poly3_der(coefs, x),
          t,
          consts.EPSLN,
          100);

      ll.x /= _poly3_val(COEFS_X[i], t);
      ll.y = (5 * i + t) * consts.D2R;
      if (xy.y < 0) {
        ll.y = -ll.y;
      }
    }

    ll.x = utils.adjust_lon(ll.x + long0);
    return ll;
  }

  double _poly3_val(List<double> coefs, double x) {
    return coefs[0] + x * (coefs[1] + x * (coefs[2] + x * coefs[3]));
  }

  double _poly3_der(List<double> coefs, double x) {
    return coefs[1] + x * (2 * coefs[2] + x * 3 * coefs[3]);
  }

  double _newton_rapshon(Function f_df, double start, max_err, iters) {
    var x = start;
    for (var i = 0; i < iters; i++) {
      var upd = f_df(x);
      x -= upd;
      if (upd.abs() < max_err) {
        break;
      }
    }
    return x;
  }
}
