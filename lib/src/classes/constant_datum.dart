class ConstantDatum {
  String? towgs84;
  String ellipse;
  String datumName;
  String? nadgrids;

  ConstantDatum({
    required String this.towgs84,
    required this.ellipse,
    required this.datumName,
  });

  ConstantDatum.withNadgrid({
    required String this.nadgrids,
    required this.ellipse,
    required this.datumName,
  });
}
