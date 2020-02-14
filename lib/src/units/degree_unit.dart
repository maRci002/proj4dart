import 'package:proj4dart/src/units/unit.dart';

class DegreeUnit extends Unit {
  // static AngleFormat format = new AngleFormat(AngleFormat.ddmmssPattern, true);
  var a;

  DegreeUnit() : super('degree', 'degrees', 'deg', 1.0);

  // double parse(String s) {
  // 	try {
  // 		return format.parse(s).doubleValue();
  // 	}
  // 	catch (java.text.ParseException e) {
  // 		throw new NumberFormatException(e.getMessage());
  // 	}
  // }

  // public String format(double n) {
  // 	return format.format(n)+' '+abbreviation;
  // }

  // public String format(double n, boolean abbrev) {
  // 	if (abbrev)
  // 		return format.format(n)+' '+abbreviation;
  // 	return format.format(n);
  // }

  // public String format(double x, double y, boolean abbrev) {
  // 	if (abbrev)
  // 		return format.format(x)+'/'+format.format(y)+' '+abbreviation;
  // 	return format.format(x)+'/'+format.format(y);
  // }
}
