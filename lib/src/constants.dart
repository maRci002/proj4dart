import 'dart:math' as math;

const pjd3Param = 1;
const pjd7Param = 2;
const pjdWgs84 = 4; // WGS84 or equivalent
const pjdNoDatum = 5; // WGS84 or equivalent
const secToRad = 4.84813681109535993589914102357e-6;
const halfPi = math.pi / 2;
// ellipoid pj_set_ell.c
const sixth = 0.1666666666666666667;
/* 1/6 */
const ra4 = 0.04722222222222222222;
/* 17/360 */
const ra6 = 0.02215608465608465608;
const epsln = 1.0e-10;
// you'd think you could use Number.EPSILON above but that makes
// Mollweide get into an infinate loop.

const d2r = 0.01745329251994329577;
const r2d = 57.29577951308232088;
const fortPi = math.pi / 4;
const twoPi = math.pi * 2;
// SPI is slightly greater than Math.PI, so values that exceed the -180..180
// degree range by a tiny amount don't get wrapped. This prevents points that
// have drifted from their original location along the 180th meridian (due to
// floating point error) from changing their sign.
const spi = 3.14159265359;
