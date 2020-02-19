import 'package:proj4dart/src/classes/constant_datum.dart';

final wgs84 =
    ConstantDatum(towgs84: '0,0,0', ellipse: 'WGS84', datumName: 'WGS84');

final ch1903 = ConstantDatum(
    towgs84: '674.374,15.056,405.346', ellipse: 'bessel', datumName: 'swiss');

final ggrs87 = ConstantDatum(
    towgs84: '-199.87,74.79,246.62',
    ellipse: 'GRS80',
    datumName: 'Greek_Geodetic_Reference_System_1987');

final nad83 = ConstantDatum(
    towgs84: '0,0,0', ellipse: 'GRS80', datumName: 'North_American_Datum_1983');

final nad27 = ConstantDatum.withNadgrid(
    nadgrids: '@conus,@alaska,@ntv2_0.gsb,@ntv1_can.dat',
    ellipse: 'clrk66',
    datumName: 'North_American_Datum_1927');

final potsdam = ConstantDatum(
    towgs84: '606.0,23.0,413.0',
    ellipse: 'bessel',
    datumName: 'Potsdam Rauenberg 1950 DHDN');

final carthage = ConstantDatum(
    towgs84: '-263.0,6.0,431.0',
    ellipse: 'clark80',
    datumName: 'Carthage 1934 Tunisia');

final hermannskogel = ConstantDatum(
    towgs84: '653.0,-212.0,449.0',
    ellipse: 'bessel',
    datumName: 'Hermannskogel');

final osni52 = ConstantDatum(
    towgs84: '482.530,-130.596,564.557,-1.042,-0.214,-0.631,8.15',
    ellipse: 'airy',
    datumName: 'Irish National');

final ire65 = ConstantDatum(
    towgs84: '482.530,-130.596,564.557,-1.042,-0.214,-0.631,8.15',
    ellipse: 'mod_airy',
    datumName: 'Ireland 1965');

final rassadiran = ConstantDatum(
    towgs84: '-133.63,-157.5,-158.62',
    ellipse: 'intl',
    datumName: 'Rassadiran');

final nzgd49 = ConstantDatum(
    towgs84: '59.47,-5.04,187.44,0.47,-0.1,1.024,-4.5993',
    ellipse: 'intl',
    datumName: 'New Zealand Geodetic Datum 1949');

final osgb36 = ConstantDatum(
    towgs84: '446.448,-125.157,542.060,0.1502,0.2470,0.8421,-20.4894',
    ellipse: 'airy',
    datumName: 'Airy 1830');

final s_jtsk = ConstantDatum(
    towgs84: '589,76,480', ellipse: 'bessel', datumName: 'S-JTSK (Ferro)');

final beduaram = ConstantDatum(
    towgs84: '-106,-87,188', ellipse: 'clrk80', datumName: 'Beduaram');

final gunung_segara = ConstantDatum(
    towgs84: '-403,684,41',
    ellipse: 'bessel',
    datumName: 'Gunung Segara Jakarta');

final rnb72 = ConstantDatum(
    towgs84: '106.869,-52.2978,103.724,-0.33657,0.456955,-1.84218,1',
    ellipse: 'intl',
    datumName: 'Reseau National Belge 1972');
