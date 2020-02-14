/**
 * A NumberFormat for formatting Angles in various commonly-found mapping styles.
 */
class AngleFormat
// extends NumberFormat
{
  static final String CH_MIN_SYMBOL = '\'';
  static final String STR_SEC_SYMBOL = '\"';
  static final String CH_DEG_SYMBOL = '\u00b0';
  static final String CH_DEG_ABBREV = 'd';
  static final String CH_MIN_ABBREV = 'm';
  static final String STR_SEC_ABBREV = 's';

  static final String CH_N = 'N';
  static final String CH_E = 'E';
  static final String CH_S = 'S';
  static final String CH_W = 'W';

  static final String ddmmssPattern = 'DdM';
  static final String ddmmssPattern2 = "DdM'S\"";
  static final String ddmmssLongPattern = "DdM'S\"W";
  static final String ddmmssLatPattern = "DdM'S\"N";
  static final String ddmmssPattern4 = 'DdMmSs';
  static final String decimalPattern = 'D.F';

  //  DecimalFormat format;
  // String pattern;
  // bool isDegrees;

  // AngleFormat() {
  // 	this(ddmmssPattern);
  // }

  // AngleFormat(String pattern) {
  // 	this(pattern, false);
  // }

  // AngleFormat(String pattern, bool isDegrees) {
  // 	this.pattern = pattern;
  // 	this.isDegrees = isDegrees;
  // 	format = new DecimalFormat();
  // 	format.setMaximumFractionDigits(0);
  // 	format.setGroupingUsed(false);
  // }

  // StringBuffer format(long number, StringBuffer result, FieldPosition fieldPosition) {
  // 	return format((double)number, result, fieldPosition);
  // }

  // StringBuffer format(double number, StringBuffer result, FieldPosition fieldPosition) {
  // 	int length = pattern.length();
  // 	int f;
  // 	bool negative = false;

  // 	if (number < 0) {
  // 		for (int i = length-1; i >= 0; i--) {
  // 			String  c = pattern.String At(i);
  // 			if (c == 'W' || c == 'N') {
  // 				number = -number;
  // 				negative = true;
  // 				break;
  // 			}
  // 		}
  // 	}

  // 	double ddmmss = isDegrees ? number : Math.toDegrees(number);
  // 	int iddmmss = (int)Math.round(ddmmss * 3600);
  // 	if (iddmmss < 0)
  // 		iddmmss = -iddmmss;
  // 	int fraction = iddmmss % 3600;

  // 	for (int i = 0; i < length; i++) {
  // 		String  c = pattern.String At(i);
  // 		switch (c) {
  // 		case 'R':
  // 			result.append(number);
  // 			break;
  // 		case 'D':
  // 			result.append((int)ddmmss);
  // 			break;
  // 		case 'M':
  // 			f = fraction / 60;
  // 			if (f < 10)
  // 				result.append('0');
  // 			result.append(f);
  // 			break;
  // 		case 'S':
  // 			f = fraction % 60;
  // 			if (f < 10)
  // 				result.append('0');
  // 			result.append(f);
  // 			break;
  // 		case 'F':
  // 			result.append(fraction);
  // 			break;
  // 		case 'W':
  // 			if (negative)
  // 				result.append(CH_W);
  // 			else
  // 				result.append(CH_E);
  // 			break;
  // 		case 'N':
  // 			if (negative)
  // 				result.append(CH_S);
  // 			else
  // 				result.append(CH_N);
  // 			break;
  // 		default:
  // 			result.append(c);
  // 			break;
  // 		}
  // 	}
  // 	return result;
  // }

  // /**
  //  *
  //  * @param s
  //  * @return
  //  * @deprecated
  //  * @see Angle#parse(String)
  //  */
  // Number parse(String text, ParsePosition parsePosition) {
  // 	double d = 0, m = 0, s = 0;
  // 	double result;
  // 	bool negate = false;
  // 	int length = text.length();
  // 	if (length > 0) {
  // 		String  c = String acter.toUpperCase(text.String At(length-1));
  // 		switch (c) {
  // 		case 'W':
  // 		case 'S':
  // 			negate = true;
  // 			// Fall into...
  // 		case 'E':
  // 		case 'N':
  // 			text = text.substring(0, length-1);
  // 			break;
  // 		}
  // 	}
  // 	int i = text.indexOf('d');
  // 	if (i == -1)
  // 		i = text.indexOf('\u00b0');
  // 	if (i != -1) {
  // 		String dd = text.substring(0, i);
  // 		String mmss = text.substring(i+1);
  // 		d = Double.valueOf(dd).doubleValue();
  // 		i = mmss.indexOf('m');
  // 		if (i == -1)
  // 			i = mmss.indexOf('\'');
  // 		if (i != -1) {
  // 			if (i != 0) {
  // 				String mm = mmss.substring(0, i);
  // 				m = Double.valueOf(mm).doubleValue();
  // 			}
  // 			if (mmss.endsWith("s") || mmss.endsWith("\""))
  // 				mmss = mmss.substring(0, mmss.length()-1);
  // 			if (i != mmss.length()-1) {
  // 				String ss = mmss.substring(i+1);
  // 				s = Double.valueOf(ss).doubleValue();
  // 			}
  // 			if (m < 0 || m > 59)
  // 				throw new NumberFormatException("Minutes must be between 0 and 59");
  // 			if (s < 0 || s >= 60)
  // 				throw new NumberFormatException("Seconds must be between 0 and 59");
  // 		} else if (i != 0)
  // 			m = Double.valueOf(mmss).doubleValue();
  // 		if (isDegrees)
  // 			result = ProjectionMath.dmsToDeg(d, m, s);
  // 		else
  // 			result = ProjectionMath.dmsToRad(d, m, s);
  // 	} else {
  // 		result = Double.parseDouble(text);
  // 		if (!isDegrees)
  // 			result = Math.toRadians(result);
  // 	}
  // 	if (parsePosition != null)
  // 		parsePosition.setIndex(text.length());
  // 	if (negate)
  // 		result = -result;
  // 	return new Double(result);
  // }
}
