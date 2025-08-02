import 'dart:developer';

import 'package:crazycar/core/class/api_result.dart';
import 'package:crazycar/core/class/local_storage.dart';
import 'package:crazycar/core/constants/text_app.dart';
import 'package:crazycar/core/enum/status_request.dart';
import 'package:crazycar/core/enum/type_user.dart';
import 'package:crazycar/core/function/handling_error.dart';
import 'package:crazycar/features/auth/data/model/remote/user_model.dart';
import 'package:crazycar/features/auth/domain/repo_abs/auth_repo_abs.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginUsecase {
  LoginUsecase({required this.authRepoAbs});

  late AuthRepoAbs authRepoAbs;

  Future<ApiResult> login(String phone, TypeUser typeuser) async {
    try {
      List response = await authRepoAbs.logIn(phone, typeuser);
      if (response.isNotEmpty) {
        LocalStorageApp.setHiveData(
          "user_data",
          UserModel.fromJson(response.first),
        );
        return ApiSuccess(StatusRequest.success);
      } else {
        return ApiFailure(
          message: TextApp.errorLogin.tr(),
          statusRequest: StatusRequest.failure,
        );
      }
    } catch (e) {
      log(e.toString());
      return handleError(e);
    }
  }
}
