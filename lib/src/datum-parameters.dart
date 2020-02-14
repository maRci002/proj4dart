// import 'package:proj4dart/src/ellipsoid.dart';

// class DatumParameters {

//    final  SIXTH = .1666666666666666667; /* 1/6 */
//    final  RA4 = .04722222222222222222; /* 17/360 */
//    final  RA6 = .02215608465608465608; /* 67/3024 */
//    final  RV4 = .06944444444444444444; /* 5/72 */
//    final  RV6 = .04243827160493827160; /* 55/1296 */

//    Datum datum = null;
//    static List<double> datumTransform = null;

//    Ellipsoid ellipsoid;
//    var a = null;
//     var es = null;

//   public DatumParameters() {
//     // Default datum is WGS84
// //    setDatum(Datum.WGS84);
//   }

//   public Datum getDatum()
//   {
//     if (datum != null)
//       return datum;
//     // if no ellipsoid was specified, return WGS84 as the default
//     if (ellipsoid == null && ! isDefinedExplicitly()) {
//       return Datum.WGS84;
//     }
//     // if ellipsoid was WGS84, return that datum
//     if (ellipsoid == Ellipsoid.WGS84)
//       return Datum.WGS84;

//     // otherwise, return a custom datum with the specified ellipsoid
//     return new Datum("User", datumTransform, getEllipsoid(), "User-defined");
//   }

//    boolean isDefinedExplicitly()
//   {
//     return ! (Double.isNaN(a) || Double.isNaN(es));
//   }

//   public Ellipsoid getEllipsoid()
//   {
//     if (ellipsoid != null)
//         return ellipsoid;
//     return new Ellipsoid("user", a, es, "User-defined");
//   }

//   public void setDatumTransform(double[] datumTransform)
//   {
//     this.datumTransform = datumTransform;
//     // force new Datum to be created
//     datum = null;
//   }

//   public void setDatum(Datum datum)
//   {
//     this.datum = datum;
//   }

//   public void setEllipsoid(Ellipsoid ellipsoid)
//   {
//     this.ellipsoid = ellipsoid;
//     es = ellipsoid.eccentricity2;
//     a = ellipsoid.equatorRadius;
//   }

//   public void setA(double a)
//   {
//     ellipsoid = null;  // force user-defined ellipsoid
//     this.a = a;
//   }

//   public void setB(double b)
//   {
//     ellipsoid = null;  // force user-defined ellipsoid
//     es = 1. - (b * b) / (a * a);
//   }

//   public void setES(double es)
//   {
//     ellipsoid = null;  // force user-defined ellipsoid
//     this.es = es;
//   }

//   public void setRF(double rf)
//   {
//     ellipsoid = null;  // force user-defined ellipsoid
//     es = rf * (2. - rf);
//   }

//   public void setR_A()
//   {
//     ellipsoid = null;  // force user-defined ellipsoid
//     a *= 1. - es * (SIXTH + es * (RA4 + es * RA6));
//   }

//   public void setF(double f)
//   {
//     ellipsoid = null;  // force user-defined ellipsoid
//     double rf = 1.0 / f;
//     es = rf * (2. - rf);
//   }

//   public double getA() {
//     return a;
//   }

//   public double getES() {
//     return es;
//   }
// }
