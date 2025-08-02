import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:crazycar/core/class/api_result.dart';
import 'package:crazycar/core/enum/type_user.dart';
import 'package:crazycar/features/auth/data/model/remote/user_model.dart';
import 'package:crazycar/features/auth/domain/usecase/check_verify.dart';
import 'package:crazycar/features/auth/domain/usecase/complete_register_usecase.dart';
import 'package:crazycar/features/auth/domain/usecase/create_verify_and_send_usecase.dart';
import 'package:crazycar/features/auth/domain/usecase/login_usecase.dart';
import 'package:crazycar/features/auth/domain/usecase/register_usecase.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.loginUsecase,
    required this.checkVerifyUseCase,
    required this.createVerify,
    required this.registerUsecase,
    required this.completeRegisterUsecase,
  }) : super(AuthInitial());

  late LoginUsecase loginUsecase;
  late CreateVerifyAndSendUsecase createVerify;
  late CheckVerifyUseCase checkVerifyUseCase;
  late RegisterUsecase registerUsecase;
  late CompleteRegisterUsecase completeRegisterUsecase;

  TextEditingController userPhoneNumberController = TextEditingController();
  TextEditingController optController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  List<File> image = [];

  Future<void> login(TypeUser type) async {
    emit(LogInLoading());
    var response = await loginUsecase.login(
      userPhoneNumberController.text,
      type,
    );
    if (response is ApiSuccess) {
      emit(LogInSuccess());
      userPhoneNumberController.clear();
    } else if (response is ApiFailure) {
      emit(LogInError(message: response.message));
    }
  }

  Future<void> sendVerify(TypeUser type) async {
    try {
      await createVerify.operationOfVerify(type);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> checkCode(TypeUser typeuser) async {
    emit(VerifyCodeLoading());
    try {
      var resposne = await checkVerifyUseCase.checkVerifyCode(
        optController.text,
        typeuser,
      );
      if (resposne is ApiSuccess) {
        emit(VerifyCodeSuccess());
        optController.clear();
      } else if (resposne is ApiFailure) {
        emit(VerifyCodeFail());
      }
    } catch (e) {
      emit(VerifyCodeFail());
    }
  }

  Future<void> register(TypeUser type) async {
    emit(RegisterLoading());
    var response = await registerUsecase.register(
      UserModel(
        userId: null,
        userName: nameController.text,
        userEmail: emailController.text,
        userVerifyCode: null,
        userPhone: phoneController.text,
        userImage: null,
        userToken: null,
        userCreatedAt: null,
      ),
      type,
      image,
    );
    if (response is ApiSuccess) {
      emit(RegisterSuccess());
      nameController.clear();
      emailController.clear();
      phoneController.clear();
    } else if (response is ApiFailure) {
      emit(RegisterError(message: response.message));
    }
  }

  Future<void> completeRegister() async {
    emit(CompleteRegisterLoading());

    var response = await completeRegisterUsecase.completeRegister(image);
    if (response is ApiSuccess) {
      emit(CompleteRegisterSuccess());
    } else if (response is ApiFailure) {
      emit(CompleteRegisterError());
    }
  }
}
