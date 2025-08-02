import 'dart:developer';
import 'dart:io';

import 'package:crazycar/core/class/api_result.dart';
import 'package:crazycar/core/class/local_storage.dart';
import 'package:crazycar/core/constants/tables_database_app.dart';
import 'package:crazycar/core/enum/status_request.dart';
import 'package:crazycar/core/enum/type_user.dart';
import 'package:crazycar/core/function/handling_error.dart';
import 'package:crazycar/features/auth/data/model/remote/user_model.dart';
import 'package:crazycar/features/auth/domain/repo_abs/auth_repo_abs.dart';

class CompleteRegisterUsecase {
  CompleteRegisterUsecase({required this.authRepoAbs});

  late AuthRepoAbs authRepoAbs;

  Future<ApiResult> completeRegister(List<File> image) async {
    try {
      UserModel user = await LocalStorageApp.getHiveData("user_data");
      await uploadImageUser(image, TypeUser.driver);
      await authRepoAbs.completeRegister({
        "driver_idcard":
            "${TablesDatabaseApp.imagePathCompleteDiver}/${user.userId}/${image[0].toString().split("/").last.split("'").first}",
        "driver_idcardback":
            "${TablesDatabaseApp.imagePathCompleteDiver}/${user.userId}/${image[1].toString().split("/").last.split("'").first}",
        "driver_you_idcard":
            "${TablesDatabaseApp.imagePathCompleteDiver}/${user.userId}/${image[2].toString().split("/").last.split("'").first}",
      }, user.userPhone.toString());
      return ApiSuccess(StatusRequest.success);
    } catch (e) {
      log(e.toString());
      return handleError(e);
    }
  }

  uploadImageUser(List<File> image, TypeUser type) async {
    UserModel user = await LocalStorageApp.getHiveData("user_data");
    for (var i = 0; i < image.length; i++) {
      await authRepoAbs.uplaodImageUser(
        image[i],
        "${TablesDatabaseApp.imagePathCompleteDiver}/${user.userId}/${image[i].toString().split("/").last.split("'").first}",
        user.userPhone.toString(),
        type,
      );
    }
  }
}
