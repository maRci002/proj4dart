import 'package:proj4dart/src/classes/proj_params.dart';
import 'package:proj4dart/src/common/utils.dart' as utils;
import 'package:proj4dart/src/constants/values.dart' as consts;
import 'package:proj4dart/src/projections/etmerc.dart';

class UniversalTransverseMercatorProjection
    extends ExtendedTransverseMercatorProjection {
  static final List<String> names = [
    'Universal Transverse Mercator System',
    'utm'
  ];

  int zone;
  bool utmSouth;
  @override
  double lat0;
  @override
  double long0;
  @override
  double x0;
  @override
  double y0;
  @override
  double k0;

  UniversalTransverseMercatorProjection.init(ProjParams params)
      : zone = utils.adjust_zone(params.zone, params.long0),
        utmSouth = params.utmSouth,
        lat0 = 0,
        long0 = ((6 * params.zone.abs()) - 183) * consts.D2R,
        x0 = 500000,
        y0 = params.utmSouth != null && params.utmSouth ? 10000000 : 0,
        k0 = 0.9996,
        super.init(params) {
    if (zone == null) {
      throw Exception('Unknown utm zone');
    }
  }
}
