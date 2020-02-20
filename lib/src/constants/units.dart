import 'package:proj4dart/src/classes/unit.dart';

final ft = Unit(to_meter: 0.3048);
final us_ft = Unit(to_meter: 1200 / 3937);

Unit match(String unit) {
  switch (unit) {
    case 'ft':
      return ft;
      break;
    case 'us-ft':
      return us_ft;
      break;
    default:
      return null;
      break;
  }
}
