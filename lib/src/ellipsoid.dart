import 'dart:math' as math;

class Ellipsoid {
  String name;
  String shortName;
  var equatorRadius = 1.0;
  var poleRadius = 1.0;
  var eccentricity = 1.0;
  var eccentricity2 = 1.0;

  // From: USGS PROJ package.
  static Ellipsoid INTERNATIONAL = Ellipsoid.a(
      'intl', 6378388.0, 0.0, 297.0, 'International 1909 (Hayford)');
  static Ellipsoid BESSEL =
      Ellipsoid.a('bessel', 6377397.155, 0.0, 299.1528128, 'Bessel 1841');
  static Ellipsoid CLARKE_1866 =
      Ellipsoid.a('clrk66', 6378206.4, 6356583.8, 0.0, 'Clarke 1866');
  static Ellipsoid CLARKE_1880 =
      Ellipsoid.a('clrk80', 6378249.145, 0.0, 293.4663, 'Clarke 1880 mod.');
  static Ellipsoid AIRY =
      Ellipsoid.a('airy', 6377563.396, 6356256.910, 0.0, 'Airy 1830');
  static Ellipsoid WGS60 =
      Ellipsoid.a('WGS60', 6378165.0, 0.0, 298.3, 'WGS 60');
  static Ellipsoid WGS66 =
      Ellipsoid.a('WGS66', 6378145.0, 0.0, 298.25, 'WGS 66');
  static Ellipsoid WGS72 =
      Ellipsoid.a('WGS72', 6378135.0, 0.0, 298.26, 'WGS 72');
  static Ellipsoid WGS84 =
      Ellipsoid.a('WGS84', 6378137.0, 0.0, 298.257223563, 'WGS 84');
  static Ellipsoid KRASSOVSKY =
      Ellipsoid.a('krass', 6378245.0, 0.0, 298.3, 'Krassovsky, 1942');
  static Ellipsoid EVEREST =
      Ellipsoid.a('evrst30', 6377276.345, 0.0, 300.8017, 'Everest 1830');
  static Ellipsoid INTERNATIONAL_1967 =
      Ellipsoid.a('_intl', 6378157.5, 6356772.2, 0.0, ' International 1967');
  static Ellipsoid GRS80 = Ellipsoid.a(
      'GRS80', 6378137.0, 0.0, 298.257222101, 'GRS 1980 (IUGG, 1980)');
  static Ellipsoid AUSTRALIAN =
      Ellipsoid.a('australian', 6378160.0, 6356774.7, 298.25, 'Australian');
  static Ellipsoid MERIT =
      Ellipsoid.a('MERIT', 6378137.0, 0.0, 298.257, 'MERIT 1983');
  static Ellipsoid SGS85 = Ellipsoid.a(
      'SGS85', 6378136.0, 0.0, 298.257, 'Soviet Geodetic System 85');
  static Ellipsoid IAU76 =
      Ellipsoid.a('IAU76', 6378140.0, 0.0, 298.257, 'IAU 1976');
  static Ellipsoid APL4_9 =
      Ellipsoid.a('APL4.9', 6378137.0, 0.0, 298.25, 'Appl. Physics. 1965');
  static Ellipsoid NWL9D =
      Ellipsoid.a('NWL9D', 6378145.0, 0.0, 298.25, 'Naval Weapons Lab., 1965');
  static Ellipsoid MOD_AIRY =
      Ellipsoid.a('mod_airy', 6377340.189, 6356034.446, 0.0, 'Modified Airy');
  static Ellipsoid ANDRAE = Ellipsoid.a(
      'andrae', 6377104.43, 0.0, 300.0, 'Andrae 1876 (Den., Iclnd.)');
  static Ellipsoid AUST_SA = Ellipsoid.a(
      'aust_SA', 6378160.0, 0.0, 298.25, 'Australian Natl & S. Amer. 1969');
  static Ellipsoid GRS67 = Ellipsoid.a(
      'GRS67', 6378160.0, 0.0, 298.2471674270, 'GRS 67 (IUGG 1967)');
  static Ellipsoid BESS_NAM = Ellipsoid.a(
      'bess_nam', 6377483.865, 0.0, 299.1528128, 'Bessel 1841 (Namibia)');
  static Ellipsoid CPM = Ellipsoid.a(
      'CPM', 6375738.7, 0.0, 334.29, 'Comm. des Poids et Mesures 1799');
  static Ellipsoid DELMBR =
      Ellipsoid.a('delmbr', 6376428.0, 0.0, 311.5, 'Delambre 1810 (Belgium)');
  static Ellipsoid ENGELIS =
      Ellipsoid.a('engelis', 6378136.05, 0.0, 298.2566, 'Engelis 1985');
  static Ellipsoid EVRST48 =
      Ellipsoid.a('evrst48', 6377304.063, 0.0, 300.8017, 'Everest 1948');
  static Ellipsoid EVRST56 =
      Ellipsoid.a('evrst56', 6377301.243, 0.0, 300.8017, 'Everest 1956');
  static Ellipsoid EVRTS69 =
      Ellipsoid.a('evrst69', 6377295.664, 0.0, 300.8017, 'Everest 1969');
  static Ellipsoid EVRTSTSS = Ellipsoid.a(
      'evrstSS', 6377298.556, 0.0, 300.8017, 'Everest (Sabah & Sarawak)');
  static Ellipsoid FRSCH60 = Ellipsoid.a(
      'fschr60', 6378166.0, 0.0, 298.3, 'Fischer (Mercury Datum) 1960');
  static Ellipsoid FSRCH60M =
      Ellipsoid.a('fschr60m', 6378155.0, 0.0, 298.3, 'Modified Fischer 1960');
  static Ellipsoid FSCHR68 =
      Ellipsoid.a('fschr68', 6378150.0, 0.0, 298.3, 'Fischer 1968');
  static Ellipsoid HELMERT =
      Ellipsoid.a('helmert', 6378200.0, 0.0, 298.3, 'Helmert 1906');
  static Ellipsoid HOUGH = Ellipsoid.a('hough', 6378270.0, 0.0, 297.0, 'Hough');
  static Ellipsoid INTL = Ellipsoid.a(
      'intl', 6378388.0, 0.0, 297.0, 'International 1909 (Hayford)');
  static Ellipsoid KAULA =
      Ellipsoid.a('kaula', 6378163.0, 0.0, 298.24, 'Kaula 1961');
  static Ellipsoid LERCH =
      Ellipsoid.a('lerch', 6378139.0, 0.0, 298.257, 'Lerch 1979');
  static Ellipsoid MPRTS =
      Ellipsoid.a('mprts', 6397300.0, 0.0, 191.0, 'Maupertius 1738');
  static Ellipsoid PLESSIS =
      Ellipsoid.a('plessis', 6376523.0, 6355863.0, 0.0, 'Plessis 1817 France)');
  static Ellipsoid SEASIA =
      Ellipsoid.a('SEasia', 6378155.0, 6356773.3205, 0.0, 'Southeast Asia');
  static Ellipsoid WALBECK =
      Ellipsoid.a('walbeck', 6376896.0, 6355834.8467, 0.0, 'Walbeck');
  static Ellipsoid NAD27 = Ellipsoid.a(
      'NAD27', 6378249.145, 0.0, 293.4663, 'NAD27: Clarke 1880 mod.');
  static Ellipsoid NAD83 = Ellipsoid.a(
      'NAD83', 6378137.0, 0.0, 298.257222101, 'NAD83: GRS 1980 (IUGG, 1980)');
  static Ellipsoid SPHERE =
      Ellipsoid.a('sphere', 6371008.7714, 6371008.7714, 0.0, 'Sphere');

  static List<Ellipsoid> ellipsoids = [
    BESSEL,
    CLARKE_1866,
    CLARKE_1880,
    AIRY,
    WGS60,
    WGS66,
    WGS72,
    WGS84,
    KRASSOVSKY,
    EVEREST,
    INTERNATIONAL_1967,
    GRS80,
    AUSTRALIAN,
    MERIT,
    SGS85,
    IAU76,
    APL4_9,
    NWL9D,
    MOD_AIRY,
    ANDRAE,
    AUST_SA,
    GRS67,
    BESS_NAM,
    CPM,
    DELMBR,
    ENGELIS,
    EVRST48,
    EVRST56,
    EVRTS69,
    EVRTSTSS,
    FRSCH60,
    FSRCH60M,
    FSCHR68,
    HELMERT,
    HOUGH,
    INTL,
    KAULA,
    LERCH,
    MPRTS,
    PLESSIS,
    SEASIA,
    WALBECK,
    NAD27,
    NAD83,
    SPHERE
  ];

  Ellipsoid();

  Ellipsoid.a(String shortName, double equatorRadius, double poleRadius,
      double reciprocalFlattening, String name) {
    shortName = shortName;
    name = name;
    equatorRadius = equatorRadius;
    poleRadius = poleRadius;

    if (poleRadius == 0.0 && reciprocalFlattening == 0.0) {
      throw Exception(
          'One of poleRadius or reciprocalFlattening must be specified');
    }
    if (reciprocalFlattening != 0) {
      var flattening = 1.0 / reciprocalFlattening;
      var f = flattening;
      eccentricity2 = 2 * f - f * f;
      poleRadius = equatorRadius * math.sqrt(1.0 - eccentricity2);
    } else {
      eccentricity2 =
          1.0 - (poleRadius * poleRadius) / (equatorRadius * equatorRadius);
    }
    eccentricity = math.sqrt(eccentricity2);
  }

  Ellipsoid.b(String shortName, double equatorRadius, double eccentricity2,
      String name) {
    shortName = shortName;
    name = name;
    equatorRadius = equatorRadius;
    setEccentricitySquared(eccentricity2);
  }

  //  Object clone()
  // {
  //   try {
  //     Ellipsoid e = (Ellipsoid) super.clone();
  //     return e;
  //   }
  //   catch (CloneNotSupportedException e) {
  //     throw  InternalError();
  //   }
  // }

  void setName(String name) {
    name = name;
  }

  String getName() {
    return name;
  }

  void setShortName(String shortName) {
    shortName = shortName;
  }

  String getShortName() {
    return shortName;
  }

  void setEquatorRadius(double equatorRadius) {
    equatorRadius = equatorRadius;
  }

  double getEquatorRadius() {
    return equatorRadius;
  }

  double getA() {
    return equatorRadius;
  }

  double getB() {
    return poleRadius;
  }

  void setEccentricitySquared(double eccentricity2) {
    eccentricity2 = eccentricity2;
    poleRadius = equatorRadius * math.sqrt(1.0 - eccentricity2);
    eccentricity = math.sqrt(eccentricity2);
  }

  double getEccentricitySquared() {
    return eccentricity2;
  }

  // bool isEqual(Ellipsoid e) {
  //   return equatorRadius == e.equatorRadius && eccentricity2 == e.eccentricity2;
  // }

  // bool isEqual(Ellipsoid e, double e2Tolerance) {
  //   if (equatorRadius != e.equatorRadius) return false;
  //   if (math.abs(eccentricity2 - e.eccentricity2) > e2Tolerance) return false;
  //   return true;
  // }

  @override
  String toString() {
    return name;
  }
}
