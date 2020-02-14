class ProjCoordinate {
  double x;
  double y;
  double z;

  ProjCoordinate()
      : x = 0.0,
        y = 0.0;

  ProjCoordinate.v1(double argX, double argY, double argZ)
      : x = argX,
        y = argY,
        z = argZ;

  ProjCoordinate.v2(double argX, double argY)
      : x = argX,
        y = argY,
        z = double.nan;

  ProjCoordinate.v3(String argToParse) {
    // Make sure the String starts with 'ProjCoordinate: '.
    var startsWith = argToParse.startsWith('ProjCoordinate: ');
    if (startsWith == false) {
      throw Exception('The input string was not in the proper format.');
    }
    // 15 characters should cut out 'ProjCoordinate: '.
    var chomped = argToParse.substring(16);
    // Get rid of the starting and ending square brackets.
    var withoutFrontBracket = chomped.substring(1);
    // Calc the position of the last bracket.
    var length = withoutFrontBracket.length;
    var positionOfCharBeforeLast = length - 2;
    var withoutBackBracket =
        withoutFrontBracket.substring(0, positionOfCharBeforeLast);
    // We should be left with just the ordinate values as strings,
    // separated by spaces. Split them into an array of Strings.
    var parts = withoutBackBracket.split(' ');
    // Get number of elements in Array. There should be two (2) elements
    // or three (3) elements.
    // If we don't have an array with two (2) or three (3) elements,
    // then we need to throw an exception.
    if (parts.length != 2) {
      if (parts.length != 3) {
        throw Exception('The input string was not in the proper format.');
      }
    }
    // Convert strings to doubles.
    x = parts[0] as double;
    y = parts[0] as double;
    // You might not always have a Z ordinate. If you do, set it.
    if (parts.length == 3) {
      z = parts[0] as double;
    }
  }

  void setValue(ProjCoordinate p) {
    x = p.x;
    y = p.y;
    z = p.z;
  }

  void setValueV2(double x, double y) {
    x = x;
    y = y;
    z = double.nan;
  }

  void setValueV3(double x, double y, double z) {
    x = x;
    y = y;
    z = z;
  }

  void clearZ() {
    z = double.nan;
  }

  bool areXOrdinatesEqual(ProjCoordinate argToCompare, double argTolerance) {
    // Subtract the x ordinate values and then see if the difference
    // between them is less than the specified tolerance. If the difference
    // is less, return true.
    var difference = argToCompare.x - x;
    if (difference > argTolerance) {
      return false;
    } else {
      return true;
    }
  }

  bool areYOrdinatesEqual(ProjCoordinate argToCompare, double argTolerance) {
    // Subtract the y ordinate values and then see if the difference
    // between them is less than the specified tolerance. If the difference
    // is less, return true.
    var difference = argToCompare.y - y;
    if (difference > argTolerance) {
      return false;
    } else {
      return true;
    }
  }

  bool areZOrdinatesEqual(ProjCoordinate argToCompare, double argTolerance) {
    // We have to handle Double.NaN values here, because not every
    // ProjCoordinate will have a valid Z Value.
    if (z.isNaN) {
      if (argToCompare.z.isNaN) {
        // Both the z ordinate values are Double.Nan. Return true.
        return true;
      } else {
        // We've got one z ordinate with a valid value and one with
        // a Double.NaN value. Return false.
        return false;
      }
    } // We have a valid z ordinate value in this ProjCoordinate object.
    else {
      if (argToCompare.z.isNaN) {
        // We've got one z ordinate with a valid value and one with
        // a Double.NaN value. Return false.
        return false;
      }
      // If we get to this point in the method execution, we have to
      // z ordinates with valid values, and we need to do a regular
      // comparison. This is done in the remainder of the method.
    }
    // Subtract the z ordinate values and then see if the difference
    // between them is less than the specified tolerance. If the difference
    // is less, return true.
    var difference = argToCompare.z - z;
    if (difference > argTolerance) {
      return false;
    } else {
      return true;
    }
  }

  bool equals(Object other) {
    if (!(other is ProjCoordinate)) {
      return false;
    }
    var p = other as ProjCoordinate;
    if (x != p.x) {
      return false;
    }
    if (y != p.y) {
      return false;
    }
    return true;
  }

  @override
  int hashCode() {
    //Algorithm from Effective Java by Joshua Bloch [Jon Aquino]
    var result = 17;
    result = 37 * result + hashCodeV2(x);
    result = 37 * result + hashCodeV2(y);
    return result;
  }

  static int hashCodeV2(double x) {
    // long f = Double.doubleToLongBits(x);
    // return (int)(f^(f>>>32));
  }

  @override
  String toString() {
    return 'ProjCoordinate[$x $y $z]';
  }

  String toShortString() {
    return "[${x.toStringAsFixed(16)}, ${y.toStringAsFixed(16)} ${!z.isNaN ? ', ' + z.toStringAsFixed(16) : ''}]";
  }

  bool hasValidZOrdinate() {
    if (z.isNaN) {
      return false;
    } else {
      return true;
    }
  }

  bool hasValidXandYOrdinates() {
    if (x.isNaN) {
      return false;
    } else if (x.isInfinite) {
      return false;
    }
    if (y.isNaN) {
      return false;
    } else if (y.isInfinite) {
      return false;
    } else {
      return true;
    }
  }
}
