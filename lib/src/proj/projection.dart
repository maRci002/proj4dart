import 'dart:math' as math;

import 'package:proj4dart/src/ellipsoid.dart';
import 'package:proj4dart/src/proj_coordinate.dart';
import 'package:proj4dart/src/units/unit.dart';
import 'package:proj4dart/src/proj_math.dart';
import 'package:proj4dart/src/units/units.dart';

class Projection {
  var minLatitude = -math.pi / 2;

  /// The minimum longitude of the bounds of this projection. This is relative to the projection centre.
  var minLongitude = -math.pi;

  /// The maximum latitude of the bounds of this projection
  var maxLatitude = math.pi / 2;

  /// The maximum longitude of the bounds of this projection. This is relative to the projection centre.
  var maxLongitude = math.pi;

  /**
   * The latitude of the centre of projection
   */
  var projectionLatitude = 0.0;

  /**
   * The longitude of the centre of projection, in radians
   */
  var projectionLongitude = 0.0;

  /**
   * Standard parallel 1 (for projections which use it)
   */
  var projectionLatitude1 = 0.0;

  /**
   * Standard parallel 2 (for projections which use it)
   */
  var projectionLatitude2 = 0.0;

  /**
   * The projection alpha value
   */
  var alpha = double.nan;

  /**
   * The projection lonc value
   */
  var lonc = double.nan;

  /**
   * The projection scale factor
   */
  var scaleFactor = 1.0;

  /**
   * The false Easting of this projection
   */
  var falseEasting = 0.0;

  /**
   * The false Northing of this projection
   */
  var falseNorthing = 0.0;

  /**
   * Indicates whether a Southern Hemisphere UTM zone
   */
  var isSouth = false;
  /**
   * The latitude of true scale. Only used by specific projections.
   */
  var trueScaleLatitude = 0.0;

  /**
   * The equator radius
   */
  var a = 0.0;

  /**
   * The eccentricity
   */
  var e = 0.0;

  /**
   * The eccentricity squared
   */
  var es = 0.0;

  /**
   * 1-(eccentricity squared)
   */
  var one_es = 0.0;

  /**
   * 1/(1-(eccentricity squared))
   */
  var rone_es = 0.0;

  /**
   * The ellipsoid used by this projection
   */
  Ellipsoid ellipsoid;

  /**
   * True if this projection is using a sphere (es == 0)
   */
  bool spherical;

  /**
   * True if this projection is geocentric
   */
  bool geocentric;

  /**
   * The name of this projection
   */
  String name = null;

  /**
   * Conversion factor from metres to whatever units the projection uses.
   */
  var fromMetres = 1.0;

  /**
   * The total scale factor = Earth radius * units
   */
  var totalScale = 0.0;

  /**
   * falseEasting, adjusted to the appropriate units using fromMetres
   */
  var totalFalseEasting = 0.0;

  /**
   * falseNorthing, adjusted to the appropriate units using fromMetres
   */
  var totalFalseNorthing = 0.0;

  /**
   * units of this projection.  Default is metres, but may be degrees
   */
  Unit unit = null;

  // Some useful constants
  static final double EPS10 = 1e-10;
  static final double RTD = 180.0 / math.pi;
  static final double DTR = math.pi / 180.0;

  Projection() {
    setEllipsoid(Ellipsoid.SPHERE);
  }

  //  Object clone() {
  // 	try {
  // 		Projection e = (Projection)super.clone();
  // 		return e;
  // 	}
  // 	catch ( CloneNotSupportedException e ) {
  // 		throw new InternalError();
  // 	}
  // }

  // /**
  //  * Projects a geographic point (in degrees), producing a projected result
  //  * (in the units of the target coordinate system).
  //  *
  //  * @param src the input geographic coordinate (in degrees)
  //  * @param dst the projected coordinate (in coordinate system units)
  //  * @return the target coordinate
  //  */
  ProjCoordinate project(ProjCoordinate src, ProjCoordinate dst) {
    var x = src.x * DTR;
    if (projectionLongitude != 0) {
      x = ProjectionMath.normalizeLongitude(x - projectionLongitude);
    }
    return projectRadiansV2(x, src.y * DTR, dst);
  }

  // /**
  //  * Projects a geographic point (in radians), producing a projected result
  //  * (in the units of the target coordinate system).
  //  *
  //  * @param src the input geographic coordinate (in radians)
  //  * @param dst the projected coordinate (in coordinate system units)
  //  * @return the target coordinate
  //  *
  //  */
  ProjCoordinate projectRadians(ProjCoordinate src, ProjCoordinate dst) {
    var x = src.x;
    if (projectionLongitude != 0) {
      x = ProjectionMath.normalizeLongitude(x - projectionLongitude);
    }
    return projectRadiansV2(x, src.y, dst);
  }

  // /**
  //  * Transform a geographic point (in radians),
  //  * producing a projected result (in the units of the target coordinate system).
  //  *
  //  * @param x the geographic x ordinate (in radians)
  //  * @param y the geographic y ordinate (in radians)
  //  * @param dst the projected coordinate (in coordinate system units)
  //  * @return the target coordinate
  //  */
  ProjCoordinate projectRadiansV2(double x, double y, ProjCoordinate dst) {
    projectV2(x, y, dst);
    if (unit == Units.DEGREES) {
      // convert radians to DD
      dst.x *= RTD;
      dst.y *= RTD;
    } else {
      // assume result is in metres
      dst.x = totalScale * dst.x + totalFalseEasting;
      dst.y = totalScale * dst.y + totalFalseNorthing;
    }
    return dst;
  }

  // /**
  //  * Computes the projection of a given point
  //  * (i.e. from geographics to projection space).
  //  * This should be overridden for all projections.
  //  *
  //  * @param x the geographic x ordinate (in radians)
  //  * @param y the geographic y ordinatee (in radians)
  //  * @param dst the projected coordinate (in coordinate system units)
  //  * @return the target coordinate
  //  */
  ProjCoordinate projectV2(double x, double y, ProjCoordinate dst) {
    dst.x = x;
    dst.y = y;
    return dst;
  }

  // /**
  //  * Inverse-projects a point (in the units defined by the coordinate system),
  //  * producing a geographic result (in degrees)
  //  *
  //  * @param src the input projected coordinate (in coordinate system units)
  //  * @param dst the inverse-projected geographic coordinate (in degrees)
  //  * @return the target coordinate
  //  */
  ProjCoordinate inverseProject(ProjCoordinate src, ProjCoordinate dst) {
    inverseProjectRadiansV2(src, dst);
    dst.x *= RTD;
    dst.y *= RTD;
    return dst;
  }

  // /**
  //  * Inverse-transforms a point (in the units defined by the coordinate system),
  //  * producing a geographic result (in radians)
  //  *
  //  * @param src the input projected coordinate (in coordinate system units)
  //  * @param dst the inverse-projected geographic coordinate (in radians)
  //  * @return the target coordinate
  //  *
  //  */
  ProjCoordinate inverseProjectRadiansV2(
      ProjCoordinate src, ProjCoordinate dst) {
    double x;
    double y;
    if (unit == Units.DEGREES) {
      // convert DD to radians
      x = src.x * DTR;
      y = src.y * DTR;
    } else {
      x = (src.x - totalFalseEasting) / totalScale;
      y = (src.y - totalFalseNorthing) / totalScale;
    }
    projectInverse(x, y, dst);
    if (dst.x < -math.pi) {
      dst.x = -math.pi;
    } else if (dst.x > math.pi) {
      dst.x = math.pi;
    }
    if (projectionLongitude != 0) {
      dst.x = ProjectionMath.normalizeLongitude(dst.x + projectionLongitude);
    }
    return dst;
  }

  // /**
  //  * Computes the inverse projection of a given point
  //  * (i.e. from projection space to geographics).
  //  * This should be overridden for all projections.
  //  *
  //  * @param x the projected x ordinate (in coordinate system units)
  //  * @param y the projected y ordinate (in coordinate system units)
  //  * @param dst the inverse-projected geographic coordinate  (in radians)
  //  * @return the target coordinate
  //  */
  ProjCoordinate projectInverse(double x, double y, ProjCoordinate dst) {
    dst.x = x;
    dst.y = y;
    return dst;
  }

  // /**
  //  * Tests whether this projection is conformal.
  //  * A conformal projection preserves local angles.
  //  *
  //  * @return true if this projection is conformal
  //  */
  bool isConformal() {
    return false;
  }

  // /**
  //  * Tests whether this projection is equal-area
  //  * An equal-area projection preserves relative sizes
  //  * of projected areas.
  //  *
  //  * @return true if this projection is equal-area
  //  */
  bool isEqualArea() {
    return false;
  }

  // /**
  //  * Tests whether this projection has an inverse.
  //  * If this method returns <tt>true</tt>
  //  * then the {@link #inverseProject(ProjCoordinate, ProjCoordinate)}
  //  * and {@link #inverseProjectRadians(ProjCoordinate, ProjCoordinate)}
  //  * methods will return meaningful results.
  //  *
  //  * @return true if this projection has an inverse
  //  */
  bool hasInverse() {
    return false;
  }

  // /**
  //  * Tests whether under this projection lines of
  //  * latitude and longitude form a rectangular grid
  //  */
  bool isRectilinear() {
    return false;
  }

  // /**
  //  * Returns true if latitude lines are parallel for this projection
  //  */
  bool parallelsAreParallel() {
    return isRectilinear();
  }

  // /**
  //  * Returns true if the given lat/long point is visible in this projection
  //  */
  bool inside(double x, double y) {
    x = normalizeLongitude(x * DTR - projectionLongitude);
    return minLongitude <= x &&
        x <= maxLongitude &&
        minLatitude <= y &&
        y <= maxLatitude;
  }

  // /**
  //  * Set the name of this projection.
  //  */
  void setName(String name) {
    this.name = name;
  }

  String getName() {
    if (name != null) {
      return name;
    }
    return toString();
  }

  // /**
  //  * Get a string which describes this projection in PROJ.4 format.
  //  * <p>
  //  * WARNING: currently this does not output all required parameters in some cases.
  //  * E.g. for Albers the standard latitudes are missing.
  //  */
  //  String getPROJ4Description() {
  // 	AngleFormat format = new AngleFormat( AngleFormat.ddmmssPattern, false );
  // 	StringBuffer sb = new StringBuffer();
  // 	sb.append(
  // 		"+proj="+getName()+
  // 		" +a="+a
  // 	);
  // 	if ( es != 0 )
  // 		sb.append( " +es="+es );
  // 	sb.append( " +lon_0=" );
  // 	format.format( projectionLongitude, sb, null );
  // 	sb.append( " +lat_0=" );
  // 	format.format( projectionLatitude, sb, null );
  // 	if ( falseEasting != 1 )
  // 		sb.append( " +x_0="+falseEasting );
  // 	if ( falseNorthing != 1 )
  // 		sb.append( " +y_0="+falseNorthing );
  // 	if ( scaleFactor != 1 )
  // 		sb.append( " +k="+scaleFactor );
  // 	if ( fromMetres != 1 )
  // 		sb.append( " +fr_meters="+fromMetres );
  // 	return sb.toString();
  // }

  //  String toString() {
  // 	return "None";
  // }

  // /**
  //  * Set the minimum latitude. This is only used for Shape clipping and doesn't affect projection.
  //  */
  //  void setMinLatitude( double minLatitude ) {
  // 	this.minLatitude = minLatitude;
  // }

  //  double getMinLatitude() {
  // 	return minLatitude;
  // }

  // /**
  //  * Set the maximum latitude. This is only used for Shape clipping and doesn't affect projection.
  //  */
  //  void setMaxLatitude( double maxLatitude ) {
  // 	this.maxLatitude = maxLatitude;
  // }

  //  double getMaxLatitude() {
  // 	return maxLatitude;
  // }

  //  double getMaxLatitudeDegrees() {
  // 	return maxLatitude*RTD;
  // }

  //  double getMinLatitudeDegrees() {
  // 	return minLatitude*RTD;
  // }

  //  void setMinLongitude( double minLongitude ) {
  // 	this.minLongitude = minLongitude;
  // }

  //  double getMinLongitude() {
  // 	return minLongitude;
  // }

  //  void setMinLongitudeDegrees( double minLongitude ) {
  // 	this.minLongitude = DTR*minLongitude;
  // }

  //  double getMinLongitudeDegrees() {
  // 	return minLongitude*RTD;
  // }

  //  void setMaxLongitude( double maxLongitude ) {
  // 	this.maxLongitude = maxLongitude;
  // }

  //  double getMaxLongitude() {
  // 	return maxLongitude;
  // }

  //  void setMaxLongitudeDegrees( double maxLongitude ) {
  // 	this.maxLongitude = DTR*maxLongitude;
  // }

  //  double getMaxLongitudeDegrees() {
  // 	return maxLongitude*RTD;
  // }

  // /**
  //  * Set the projection latitude in radians.
  //  */
  //  void setProjectionLatitude( double projectionLatitude ) {
  // 	this.projectionLatitude = projectionLatitude;
  // }

  //  double getProjectionLatitude() {
  // 	return projectionLatitude;
  // }

  // /**
  //  * Set the projection latitude in degrees.
  //  */
  //  void setProjectionLatitudeDegrees( double projectionLatitude ) {
  // 	this.projectionLatitude = DTR*projectionLatitude;
  // }

  //  double getProjectionLatitudeDegrees() {
  // 	return projectionLatitude*RTD;
  // }

  // /**
  //  * Set the projection longitude in radians.
  //  */
  //  void setProjectionLongitude( double projectionLongitude ) {
  // 	this.projectionLongitude = normalizeLongitudeRadians( projectionLongitude );
  // }

  //  double getProjectionLongitude() {
  // 	return projectionLongitude;
  // }

  // /**
  //  * Set the projection longitude in degrees.
  //  */
  //  void setProjectionLongitudeDegrees( double projectionLongitude ) {
  // 	this.projectionLongitude = DTR*projectionLongitude;
  // }

  //  double getProjectionLongitudeDegrees() {
  // 	return projectionLongitude*RTD;
  // }

  // /**
  //  * Set the latitude of true scale in radians. This is only used by certain projections.
  //  */
  //  void setTrueScaleLatitude( double trueScaleLatitude ) {
  // 	this.trueScaleLatitude = trueScaleLatitude;
  // }

  //  double getTrueScaleLatitude() {
  // 	return trueScaleLatitude;
  // }

  // /**
  //  * Set the latitude of true scale in degrees. This is only used by certain projections.
  //  */
  //  void setTrueScaleLatitudeDegrees( double trueScaleLatitude ) {
  // 	this.trueScaleLatitude = DTR*trueScaleLatitude;
  // }

  //  double getTrueScaleLatitudeDegrees() {
  // 	return trueScaleLatitude*RTD;
  // }

  // /**
  //  * Set the projection latitude in radians.
  //  */
  //  void setProjectionLatitude1( double projectionLatitude1 ) {
  // 	this.projectionLatitude1 = projectionLatitude1;
  // }

  //  double getProjectionLatitude1() {
  // 	return projectionLatitude1;
  // }

  // /**
  //  * Set the projection latitude in degrees.
  //  */
  //  void setProjectionLatitude1Degrees( double projectionLatitude1 ) {
  // 	this.projectionLatitude1 = DTR*projectionLatitude1;
  // }

  //  double getProjectionLatitude1Degrees() {
  // 	return projectionLatitude1*RTD;
  // }

  // /**
  //  * Set the projection latitude in radians.
  //  */
  //  void setProjectionLatitude2( double projectionLatitude2 ) {
  // 	this.projectionLatitude2 = projectionLatitude2;
  // }

  //  double getProjectionLatitude2() {
  // 	return projectionLatitude2;
  // }

  // /**
  //  * Set the projection latitude in degrees.
  //  */
  //  void setProjectionLatitude2Degrees( double projectionLatitude2 ) {
  // 	this.projectionLatitude2 = DTR*projectionLatitude2;
  // }

  //  double getProjectionLatitude2Degrees() {
  // 	return projectionLatitude2*RTD;
  // }

  // /**
  //  * Sets the alpha value.
  //  */
  //  void setAlphaDegrees( double alpha ) {
  //   this.alpha = DTR * alpha;
  // }

  // /**
  //  * Gets the alpha value, in radians.
  //  *
  //  * @return the alpha value
  //  */
  //  double getAlpha()
  // {
  //   return alpha;
  // }

  // /**
  //  * Sets the lonc value.
  //  */
  //  void setLonCDegrees( double lonc ) {
  //   this.lonc = DTR * lonc;
  // }

  // /**
  //  * Gets the lonc value, in radians.
  //  *
  //  * @return the lonc value
  //  */
  //  double getLonC()
  // {
  //   return lonc;
  // }

  // /**
  //  * Set the false Northing in projected units.
  //  */
  //  void setFalseNorthing( double falseNorthing ) {
  //   this.falseNorthing = falseNorthing;
  // }

  //  double getFalseNorthing() {
  // 	return falseNorthing;
  // }

  // /**
  //  * Set the false Easting in projected units.
  //  */
  //  void setFalseEasting( double falseEasting ) {
  // 	this.falseEasting = falseEasting;
  // }

  //  double getFalseEasting() {
  // 	return falseEasting;
  // }

  //  void setSouthernHemisphere(bool isSouth)
  // {
  //   this.isSouth = isSouth;
  // }

  //  bool getSouthernHemisphere() { return isSouth; }

  // /**
  //  * Set the projection scale factor. This is set to 1 by default.
  //  * This value is called "k0" in PROJ.4.
  //  */
  //  void setScaleFactor( double scaleFactor ) {
  // 	this.scaleFactor = scaleFactor;
  // }

  // /**
  //  * Gets the projection scale factor.
  //  * This value is called "k0" in PROJ.4.
  //  *
  //  * @return
  //  */
  //  double getScaleFactor() {
  // 	return scaleFactor;
  // }

  //  double getEquatorRadius() {
  // 	return a;
  // }

  // /**
  //  * Set the conversion factor from metres to projected units. This is set to 1 by default.
  //  */
  //  void setFromMetres( double fromMetres ) {
  // 	this.fromMetres = fromMetres;
  // }

  //  double getFromMetres() {
  // 	return fromMetres;
  // }

  void setEllipsoid(Ellipsoid ellipsoid) {
    this.ellipsoid = ellipsoid;
    a = ellipsoid.equatorRadius;
    e = ellipsoid.eccentricity;
    es = ellipsoid.eccentricity2;
  }

  //  Ellipsoid getEllipsoid() {
  // 	return ellipsoid;
  // }

  // /**
  //  * Returns the ESPG code for this projection, or 0 if unknown.
  //  */
  //  int getEPSGCode() {
  // 	return 0;
  // }

  //  void setUnits(Unit unit)
  // {
  //   this.unit = unit;
  // }

  // /**
  //  * Initialize the projection. This should be called after setting parameters and before using the projection.
  //  * This is for performance reasons as initialization may be expensive.
  //  */
  //  void initialize() {
  // 	spherical = (e == 0.0);
  // 	one_es = 1-es;
  // 	rone_es = 1.0/one_es;
  // 	totalScale = a * fromMetres;
  // 	totalFalseEasting = falseEasting * fromMetres;
  // 	totalFalseNorthing = falseNorthing * fromMetres;
  // }

  static double normalizeLongitude(double angle) {
    if (angle.isInfinite || angle.isNaN) {
      throw Exception('Infinite or NaN longitude');
    }
    while (angle > 180) {
      angle -= 360;
    }
    while (angle < -180) {
      angle += 360;
    }
    return angle;
  }

  static double normalizeLongitudeRadians(double angle) {
    if (angle.isInfinite || angle.isNaN)
      throw Exception('Infinite or NaN longitude');
    while (angle > math.pi) {
      angle -= ProjectionMath.TWOPI;
    }
    while (angle < -math.pi) {
      angle += ProjectionMath.TWOPI;
    }
    return angle;
  }
}
