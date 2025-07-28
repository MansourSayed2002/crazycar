import 'package:crazycar/features/auth/data/model/remote/user_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageApp {
  static late SharedPreferences sharedPreferences;
  static late Box userBox;

  static initStorage() async {
    sharedPreferences = await SharedPreferences.getInstance();
    userBox = await Hive.openBox<UserModel>("userbox");
  }

  static setHiveData(String key, dynamic value) {
    userBox.put(key, value);
  }

  static getHiveData(String key) => userBox.get(key);

  static saveData(String key, dynamic value) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
  }

  static getData(String key) => sharedPreferences.get(key);

  static clearStorage() async {
    await sharedPreferences.clear();
    await userBox.compact();
    await userBox.clear();
  }
}
