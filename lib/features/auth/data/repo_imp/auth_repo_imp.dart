import 'dart:developer';
import 'dart:io';

import 'package:crazycar/core/constants/tables_database_app.dart';
import 'package:crazycar/core/enum/type_user.dart';
import 'package:crazycar/features/auth/data/api/auth_api.dart';
import 'package:crazycar/features/auth/domain/repo_abs/auth_repo_abs.dart';

class AuthRepoImp extends AuthRepoAbs {
  @override
  Future logIn(String value, TypeUser type) async {
    var response = await AuthApi.selectEq(
      type == TypeUser.driver
          ? TablesDatabaseApp.driver
          : TablesDatabaseApp.rider,
      type == TypeUser.driver
          ? TablesDatabaseApp.driverphone
          : TablesDatabaseApp.riderphone,
      value,
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
    await AuthApi.updateEq(
      type == TypeUser.driver
          ? TablesDatabaseApp.driver
          : TablesDatabaseApp.rider,
      data,
      type == TypeUser.driver
          ? TablesDatabaseApp.driverphone
          : TablesDatabaseApp.riderphone,
      value,
    );
  }

  @override
  checkVerifyCode(String phone, TypeUser typeuser) async {
    var response = await AuthApi.selectFilter(
      typeuser == TypeUser.driver
          ? TablesDatabaseApp.driver
          : TablesDatabaseApp.rider,
      typeuser == TypeUser.driver
          ? TablesDatabaseApp.driverVerifyCode
          : TablesDatabaseApp.riderVerifyCode,
      typeuser == TypeUser.driver
          ? TablesDatabaseApp.driverphone
          : TablesDatabaseApp.riderphone,
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

      await AuthApi.updateEq(
        type == TypeUser.driver
            ? TablesDatabaseApp.driver
            : TablesDatabaseApp.rider,
        {
          type == TypeUser.driver
                  ? TablesDatabaseApp.driverImage
                  : TablesDatabaseApp.riderImage:
              path,
        },
        type == TypeUser.driver
            ? TablesDatabaseApp.driverphone
            : TablesDatabaseApp.driverphone,
        phone,
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
