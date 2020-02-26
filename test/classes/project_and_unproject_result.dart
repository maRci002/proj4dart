import 'package:proj4dart/proj4dart.dart';

class ProjectAndUnProjectResult {
  final Point wgsToCustom;
  final Point customToWgs;

  ProjectAndUnProjectResult(this.wgsToCustom, this.customToWgs);

  @override
  String toString() {
    return 'wgsToCustom: $wgsToCustom customToWgs: $customToWgs';
  }
}
