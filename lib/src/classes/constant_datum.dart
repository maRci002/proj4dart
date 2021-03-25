class ConstantDatum {
  String? towgs84;
  String ellipse;
  String datumName;
  String? nadgrids;

  ConstantDatum({required String towgs84, required String ellipse, required String datumName})
      : towgs84 = towgs84,
        ellipse = ellipse,
        datumName = datumName;

  ConstantDatum.withNadgrid({required String nadgrids, required String ellipse, required String datumName})
      : nadgrids = nadgrids,
        ellipse = ellipse,
        datumName = datumName;
}
