import 'dart:developer';

import 'package:crazycar/core/class/api_result.dart';
import 'package:crazycar/core/class/local_storage.dart';
import 'package:crazycar/core/constants/text_app.dart';
import 'package:crazycar/core/enum/status_request.dart';
import 'package:crazycar/features/auth/data/model/remote/user_model.dart';
import 'package:crazycar/features/rider/home/domain/repo_abs/rider_home_repo_abs.dart';

class RequestTripUsecase {
  late RiderHomeRepoAbs riderHomeRepoAbs;
  RequestTripUsecase({required this.riderHomeRepoAbs});

  Future<ApiResult> requestTrip({
    required double pickUplate,
    required double pickUpLong,
    required double dropOfflate,
    required double dropOfflong,
    required String pickUpAddress,
    required String dropOffAddress,
  }) async {
    try {
      UserModel user = await LocalStorageApp.getHiveData("user_data");
      bool result = await riderHomeRepoAbs.requestTrip(
        {
          "target_longitude": pickUpLong,
          "target_latitude": pickUplate,
          "radius_meters": 5000.0,
        },
        {
          "target_rider_id": user.userId,
          "target_price": 300,
          "target_pickup_location": 'SRID=4326;POINT($pickUpLong $pickUplate)',
          "target_dropoff_location":
              'SRID=4326;POINT($dropOfflong $dropOfflate)',
          "target_pickup_address": pickUpAddress,
          "target_dropoff_address": dropOffAddress,
        },
      );
      if (result) {
        return ApiSuccess(StatusRequest.success);
      } else {
        return ApiFailure(
          statusRequest: StatusRequest.success,
          message: TextApp.noDriverFound,
        );
      }
    } catch (e) {
      log(e.toString());
      return ApiFailure(
        statusRequest: StatusRequest.success,
        message: TextApp.error,
      );
    }
  }
}
