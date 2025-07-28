import 'package:crazycar/core/constants/image_app.dart';
import 'package:crazycar/core/constants/text_app.dart';
import 'package:crazycar/core/enum/type_user.dart';
import 'package:crazycar/core/extension/navigator_app.dart';
import 'package:crazycar/core/function/error_widget.dart';
import 'package:crazycar/core/function/loading_widget.dart';
import 'package:crazycar/core/function/validation.dart';
import 'package:crazycar/core/get_it/get_it.dart';
import 'package:crazycar/core/shared/custom_elevated_button.dart';
import 'package:crazycar/core/theme/textstyle_app.dart';
import 'package:crazycar/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:crazycar/features/auth/presentation/screen/opt_screen.dart';
import 'package:crazycar/features/auth/presentation/screen/register_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.typeUser});
  final TypeUser typeUser;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AuthCubit>(),
      child: Scaffold(
        body: BlocListener<AuthCubit, AuthState>(
          listenWhen:
              (previous, current) =>
                  current is LogInSuccess ||
                  current is LogInLoading ||
                  current is LogInError,
          listener: (context, state) {
            if (state is LogInSuccess) {
              context.pop();
              context.push(OptScreen(typeUser: typeUser));
            } else if (state is LogInLoading) {
              loadingWidget(context);
            } else if (state is LogInError) {
              context.pop();
              errorWidget(context);
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
            child: Column(
              children: [
                Spacer(flex: 1),
                Image.asset(ImageApp.logo, width: 200.0.w),
                Text(TextApp.appName, style: getTitleStyle(context: context)),
                Gap(25.0.h),
                Text(
                  TextApp.login.tr(),
                  style: getTitleStyle(context: context),
                ),
                Gap(8.0.h),
                TextFormField(
                  controller: getIt<AuthCubit>().userPhoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: TextApp.phoneNumber.tr(),
                    suffixIcon: Icon(Icons.phone_outlined),
                  ),
                  validator: (value) {
                    return validationField("phone", 11, 11, value);
                  },
                ),
                Gap(20.h),
                CustomElevatedButton(
                  onTap: () {
                    getIt<AuthCubit>().login(typeUser);
                  },
                  title: TextApp.login.tr(),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    context.push(RegisterScreen(type: typeUser));
                  },
                  child: Text(
                    TextApp.footerTextLogin.tr(),
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
