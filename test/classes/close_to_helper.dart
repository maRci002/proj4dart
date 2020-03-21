class CloseToHelper {
  int testedAgainst = 0;

  double _sumForwardX = 0.0;
  int _counterForwardX = 0;
  double worstForwardX;
  void putForwardX(double value) {
    _sumForwardX += value;
    _counterForwardX++;
    if (worstForwardX == null || value > worstForwardX) {
      worstForwardX = value;
    }
  }

  double get avgForwardX => _sumForwardX / _counterForwardX;

  double _sumForwardY = 0.0;
  int _counterForwardY = 0;
  double worstForwardY;
  void putForwardY(double value) {
    _sumForwardY += value;
    _counterForwardY++;
    if (worstForwardY == null || value > worstForwardY) {
      worstForwardY = value;
    }
  }

  double get avgForwardY => _sumForwardY / _counterForwardY;

  double _sumInverseX = 0.0;
  int _counterInverseX = 0;
  double worstInverseX;
  void putInverseX(double value) {
    _sumInverseX += value;
    _counterInverseX++;
    if (worstInverseX == null || value > worstInverseX) {
      worstInverseX = value;
    }
  }

  double get avgInverseX => _sumInverseX / _counterInverseX;

  double _sumInverseY = 0.0;
  int _counterInverseY = 0;
  double worstInverseY;
  void putInverseY(double value) {
    _sumInverseY += value;
    _counterInverseY++;
    if (worstInverseY == null || value > worstInverseY) {
      worstInverseY = value;
    }
  }

  double get avgInverseY => _sumInverseY / _counterInverseY;
}
