import 'dart:developer';
import 'dart:io';

import 'package:crazycar/core/class/api_result.dart';
import 'package:crazycar/core/class/local_storage.dart';
import 'package:crazycar/core/constants/tables_database_app.dart';
import 'package:crazycar/core/enum/status_request.dart';
import 'package:crazycar/core/enum/type_user.dart';
import 'package:crazycar/core/function/get_token.dart';
import 'package:crazycar/features/auth/data/model/remote/user_model.dart';
import 'package:crazycar/features/auth/domain/repo_abs/auth_repo_abs.dart';

class RegisterUsecase {
  RegisterUsecase({required this.authRepoAbs});
  AuthRepoAbs authRepoAbs;
  Future<ApiResult> register(
    UserModel data,
    TypeUser type,
    List<File> image,
  ) async {
    try {
      String token = await getToken();
      List response = await authRepoAbs.register({
        type == TypeUser.driver ? "driver_name" : "rider_name": data.userName,
        type == TypeUser.driver ? "driver_email" : "rider_email":
            data.userEmail,
        type == TypeUser.driver ? "driver_phone" : "rider_phone":
            data.userPhone,
        type == TypeUser.driver ? "driver_token" : "rider_token": token,
      }, type);
      LocalStorageApp.setHiveData(
        "user_data",
        UserModel.fromJson(response.first),
      );
      UserModel user = await LocalStorageApp.getHiveData("user_data");
      await authRepoAbs.uplaodImageUser(
        image.first,
        "${TablesDatabaseApp.imagePathProfile}/${user.userId}/${image.first.toString().split("/").last}",
        user.userPhone.toString(),
        type,
      );
      return ApiSuccess(StatusRequest.success);
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.serverfailure);
    }
  }
}
