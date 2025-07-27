import 'dart:io';

import 'package:crazycar/core/enum/type_user.dart';

abstract class AuthRepoAbs {
  logIn(String value, TypeUser typeUser);
  register(Map data, TypeUser type);
  completeRegister(Map data, String value);
  createVerifyAndSend(Map data, String value, TypeUser typeUser);
  checkVerifyCode(String phone, TypeUser typeuser);
  uplaodImageUser(File file, String path, String phone, TypeUser type);
}
