import 'dart:developer';
import 'dart:io';
import 'package:crazycar/core/class/api_result.dart';
import 'package:crazycar/core/class/local_storage.dart';
import 'package:crazycar/core/constants/tables_database_app.dart';
import 'package:crazycar/core/enum/status_request.dart';
import 'package:crazycar/core/enum/type_user.dart';
import 'package:crazycar/core/function/get_token.dart';
import 'package:crazycar/core/function/handling_error.dart';
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
      final prefix = type == TypeUser.driver ? 'driver' : 'rider';
      List response = await authRepoAbs.register({
        "${prefix}_name": data.userName,
        "${prefix}_email": data.userEmail,
        "${prefix}_phone": data.userPhone,
        "${prefix}_token": token,
      }, type);
      LocalStorageApp.setHiveData(
        "user_data",
        UserModel.fromJson(response.first),
      );
      await uploadImage(prefix, image, type);
      return ApiSuccess(StatusRequest.success);
    } catch (e) {
      log(e.toString());
      return handleError(e);
    }
  }

  Future<void> uploadImage(prefix, image, type) async {
    UserModel user = await LocalStorageApp.getHiveData("user_data");
    await authRepoAbs.uplaodImageUser(
      image.first,
      "$prefix/${TablesDatabaseApp.imagePathProfile}/${user.userId}/${image.first.toString().split("/").last.split("'").first}",
      user.userPhone.toString(),
      type,
    );
  }
}
