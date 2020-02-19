class ConstantDatum {
  String towgs84;
  String ellipse;
  String datumName;
  String nadgrids;

  ConstantDatum({String towgs84, String ellipse, String datumName})
      : towgs84 = towgs84,
        ellipse = ellipse,
        datumName = datumName;

  ConstantDatum.withNadgrid({String nadgrids, String ellipse, String datumName})
      : nadgrids = nadgrids,
        ellipse = ellipse,
        datumName = datumName;
}
