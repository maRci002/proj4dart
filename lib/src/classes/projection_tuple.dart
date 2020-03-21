import 'package:meta/meta.dart';
import 'package:proj4dart/proj4dart.dart';

/// Creates a ProjectionTuple which makes vice versa conversions easier.
class ProjectionTuple {
  final Projection fromProj;
  final Projection toProj;

  ProjectionTuple({@required this.fromProj, @required this.toProj})
      : assert(null != fromProj),
        assert(null != toProj);

  Point forward(Point point) {
    return fromProj.transform(toProj, point);
  }

  Point inverse(Point point) {
    return toProj.transform(fromProj, point);
  }
}
