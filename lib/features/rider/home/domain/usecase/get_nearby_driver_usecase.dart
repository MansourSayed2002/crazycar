import 'dart:developer';

import 'package:crazycar/core/class/api_result.dart';
import 'package:crazycar/core/enum/status_request.dart';
import 'package:crazycar/features/rider/home/domain/repo_abs/rider_home_repo_abs.dart';

class GetNearbyDriverUsecase {
  GetNearbyDriverUsecase({required this.riderHomeRepoAbs});

  late RiderHomeRepoAbs riderHomeRepoAbs;

  Future<ApiResult> getNearbyDrivers(double latitude, double longitude) async {
    try {
      final response = await riderHomeRepoAbs.getNearbyDrivers({
        "target_longitude": longitude,
        "target_latitude": latitude,
        "radius_meters": 3000.0,
      });
      if (response.isNotEmpty) {
        return ApiSuccess(response);
      } else {
        return ApiFailure(
          statusRequest: StatusRequest.nodatafailure,
          message: "No nearby drivers found.",
        );
      }
    } catch (e) {
      log(e.toString());
      return ApiFailure(
        statusRequest: StatusRequest.serverfailure,
        message: "Something went wrong while fetching nearby drivers.",
      );
    }
  }
}
