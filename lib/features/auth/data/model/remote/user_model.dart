import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final int? userId;
  @HiveField(1)
  final String? userName;
  @HiveField(2)
  final String? userEmail;
  @HiveField(3)
  final String? userVerifyCode;
  @HiveField(4)
  final String? userPhone;
  @HiveField(5)
  final String? userImage;
  @HiveField(6)
  final String? userToken;
  @HiveField(7)
  final String? userCreatedAt;

  UserModel({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userVerifyCode,
    required this.userPhone,
    required this.userImage,
    required this.userToken,
    required this.userCreatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['driver_id'] ?? json['rider_id'],
      userName: json['driver_name'] ?? json['rider_name'],
      userEmail: json['driver_email'] ?? json['rider_email'],
      userVerifyCode: json['user_verifycode'] ?? json['rider_verifycode'],
      userPhone: json['driver_phone'] ?? json['rider_phone'],
      userImage: json['driver_image'] ?? json['rider_image'],
      userToken: json['driver_token'] ?? json['rider_token'],
      userCreatedAt: json['driver_created_at'] ?? json['rider_created_at'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'user_id': userId,
  //     'user_name': userName,
  //     'user_email': userEmail,
  //     'user_verifycode': userVerifyCode,
  //     'user_phone': userPhone,
  //     'user_image': userImage,
  //     'user_token': userToken,
  //     'user_created_at': userCreatedAt,
  //   };
  // }
}
