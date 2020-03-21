class CloseToHelper {
  int testedAgainst = 0;

  double _sumForwardX = 0.0;
  int _counterForwardX = 0;
  double _worstForwardX;
  void putForwardX(double value) {
    _sumForwardX += value;
    _counterForwardX++;
    if (_worstForwardX == null || value > _worstForwardX) {
      _worstForwardX = value;
    }
  }

  double get avgForwardX => _sumForwardX / _counterForwardX;

  double _sumForwardY = 0.0;
  int _counterForwardY = 0;
  double _worstForwardY;
  void putForwardY(double value) {
    _sumForwardY += value;
    _counterForwardY++;
    if (_worstForwardY == null || value > _worstForwardY) {
      _worstForwardY = value;
    }
  }

  double get avgForwardY => _sumForwardY / _counterForwardY;

  double _sumInverseX = 0.0;
  int _counterInverseX = 0;
  double _worstInverseX;
  void putInverseX(double value) {
    _sumInverseX += value;
    _counterInverseX++;
    if (_worstInverseX == null || value > _worstInverseX) {
      _worstInverseX = value;
    }
  }

  double get avgInverseX => _sumInverseX / _counterInverseX;

  double _sumInverseY = 0.0;
  int _counterInverseY = 0;
  double _worstInverseY;
  void putInverseY(double value) {
    _sumInverseY += value;
    _counterInverseY++;
    if (_worstInverseY == null || value > _worstInverseY) {
      _worstInverseY = value;
    }
  }

  double get avgInverseY => _sumInverseY / _counterInverseY;
}
