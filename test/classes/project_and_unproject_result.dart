import 'package:proj4dart/src/classes/point.dart';

class ProjectAndUnProjectResult {
  final Point wgsToCustom;
  final Point customToWgs;

  ProjectAndUnProjectResult(this.wgsToCustom, this.customToWgs);

  @override
  String toString() {
    return 'wgsToCustom: $wgsToCustom customToWgs: $customToWgs';
  }
}
