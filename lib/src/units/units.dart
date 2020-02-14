import 'package:proj4dart/src/units/degree_unit.dart';
import 'package:proj4dart/src/units/unit.dart';

class Units {
  // Angular units
  static final Unit DEGREES = DegreeUnit();
  static final Unit RADIANS = Unit('radian', 'radians', 'rad', 57.2957795);
  static final Unit ARC_MINUTES =
      Unit('arc minute', 'arc minutes', 'min', 1 / 60.0);
  static final Unit ARC_SECONDS =
      Unit('arc second', 'arc seconds', 'sec', 1 / 3600.0);

  // Distance units

  // Metric units
  static final Unit KILOMETRES = Unit('kilometre', 'kilometres', 'km', 1000);
  static final Unit METRES = Unit('metre', 'metres', 'm', 1);
  static final Unit DECIMETRES = Unit('decimetre', 'decimetres', 'dm', 0.1);
  static final Unit CENTIMETRES = Unit('centimetre', 'centimetres', 'cm', 0.01);
  static final Unit MILLIMETRES =
      Unit('millimetre', 'millimetres', 'mm', 0.001);

  // International units
  static final Unit NAUTICAL_MILES =
      Unit('nautical mile', 'nautical miles', 'kmi', 1852);
  static final Unit MILES = Unit('mile', 'miles', 'mi', 1609.344);
  static final Unit CHAINS = Unit('chain', 'chains', 'ch', 20.1168);
  static final Unit YARDS = Unit('yard', 'yards', 'yd', 0.9144);
  static final Unit FEET = Unit('foot', 'feet', 'ft', 0.3048);
  static final Unit INCHES = Unit('inch', 'inches', 'in', 0.0254);

  // U.S. units
  static final Unit US_MILES =
      Unit('U.S. mile', 'U.S. miles', 'us-mi', 1609.347218694437);
  static final Unit US_CHAINS =
      Unit('U.S. chain', 'U.S. chains', 'us-ch', 20.11684023368047);
  static final Unit US_YARDS =
      Unit('U.S. yard', 'U.S. yards', 'us-yd', 0.914401828803658);
  static final Unit US_FEET =
      Unit('U.S. foot', 'U.S. feet', 'us-ft', 0.304800609601219);
  static final Unit US_INCHES =
      Unit('U.S. inch', 'U.S. inches', 'us-in', 1.0 / 39.37);

  // Miscellaneous units
  static final Unit FATHOMS = Unit('fathom', 'fathoms', 'fath', 1.8288);
  static final Unit LINKS = Unit('link', 'links', 'link', 0.201168);

  static final Unit POINTS = Unit('point', 'points', 'point', 0.0254 / 72.27);

  static List<Unit> units = [
    DEGREES,
    KILOMETRES,
    METRES,
    DECIMETRES,
    CENTIMETRES,
    MILLIMETRES,
    MILES,
    YARDS,
    FEET,
    INCHES,
    US_MILES,
    US_YARDS,
    US_FEET,
    US_INCHES,
    NAUTICAL_MILES
  ];

  static Unit findUnits(String name) {
    for (var i = 0; i < units.length; i++) {
      if (name == units[i].name ||
          name == units[i].plural ||
          name == units[i].abbreviation) return units[i];
    }
    return METRES;
  }

  static double convert(double value, Unit from, Unit to) {
    if (from == to) return value;
    return to.fromBase(from.toBase(value));
  }
}
