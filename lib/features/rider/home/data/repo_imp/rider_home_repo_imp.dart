import 'dart:developer';

import 'package:crazycar/core/constants/tables_database_app.dart';
import 'package:crazycar/features/rider/home/data/api/rider_home_api.dart';
import 'package:crazycar/features/rider/home/domain/repo_abs/rider_home_repo_abs.dart';

class RiderHomeRepoImp extends RiderHomeRepoAbs {
  @override
  Future getNearbyDrivers(params) async {
    return RiderHomeApi.rpc("get_nearby_drivers", params);
  }

  Future<int> addTrips(element, Map<String, dynamic>? params) async {
    Map<String, dynamic> data = {
      "target_driver_id": element['driver_id'],
      ...params!,
    };
    List id = await RiderHomeApi.rpc("create_trip_if_no_active_trip", data);

    return id.first['trip_id'];
  }

  @override
  Future<bool> checkDriverStatus(id) async {
    await Future.delayed(Duration(seconds: 20));
    List status = await RiderHomeApi.selectEq(
      TablesDatabaseApp.trips,
      TablesDatabaseApp.tripsStatus,
      TablesDatabaseApp.tripsId,
      id,
    );

    if (status.first['trips_status'] == "accepted") {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> requestTrip(
    Map<String, dynamic>? params,
    Map<String, dynamic>? paramsTrips,
  ) async {
    List response = await RiderHomeApi.rpc("get_nearby_drivers", params);

    for (var element in response) {
      int id = await addTrips(element, paramsTrips);
      bool check = await checkDriverStatus(id);
      if (check) {
        return check;
      } else {
        log("السائق رفض أو لم يرد");
      }
    }
    return false;
  }
}
