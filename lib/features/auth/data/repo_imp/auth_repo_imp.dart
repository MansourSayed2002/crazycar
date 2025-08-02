import 'dart:developer';
import 'dart:io';

import 'package:crazycar/core/constants/tables_database_app.dart';
import 'package:crazycar/core/enum/type_user.dart';
import 'package:crazycar/features/auth/data/api/auth_api.dart';
import 'package:crazycar/features/auth/domain/repo_abs/auth_repo_abs.dart';

class AuthRepoImp extends AuthRepoAbs {
  @override
  Future logIn(String value, TypeUser type) async {
        final prefix =
        type == TypeUser.driver
            ? TablesDatabaseApp.driver
            : TablesDatabaseApp.rider;
    var response = await AuthApi.selectEq(
    prefix,
      "${prefix}_phone",
      value,
      "${prefix}_activation",
      1,
    );

    return response;
  }

  @override
  Future register(Map data, TypeUser type) async {
    var response = await AuthApi.insert(
      type == TypeUser.driver
          ? TablesDatabaseApp.driver
          : TablesDatabaseApp.rider,
      data,
    );
    return response;
  }

  @override
  createVerifyAndSend(Map data, String value, TypeUser type) async {
    final prefix =
        type == TypeUser.driver
            ? TablesDatabaseApp.driver
            : TablesDatabaseApp.rider;
    await AuthApi.updateEq(prefix, data, "${prefix}_phone", value);
  }

  @override
  checkVerifyCode(String phone, TypeUser typeuser) async {
    final prefix =
        typeuser == TypeUser.driver
            ? TablesDatabaseApp.driver
            : TablesDatabaseApp.rider;
    var response = await AuthApi.selectFilter(
      prefix,
      "${prefix}_verifycode",
      "${prefix}_phone",
      phone,
    );
    return response;
  }

  @override
  completeRegister(Map data, String value) async {
    var response = await AuthApi.updateEq(
      TablesDatabaseApp.driver,
      data,
      TablesDatabaseApp.driverphone,
      value,
    );
    return response;
  }

  @override
  uplaodImageUser(File file, String path, String phone, TypeUser type) async {
    try {
      await AuthApi.uploadFile(TablesDatabaseApp.imageBucket, path, file);
      final prefix =
          type == TypeUser.driver
              ? TablesDatabaseApp.driver
              : TablesDatabaseApp.rider;
      await AuthApi.updateEq(
        prefix,
        {"${prefix}_image": path},
        "${prefix}_phone",
        phone,
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
