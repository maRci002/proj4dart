import 'package:proj4dart/src/classes/point.dart';

/// Holds forward and inverse results
class ProjectAndUnProjectResult {
  final Point forwardResult;
  final Point inverseResult;
  final String forwardResultError;
  final String inverseResultError;

  ProjectAndUnProjectResult(this.forwardResult, this.inverseResult,
      {this.forwardResultError, this.inverseResultError});

  @override
  String toString() {
    return 'forwardResult: ${forwardResultError ?? forwardResult} inverseResult: ${inverseResultError ?? inverseResult}';
  }
}
