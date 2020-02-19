import 'dart:math' as math;

class ConstValues {
  static final PJD_3PARAM = 1;
  static final PJD_7PARAM = 2;
  static final PJD_WGS84 = 4; // WGS84 or equivalent
  static final PJD_NODATUM = 5; // WGS84 or equivalent
  static final SEC_TO_RAD = 4.84813681109535993589914102357e-6;
  static final HALF_PI = math.pi / 2;
// ellipoid pj_set_ell.c
  static final SIXTH = 0.1666666666666666667;
/* 1/6 */
  static final RA4 = 0.04722222222222222222;
/* 17/360 */
  static final RA6 = 0.02215608465608465608;
  static final EPSLN = 1.0e-10;
// you'd think you could use Number.EPSILON above but that makes
// Mollweide get into an infinate loop.

  static final D2R = 0.01745329251994329577;
  static final R2D = 57.29577951308232088;
  static final FORTPI = math.pi / 4;
  static final TWO_PI = math.pi * 2;
// SPI is slightly greater than Math.PI, so values that exceed the -180..180
// degree range by a tiny amount don't get wrapped. This prevents points that
// have drifted from their original location along the 180th meridian (due to
// floating point error) from changing their sign.
  static final SPI = 3.14159265359;
}
