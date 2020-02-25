import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/classes/projection.dart';
import 'package:proj4dart/src/constants/values.dart' as consts;

var iterations = 1;

class NewZealandMapGridProjection extends Projection {
  static final List<String> names = ['New_Zealand_Map_Grid', 'nzmg'];

  double lat0;
  double long0;
  double x0;
  double y0;

  var A = List<double>(11);
  var B_re = List<double>(7);
  var B_im = List<double>(7);
  var C_re = List<double>(7);
  var C_im = List<double>(7);
  var D = List<double>(10);

  NewZealandMapGridProjection.init(ProjParams params)
      : lat0 = params.lat0,
        long0 = params.long0,
        x0 = params.x0,
        y0 = params.y0,
        super.init(params) {
    A[1] = 0.6399175073;
    A[2] = -0.1358797613;
    A[3] = 0.063294409;
    A[4] = -0.02526853;
    A[5] = 0.0117879;
    A[6] = -0.0055161;
    A[7] = 0.0026906;
    A[8] = -0.001333;
    A[9] = 0.00067;
    A[10] = -0.00034;

    B_re[1] = 0.7557853228;
    B_im[1] = 0;
    B_re[2] = 0.249204646;
    B_im[2] = 0.003371507;
    B_re[3] = -0.001541739;
    B_im[3] = 0.041058560;
    B_re[4] = -0.10162907;
    B_im[4] = 0.01727609;
    B_re[5] = -0.26623489;
    B_im[5] = -0.36249218;
    B_re[6] = -0.6870983;
    B_im[6] = -1.1651967;

    C_re[1] = 1.3231270439;
    C_im[1] = 0;
    C_re[2] = -0.577245789;
    C_im[2] = -0.007809598;
    C_re[3] = 0.508307513;
    C_im[3] = -0.112208952;
    C_re[4] = -0.15094762;
    C_im[4] = 0.18200602;
    C_re[5] = 1.01418179;
    C_im[5] = 1.64497696;
    C_re[6] = 1.9660549;
    C_im[6] = 2.5127645;

    D[1] = 1.5627014243;
    D[2] = 0.5185406398;
    D[3] = -0.03333098;
    D[4] = -0.1052906;
    D[5] = -0.0368594;
    D[6] = 0.007317;
    D[7] = 0.01220;
    D[8] = 0.00394;
    D[9] = -0.0013;
  }

  @override
  Point forward(Point p) {
    int n;
    var lon = p.x;
    var lat = p.y;

    var delta_lat = lat - lat0;
    var delta_lon = lon - long0;

    // 1. Calculate d_phi and d_psi    ...                          // and d_lambda
    // For this algorithm, delta_latitude is in seconds of arc x 10-5, so we need to scale to those units. Longitude is radians.
    var d_phi = delta_lat / consts.SEC_TO_RAD * 1E-5;
    var d_lambda = delta_lon;
    var d_phi_n = 1.0; // d_phi^0

    var d_psi = 0.0;
    for (n = 1; n <= 10; n++) {
      d_phi_n = d_phi_n * d_phi;
      d_psi = d_psi + A[n] * d_phi_n;
    }

    // 2. Calculate theta
    var th_re = d_psi;
    var th_im = d_lambda;

    // 3. Calculate z
    var th_n_re = 1.0;
    var th_n_im = 0.0; // theta^0
    var th_n_re1;
    var th_n_im1;

    var z_re = 0.0;
    var z_im = 0.0;
    for (n = 1; n <= 6; n++) {
      th_n_re1 = th_n_re * th_re - th_n_im * th_im;
      th_n_im1 = th_n_im * th_re + th_n_re * th_im;
      th_n_re = th_n_re1;
      th_n_im = th_n_im1;
      z_re = z_re + B_re[n] * th_n_re - B_im[n] * th_n_im;
      z_im = z_im + B_im[n] * th_n_re + B_re[n] * th_n_im;
    }

    // 4. Calculate easting and northing
    p.x = (z_im * a) + x0;
    p.y = (z_re * a) + y0;

    return p;
  }

  @override
  Point inverse(Point p) {
    int n;
    var x = p.x;
    var y = p.y;

    var delta_x = x - x0;
    var delta_y = y - y0;

    // 1. Calculate z
    var z_re = delta_y / a;
    var z_im = delta_x / a;

    // 2a. Calculate theta - first approximation gives km accuracy
    var z_n_re = 1.0;
    var z_n_im = 0.0; // z^0
    var z_n_re1;
    var z_n_im1;

    var th_re = 0.0;
    var th_im = 0.0;
    for (n = 1; n <= 6; n++) {
      z_n_re1 = z_n_re * z_re - z_n_im * z_im;
      z_n_im1 = z_n_im * z_re + z_n_re * z_im;
      z_n_re = z_n_re1;
      z_n_im = z_n_im1;
      th_re = th_re + C_re[n] * z_n_re - C_im[n] * z_n_im;
      th_im = th_im + C_im[n] * z_n_re + C_re[n] * z_n_im;
    }

    // 2b. Iterate to refine the accuracy of the calculation
    //        0 iterations gives km accuracy
    //        1 iteration gives m accuracy -- good enough for most mapping applications
    //        2 iterations bives mm accuracy
    for (var i = 0; i < iterations; i++) {
      var th_n_re = th_re;
      var th_n_im = th_im;
      var th_n_re1;
      var th_n_im1;

      var num_re = z_re;
      var num_im = z_im;
      for (n = 2; n <= 6; n++) {
        th_n_re1 = th_n_re * th_re - th_n_im * th_im;
        th_n_im1 = th_n_im * th_re + th_n_re * th_im;
        th_n_re = th_n_re1;
        th_n_im = th_n_im1;
        num_re = num_re + (n - 1) * (B_re[n] * th_n_re - B_im[n] * th_n_im);
        num_im = num_im + (n - 1) * (B_im[n] * th_n_re + B_re[n] * th_n_im);
      }

      th_n_re = 1.0;
      th_n_im = 0.0;
      var den_re = B_re[1];
      var den_im = B_im[1];
      for (n = 2; n <= 6; n++) {
        th_n_re1 = th_n_re * th_re - th_n_im * th_im;
        th_n_im1 = th_n_im * th_re + th_n_re * th_im;
        th_n_re = th_n_re1;
        th_n_im = th_n_im1;
        den_re = den_re + n * (B_re[n] * th_n_re - B_im[n] * th_n_im);
        den_im = den_im + n * (B_im[n] * th_n_re + B_re[n] * th_n_im);
      }

      // Complex division
      var den2 = den_re * den_re + den_im * den_im;
      th_re = (num_re * den_re + num_im * den_im) / den2;
      th_im = (num_im * den_re - num_re * den_im) / den2;
    }

    // 3. Calculate d_phi              ...                                    // and d_lambda
    var d_psi = th_re;
    var d_lambda = th_im;
    var d_psi_n = 1.0; // d_psi^0

    var d_phi = 0.0;
    for (n = 1; n <= 9; n++) {
      d_psi_n = d_psi_n * d_psi;
      d_phi = d_phi + D[n] * d_psi_n;
    }

    // 4. Calculate latitude and longitude
    // d_phi is calcuated in second of arc * 10^-5, so we need to scale back to radians. d_lambda is in radians.
    var lat = lat0 + (d_phi * consts.SEC_TO_RAD * 1E5);
    var lon = long0 + d_lambda;

    p.x = lon;
    p.y = lat;

    return p;
  }
}
