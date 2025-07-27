import 'dart:math';

import 'package:crazycar/core/class/local_storage.dart';
import 'package:crazycar/core/enum/type_user.dart';
import 'package:crazycar/core/function/send_verifycode.dart';
import 'package:crazycar/features/auth/data/model/remote/user_model.dart';
import 'package:crazycar/features/auth/domain/repo_abs/auth_repo_abs.dart';

class CreateVerifyAndSendUsecase {
  CreateVerifyAndSendUsecase({required this.authRepoAbs});
  late AuthRepoAbs authRepoAbs;
  operationOfVerify(TypeUser typeUser) async {
    var verifyCode = Random().nextInt(99999);
    if (verifyCode > 10000) {
      UserModel user = await LocalStorageApp.getHiveData("user_data");
      authRepoAbs.createVerifyAndSend(
        {
          typeUser == TypeUser.driver
                  ? "driver_verifycode"
                  : "rider_verifycode":
              verifyCode,
        },
        user.userPhone.toString(),
        typeUser,
      );
      sendVerifyCode(
        email: user.userEmail.toString(),
        message: verifyCode.toString(),
      );
    } else {
      operationOfVerify(typeUser);
    }
  }
}
