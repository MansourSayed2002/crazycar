import 'dart:developer';

import 'package:crazycar/core/class/api_result.dart';
import 'package:crazycar/core/class/local_storage.dart';
import 'package:crazycar/core/enum/status_request.dart';
import 'package:crazycar/core/enum/type_user.dart';
import 'package:crazycar/core/function/handling_error.dart';
import 'package:crazycar/features/auth/data/model/remote/user_model.dart';
import 'package:crazycar/features/auth/domain/repo_abs/auth_repo_abs.dart';

class CheckVerifyUseCase {
  CheckVerifyUseCase({required this.authRepoAbs});

  AuthRepoAbs authRepoAbs;

  Future<ApiResult> checkVerifyCode(String opt, TypeUser typeuser) async {
    try {
      UserModel user = await LocalStorageApp.getHiveData("user_data");
      var response = await authRepoAbs.checkVerifyCode(
        user.userPhone.toString(),
        typeuser,
      );
      if (response
              .first[typeuser == TypeUser.driver
                  ? "driver_verifycode"
                  : "rider_verifycode"]
              .toString() ==
          opt) {
        return ApiSuccess(StatusRequest.success);
      } else {
        return ApiFailure(
          statusRequest: StatusRequest.failure,
          message: "The code is not correct",
        );
      }
    } catch (e) {
      log(e.toString());
      return handleError(e);
    }
  }
}
