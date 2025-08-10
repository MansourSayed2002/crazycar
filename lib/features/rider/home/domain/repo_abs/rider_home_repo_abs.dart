abstract class RiderHomeRepoAbs {
  Future getNearbyDrivers(Map<String, dynamic>? params);
  requestTrip(Map<String, dynamic>? params, Map<String, dynamic>? paramsTripds);
  Future<bool> checkDriverStatus(id);
}
