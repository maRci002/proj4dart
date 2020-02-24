import 'package:proj4dart/src/classes/ellipsoid.dart';

final MERIT = Ellipsoid(
    a: 6378137.0, rf: 298.257, ellipseName: 'MERIT 1983', shortName: 'MERIT');

final SGS85 = Ellipsoid(
    a: 6378136.0,
    rf: 298.257,
    ellipseName: 'Soviet Geodetic System 85',
    shortName: 'SGS85');

final GRS80 = Ellipsoid(
    a: 6378137.0,
    rf: 298.257222101,
    ellipseName: 'GRS 1980(IUGG, 1980)',
    shortName: 'GRS80');

final IAU76 = Ellipsoid(
    a: 6378140.0, rf: 298.257, ellipseName: 'IAU 1976', shortName: 'IAU76');

final airy = Ellipsoid.withB(
    a: 6377563.396,
    b: 6356256.910,
    ellipseName: 'Airy 1830',
    shortName: 'airy');

final APL4 = Ellipsoid(
    a: 6378137,
    rf: 298.25,
    ellipseName: 'Appl. Physics. 1965',
    shortName: 'APL4');

final NWL9D = Ellipsoid(
    a: 6378145.0,
    rf: 298.25,
    ellipseName: 'Naval Weapons Lab., 1965',
    shortName: 'NWL9D');

final mod_airy = Ellipsoid.withB(
    a: 6377340.189,
    b: 6356034.446,
    ellipseName: 'Modified Airy',
    shortName: 'mod_airy');

final andrae = Ellipsoid(
    a: 6377104.43,
    rf: 300.0,
    ellipseName: 'Andrae 1876 (Den., Iclnd.)',
    shortName: 'andrae');

final aust_SA = Ellipsoid(
    a: 6378160.0,
    rf: 298.25,
    ellipseName: 'Australian Natl & S. Amer. 1969',
    shortName: 'aust_SA');

final GRS67 = Ellipsoid(
    a: 6378160.0,
    rf: 298.2471674270,
    ellipseName: 'GRS 67(IUGG 1967)',
    shortName: 'GRS67');

final bessel = Ellipsoid(
    a: 6377397.155,
    rf: 299.1528128,
    ellipseName: 'Bessel 1841',
    shortName: 'bessel');

final bess_nam = Ellipsoid(
    a: 6377483.865,
    rf: 299.1528128,
    ellipseName: 'Bessel 1841 (Namibia)',
    shortName: 'bess_nam');

final clrk66 = Ellipsoid.withB(
    a: 6378206.4,
    b: 6356583.8,
    ellipseName: 'Clarke 1866',
    shortName: 'clrk66');

final clrk80 = Ellipsoid(
    a: 6378249.145,
    rf: 293.4663,
    ellipseName: 'Clarke 1880 mod.',
    shortName: 'clrk80');

final clrk58 = Ellipsoid(
    a: 6378293.645208759,
    rf: 294.2606763692654,
    ellipseName: 'Clarke 1858',
    shortName: 'clrk58');

final CPM = Ellipsoid(
    a: 6375738.7,
    rf: 334.29,
    ellipseName: 'Comm. des Poids et Mesures 1799',
    shortName: 'CPM');

final delmbr = Ellipsoid(
    a: 6376428.0,
    rf: 311.5,
    ellipseName: 'Delambre 1810 (Belgium)',
    shortName: 'delmbr');

final engelis = Ellipsoid(
    a: 6378136.05,
    rf: 298.2566,
    ellipseName: 'Engelis 1985',
    shortName: 'engelis');

final evrst30 = Ellipsoid(
    a: 6377276.345,
    rf: 300.8017,
    ellipseName: 'Everest 1830',
    shortName: 'evrst30');

final evrst48 = Ellipsoid(
    a: 6377304.063,
    rf: 300.8017,
    ellipseName: 'Everest 1948',
    shortName: 'evrst48');

final evrst56 = Ellipsoid(
    a: 6377301.243,
    rf: 300.8017,
    ellipseName: 'Everest 1956',
    shortName: 'evrst56');

final evrst69 = Ellipsoid(
    a: 6377295.664,
    rf: 300.8017,
    ellipseName: 'Everest 1969',
    shortName: 'evrst69');

final evrstSS = Ellipsoid(
    a: 6377298.556,
    rf: 300.8017,
    ellipseName: 'Everest (Sabah & Sarawak)',
    shortName: 'evrstSS');

final fschr60 = Ellipsoid(
    a: 6378166.0,
    rf: 298.3,
    ellipseName: 'Fischer (Mercury Datum) 1960',
    shortName: 'fschr60');

final fschr60m = Ellipsoid(
    a: 6378155.0,
    rf: 298.3,
    ellipseName: 'Fischer 1960',
    shortName: 'fschr60m');

final fschr68 = Ellipsoid(
    a: 6378150.0, rf: 298.3, ellipseName: 'Fischer 1968', shortName: 'fschr68');

final helmert = Ellipsoid(
    a: 6378200.0, rf: 298.3, ellipseName: 'Helmert 1906', shortName: 'helmert');

final hough = Ellipsoid(
    a: 6378270.0, rf: 297.0, ellipseName: 'Hough', shortName: 'hough');

final intl = Ellipsoid(
    a: 6378388.0,
    rf: 297.0,
    ellipseName: 'International 1909 (Hayford)',
    shortName: 'intl');

final kaula = Ellipsoid(
    a: 6378163.0, rf: 298.24, ellipseName: 'Kaula 1961', shortName: 'kaula');

final lerch = Ellipsoid(
    a: 6378139.0, rf: 298.257, ellipseName: 'Lerch 1979', shortName: 'lerch');

final mprts = Ellipsoid(
    a: 6397300.0,
    rf: 191.0,
    ellipseName: 'Maupertius 1738',
    shortName: 'mprts');

final new_intl = Ellipsoid.withB(
    a: 6378157.5,
    b: 6356772.2,
    ellipseName: 'New International 1967',
    shortName: 'new_intl');

final plessis = Ellipsoid(
    a: 6376523.0,
    rf: 6355863.0,
    ellipseName: 'Plessis 1817 (France)',
    shortName: 'plessis');

final krass = Ellipsoid(
    a: 6378245.0,
    rf: 298.3,
    ellipseName: 'Krassovsky, 1942',
    shortName: 'krass');

final SEasia = Ellipsoid.withB(
    a: 6378155.0,
    b: 6356773.3205,
    ellipseName: 'Southeast Asia',
    shortName: 'SEasia');

final walbeck = Ellipsoid.withB(
    a: 6376896.0,
    b: 6355834.8467,
    ellipseName: 'Walbeck',
    shortName: 'walbeck');

final WGS60 = Ellipsoid(
    a: 6378165.0, rf: 298.3, ellipseName: 'WGS 60', shortName: 'WGS60');

final WGS66 = Ellipsoid(
    a: 6378145.0, rf: 298.25, ellipseName: 'WGS 66', shortName: 'WGS66');

final WGS7 = Ellipsoid(
    a: 6378135.0, rf: 298.26, ellipseName: 'WGS 72', shortName: 'WGS7');

final WGS84 = Ellipsoid(
    a: 6378137.0, rf: 298.257223563, ellipseName: 'WGS 84', shortName: 'EGS84');

final sphere = Ellipsoid.withB(
    a: 6370997.0,
    b: 6370997.0,
    ellipseName: 'Normal Sphere (r=6370997)',
    shortName: 'sphere');

final List<Ellipsoid> _ellipsoids = [
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

Ellipsoid match(String ellipseName) {
  var ell = _ellipsoids
      .where((element) =>
          element.shortName.toLowerCase() == ellipseName.toLowerCase())
      .toList();
  return ell.length == 1 ? ell[0] : null;
}
