import 'package:proj4dart/src/classes/ellipsoid.dart';

class Ellipsoids {
  static final MERIT =
      Ellipsoid(a: 6378137.0, rf: 298.257, ellipseName: 'MERIT 1983');

  static final SGS85 = Ellipsoid(
      a: 6378136.0, rf: 298.257, ellipseName: 'Soviet Geodetic System 85');

  static final GRS80 = Ellipsoid(
      a: 6378137.0, rf: 298.257222101, ellipseName: 'GRS 1980(IUGG, 1980)');

  static final IAU76 =
      Ellipsoid(a: 6378140.0, rf: 298.257, ellipseName: 'IAU 1976');

  static final airy =
      Ellipsoid.withB(a: 6377563.396, b: 6356256.910, ellipseName: 'Airy 1830');

  static final APL4 =
      Ellipsoid(a: 6378137, rf: 298.25, ellipseName: 'Appl. Physics. 1965');

  static final NWL9D = Ellipsoid(
      a: 6378145.0, rf: 298.25, ellipseName: 'Naval Weapons Lab., 1965');

  static final mod_airy = Ellipsoid.withB(
      a: 6377340.189, b: 6356034.446, ellipseName: 'Modified Airy');

  static final andrae = Ellipsoid(
      a: 6377104.43, rf: 300.0, ellipseName: 'Andrae 1876 (Den., Iclnd.)');

  static final aust_SA = Ellipsoid(
      a: 6378160.0, rf: 298.25, ellipseName: 'Australian Natl & S. Amer. 1969');

  static final GRS67 = Ellipsoid(
      a: 6378160.0, rf: 298.2471674270, ellipseName: 'GRS 67(IUGG 1967)');

  static final bessel =
      Ellipsoid(a: 6377397.155, rf: 299.1528128, ellipseName: 'Bessel 1841');

  static final bess_nam = Ellipsoid(
      a: 6377483.865, rf: 299.1528128, ellipseName: 'Bessel 1841 (Namibia)');

  static final clrk66 =
      Ellipsoid.withB(a: 6378206.4, b: 6356583.8, ellipseName: 'Clarke 1866');

  static final clrk80 =
      Ellipsoid(a: 6378249.145, rf: 293.4663, ellipseName: 'Clarke 1880 mod.');

  static final clrk58 = Ellipsoid(
      a: 6378293.645208759, rf: 294.2606763692654, ellipseName: 'Clarke 1858');

  static final CPM = Ellipsoid(
      a: 6375738.7, rf: 334.29, ellipseName: 'Comm. des Poids et Mesures 1799');

  static final delmbr = Ellipsoid(
      a: 6376428.0, rf: 311.5, ellipseName: 'Delambre 1810 (Belgium)');

  static final engelis =
      Ellipsoid(a: 6378136.05, rf: 298.2566, ellipseName: 'Engelis 1985');

  static final evrst30 =
      Ellipsoid(a: 6377276.345, rf: 300.8017, ellipseName: 'Everest 1830');

  static final evrst48 =
      Ellipsoid(a: 6377304.063, rf: 300.8017, ellipseName: 'Everest 1948');

  static final evrst56 =
      Ellipsoid(a: 6377301.243, rf: 300.8017, ellipseName: 'Everest 1956');

  static final evrst69 =
      Ellipsoid(a: 6377295.664, rf: 300.8017, ellipseName: 'Everest 1969');

  static final evrstSS = Ellipsoid(
      a: 6377298.556, rf: 300.8017, ellipseName: 'Everest (Sabah & Sarawak)');

  static final fschr60 = Ellipsoid(
      a: 6378166.0, rf: 298.3, ellipseName: 'Fischer (Mercury Datum) 1960');

  static final fschr60m =
      Ellipsoid(a: 6378155.0, rf: 298.3, ellipseName: 'Fischer 1960');

  static final fschr68 =
      Ellipsoid(a: 6378150.0, rf: 298.3, ellipseName: 'Fischer 1968');

  static final helmert =
      Ellipsoid(a: 6378200.0, rf: 298.3, ellipseName: 'Helmert 1906');

  static final hough = Ellipsoid(a: 6378270.0, rf: 297.0, ellipseName: 'Hough');

  static final intl = Ellipsoid(
      a: 6378388.0, rf: 297.0, ellipseName: 'International 1909 (Hayford)');

  static final kaula =
      Ellipsoid(a: 6378163.0, rf: 298.24, ellipseName: 'Kaula 1961');

  static final lerch =
      Ellipsoid(a: 6378139.0, rf: 298.257, ellipseName: 'Lerch 1979');

  static final mprts =
      Ellipsoid(a: 6397300.0, rf: 191.0, ellipseName: 'Maupertius 1738');

  static final new_intl = Ellipsoid.withB(
      a: 6378157.5, b: 6356772.2, ellipseName: 'New International 1967');

  static final plessis = Ellipsoid(
      a: 6376523.0, rf: 6355863.0, ellipseName: 'Plessis 1817 (France)');

  static final krass =
      Ellipsoid(a: 6378245.0, rf: 298.3, ellipseName: 'Krassovsky, 1942');

  static final SEasia = Ellipsoid.withB(
      a: 6378155.0, b: 6356773.3205, ellipseName: 'Southeast Asia');

  static final walbeck =
      Ellipsoid.withB(a: 6376896.0, b: 6355834.8467, ellipseName: 'Walbeck');

  static final WGS60 =
      Ellipsoid(a: 6378165.0, rf: 298.3, ellipseName: 'WGS 60');

  static final WGS66 =
      Ellipsoid(a: 6378145.0, rf: 298.25, ellipseName: 'WGS 66');

  static final WGS7 =
      Ellipsoid(a: 6378135.0, rf: 298.26, ellipseName: 'WGS 72');

  static final WGS84 =
      Ellipsoid(a: 6378137.0, rf: 298.257223563, ellipseName: 'WGS 84');

  static final sphere = Ellipsoid.withB(
      a: 6370997.0, b: 6370997.0, ellipseName: 'Normal Sphere (r=6370997)');

  static final List<Ellipsoid> _ellipsoids = [
    MERIT,
    SGS85,
    GRS80,
    IAU76,
    airy,
    APL4,
    NWL9D,
    mod_airy,
    andrae,
    aust_SA,
    GRS67,
    bessel,
    bess_nam,
    clrk66,
    clrk80,
    clrk58,
    CPM,
    delmbr,
    engelis,
    evrst30,
    evrst48,
    evrst56,
    evrst69,
    evrstSS,
    fschr60,
    fschr60m,
    fschr68,
    helmert,
    hough,
    intl,
    kaula,
    lerch,
    mprts,
    new_intl,
    plessis,
    krass,
    SEasia,
    walbeck,
    WGS60,
    WGS66,
    WGS7,
    WGS84,
    sphere
  ];

  static Ellipsoid match(String ellipseName) {
    var ell = _ellipsoids
        .where((element) => element.ellipseName == ellipseName)
        .toList();
    return ell.length == 1 ? ell[0] : null;
  }
}
