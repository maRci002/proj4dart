import 'dart:math' as math;

import 'package:proj4dart/src/classes/datum.dart';
import 'package:proj4dart/src/classes/nadgrid.dart';
import 'package:proj4dart/src/classes/point.dart';
import 'package:proj4dart/src/common/datum_utils.dart' as datum_utils;
import 'package:proj4dart/src/common/utils.dart' as utils;
import 'package:proj4dart/src/constants/values.dart' as consts;

bool checkParams(int type) {
  return (type == consts.PJD_3PARAM || type == consts.PJD_7PARAM);
}

Point transform(Datum source, Datum dest, Point point) {
  // Short cut if the datums are identical.
  if (datum_utils.compareDatums(source, dest)) {
    return point; // in this case, zero is sucess,
    // whereas cs_compare_datums returns 1 to indicate TRUE
    // confusing, should fix this
  }

  // Explicitly skip datum transform by setting 'datum=none' as parameter for either source or dest
  if (source.datumType == consts.PJD_NODATUM ||
      dest.datumType == consts.PJD_NODATUM) {
    return point;
  }

  // If this datum requires grid shifts, then apply it to geodetic coordinates.
  var source_a = source.a;
  var source_es = source.es;
  if (source.datumType == consts.PJD_GRIDSHIFT) {
    applyGridShift(source, false, point);
    source_a = consts.SRS_WGS84_SEMIMAJOR;
    source_es = consts.SRS_WGS84_ESQUARED;
  }

  var dest_a = dest.a;
  var dest_b = dest.b;
  var dest_es = dest.es;
  if (dest.datumType == consts.PJD_GRIDSHIFT) {
    dest_a = consts.SRS_WGS84_SEMIMAJOR;
    dest_b = consts.SRS_WGS84_SEMIMINOR;
    dest_es = consts.SRS_WGS84_ESQUARED;
  }

  // Do we need to go through geocentric coordinates?
  if (source_es == dest_es &&
      source_a == dest_a &&
      !checkParams(source.datumType) &&
      !checkParams(dest.datumType)) {
    return point;
  }

  // Convert to geocentric coordinates.
  point = datum_utils.geodeticToGeocentric(point, source_es, source_a);
  // Convert between datums
  if (checkParams(source.datumType)) {
    point = datum_utils.geocentricToWgs84(
        point, source.datumType, source.datumParams);
  }
  if (checkParams(dest.datumType)) {
    point = datum_utils.geocentricFromWgs84(
        point, dest.datumType, dest.datumParams);
  }
  point = datum_utils.geocentricToGeodetic(point, dest_es, dest_a, dest_b);

  if (dest.datumType == consts.PJD_GRIDSHIFT) {
    applyGridShift(dest, true, point);
  }

  return point;
}

void applyGridShift(Datum source, bool inverse, Point point) {
  if (source.grids == null || source.grids!.isEmpty) {
    throw Exception('Grid shift grids not found');
  }
  var input = Point(x: -point.x, y: point.y);
  var output = Point(x: double.nan, y: double.nan);
  // var onlyMandatoryGrids = false;
  var attemptedGrids = <String>[];
  for (var i = 0; i < source.grids!.length; i++) {
    var grid = source.grids![i];
    attemptedGrids.add(grid.name);
    if (grid.isNull) {
      output = input;
      break;
    }
    // onlyMandatoryGrids = grid.mandatory;
    if (grid.grid == null) {
      if (grid.mandatory) {
        throw Exception("Unable to find mandatory grid '${grid.name}'");
      }
      continue;
    }
    var subgrid = grid.grid!.subgrids[0];
    // skip tables that don't match our point at all
    var epsilon = ((subgrid.del[1]).abs() + (subgrid.del[0]).abs()) / 10000.0;
    var minX = subgrid.ll[0] - epsilon;
    var minY = subgrid.ll[1] - epsilon;
    var maxX = subgrid.ll[0] + (subgrid.lim[0] - 1) * subgrid.del[0] + epsilon;
    var maxY = subgrid.ll[1] + (subgrid.lim[1] - 1) * subgrid.del[1] + epsilon;
    if (minY > input.y || minX > input.x || maxY < input.y || maxX < input.x) {
      continue;
    }
    output = applySubgridShift(input, inverse, subgrid);
    if (!(output.x).isNaN) {
      break;
    }
  }
  if ((output.x).isNaN) {
    throw Exception(
      "Failed to find a grid shift table for location '${-input.x * consts.R2D} ${input.y * consts.R2D} tried: $attemptedGrids'",
    );
  }
  point.x = -output.x;
  point.y = output.y;
}

Point applySubgridShift(Point pin, bool inverse, SubGrid ct) {
  var val = Point(x: double.nan, y: double.nan);
  if (pin.x.isNaN) {
    return val;
  }
  var tb = Point(x: pin.x, y: pin.y);
  tb.x -= ct.ll[0];
  tb.y -= ct.ll[1];
  tb.x = utils.adjust_lon(tb.x - math.pi) + math.pi;
  var t = nadInterpolate(tb, ct);
  if (inverse) {
    if (t.x.isNaN) {
      return val;
    }
    t.x = tb.x - t.x;
    t.y = tb.y - t.y;
    var i = 9, tol = 1e-12;
    Point dif, del;
    do {
      del = nadInterpolate(t, ct);
      if (del.x.isNaN) {
        print(
          'Inverse grid shift iteration failed, presumably at grid edge.  Using first approximation.',
        );
        break;
      }
      dif = Point(x: tb.x - (del.x + t.x), y: tb.y - (del.y + t.y));
      t.x += dif.x;
      t.y += dif.y;
    } while (i-- != 0 && dif.x.abs() > tol && dif.y.abs() > tol);
    if (i < 0) {
      print('Inverse grid shift iterator failed to converge.');
      return val;
    }
    val.x = utils.adjust_lon(t.x + ct.ll[0]);
    val.y = t.y + ct.ll[1];
  } else {
    if (!t.x.isNaN) {
      val.x = pin.x + t.x;
      val.y = pin.y + t.y;
    }
  }
  return val;
}

Point nadInterpolate(Point pin, SubGrid ct) {
  var t = Point(x: pin.x / ct.del[0], y: pin.y / ct.del[1]);
  var indx = Point(x: t.x.floorToDouble(), y: t.y.floorToDouble());
  var frct = Point(x: t.x - 1.0 * indx.x, y: t.y - 1.0 * indx.y);
  var val = Point(x: double.nan, y: double.nan);
  int inx;
  if (indx.x < 0 || indx.x >= ct.lim[0]) {
    return val;
  }
  if (indx.y < 0 || indx.y >= ct.lim[1]) {
    return val;
  }
  inx = ((indx.y * ct.lim[0]) + indx.x).toInt();
  var f00 = Point(x: ct.cvs[inx][0], y: ct.cvs[inx][1]);
  inx++;
  var f10 = Point(x: ct.cvs[inx][0], y: ct.cvs[inx][1]);
  inx += ct.lim[0];
  var f11 = Point(x: ct.cvs[inx][0], y: ct.cvs[inx][1]);
  inx--;
  var f01 = Point(x: ct.cvs[inx][0], y: ct.cvs[inx][1]);
  var m11 = frct.x * frct.y,
      m10 = frct.x * (1.0 - frct.y),
      m00 = (1.0 - frct.x) * (1.0 - frct.y),
      m01 = (1.0 - frct.x) * frct.y;
  val.x = (m00 * f00.x + m10 * f10.x + m01 * f01.x + m11 * f11.x);
  val.y = (m00 * f00.y + m10 * f10.y + m01 * f01.y + m11 * f11.y);
  return val;
}
