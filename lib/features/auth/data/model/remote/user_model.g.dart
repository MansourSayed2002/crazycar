// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      userId: fields[0] as int?,
      userName: fields[1] as String?,
      userEmail: fields[2] as String?,
      userVerifyCode: fields[3] as String?,
      userPhone: fields[4] as String?,
      userImage: fields[5] as String?,
      userToken: fields[6] as String?,
      userCreatedAt: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.userEmail)
      ..writeByte(3)
      ..write(obj.userVerifyCode)
      ..writeByte(4)
      ..write(obj.userPhone)
      ..writeByte(5)
      ..write(obj.userImage)
      ..writeByte(6)
      ..write(obj.userToken)
      ..writeByte(7)
      ..write(obj.userCreatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
