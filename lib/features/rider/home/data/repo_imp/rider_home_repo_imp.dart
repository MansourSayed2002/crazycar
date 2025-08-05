import 'package:crazycar/features/rider/home/data/api/rider_home_api.dart';
import 'package:crazycar/features/rider/home/domain/repo_abs/rider_home_repo_abs.dart';

class RiderHomeRepoImp extends RiderHomeRepoAbs {
  @override
  Future getNearbyDrivers(Map<String, dynamic>? params) async {
    return RiderHomeApi.getNearbyDrivers(params);
  }
}
