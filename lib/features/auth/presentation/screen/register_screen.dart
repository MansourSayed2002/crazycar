import 'package:crazycar/core/constants/text_app.dart';
import 'package:crazycar/core/enum/type_user.dart';
import 'package:crazycar/core/extension/navigator_app.dart';
import 'package:crazycar/core/function/cong_widget.dart';
import 'package:crazycar/core/function/error_widget.dart';
import 'package:crazycar/core/function/loading_widget.dart';
import 'package:crazycar/core/function/validation.dart';
import 'package:crazycar/core/get_it/get_it.dart';
import 'package:crazycar/core/shared/custom_elevated_button.dart';
import 'package:crazycar/core/theme/textstyle_app.dart';
import 'package:crazycar/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:crazycar/features/auth/presentation/screen/complete_register_screen.dart';
import 'package:crazycar/features/auth/presentation/widget/upload_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key, required this.type});
  final TypeUser type;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AuthCubit>(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            TextApp.createAccount.tr(),
            style: getSmallStyle(context: context, fontSize: 18.0.sp),
          ),
        ),
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              if (type == TypeUser.driver) {
                context.pop();
                context.push(CompleteRegisterScreen());
              } else {
                context.pop();
                congWidget(context);
              }
            } else if (state is RegisterError) {
              context.pop();
              errorWidget(context: context, isText: true, text: state.message);
            } else if (state is RegisterLoading) {
              loadingWidget(context);
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
            child: ListView(
              children: [
                TextFormField(
                  controller: getIt<AuthCubit>().nameController,
                  decoration: InputDecoration(
                    hintText: TextApp.fullName.tr(),
                    suffixIcon: Icon(Icons.person_2_outlined),
                  ),
                  validator: (value) {
                    return validationField("text", 11, 11, value);
                  },
                ),
                Gap(24.0.h),
                TextFormField(
                  controller: getIt<AuthCubit>().phoneController,
                  decoration: InputDecoration(
                    hintText: TextApp.phoneNumber.tr(),
                    suffixIcon: Icon(Icons.phone_outlined),
                  ),
                  validator: (value) {
                    return validationField("phone", 11, 11, value);
                  },
                ),
                Gap(24.0.h),
                TextFormField(
                  controller: getIt<AuthCubit>().emailController,
                  decoration: InputDecoration(
                    hintText: TextApp.email.tr(),
                    suffixIcon: Icon(Icons.email_outlined),
                  ),
                  validator: (value) {
                    return validationField("email", 11, 11, value);
                  },
                ),
                Gap(28.0.h),
                UploadImageWidget(),
                Gap(28.0.h),
                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    onTap: () {
                      getIt<AuthCubit>().register(type);
                    },
                    title: TextApp.createAccount.tr(),
                  ),
                ),
                Gap(290.0.h),
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(
                    TextApp.footerTextRegister.tr(),
                    style: getSmallStyle(context: context),
                  ),
                ),
                Gap(12.0.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
