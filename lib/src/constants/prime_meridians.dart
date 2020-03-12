final greenwich = 0.0; //"0dE",
final lisbon = -9.131906111111; //"9d07'54.862\"W",
final paris = 2.337229166667; //"2d20'14.025\"E",
final bogota = -74.080916666667; //"74d04'51.3\"W",
final madrid = -3.687938888889; //"3d41'16.58\"W",
final rome = 12.452333333333; //"12d27'8.4\"E",
final bern = 7.439583333333; //"7d26'22.5\"E",
final jakarta = 106.807719444444; //"106d48'27.79\"E",
final ferro = -17.666666666667; //"17d40'W",
final brussels = 4.367975; //"4d22'4.71\"E",
final stockholm = 18.058277777778; //"18d3'29.8\"E",
final athens = 23.7163375; //"23d42'58.815\"E",
final oslo = 10.722916666667;

final _items = {
  'greenwich': greenwich,
  'lisbon': lisbon,
  'paris': paris,
  'bogota': bogota,
  'madrid': madrid,
  'rome': rome,
  'bern': bern,
  'jakarta': jakarta,
  'ferro': ferro,
  'brussels': brussels,
  'stockholm': stockholm,
  'athens': athens,
  'oslo': oslo
};

double match(String name) {
  return _items[name];
}
