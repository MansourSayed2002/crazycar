import 'package:crazycar/core/class/local_storage.dart';
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
import 'package:crazycar/features/auth/presentation/widget/counter_widget.dart';
import 'package:crazycar/features/auth/presentation/widget/opt_widget.dart';
import 'package:crazycar/features/driver/home/presentation/screen/driver_home_screen.dart';
import 'package:crazycar/features/rider/home/presentation/screen/rider_home_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OptScreen extends StatelessWidget {
  const OptScreen({super.key, required this.typeUser});
  final TypeUser typeUser;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AuthCubit>()..sendVerify(typeUser),
      child: Scaffold(
        body: BlocListener<AuthCubit, AuthState>(
          listenWhen:
              (previous, current) =>
                  current is VerifyCodeLoading ||
                  current is VerifyCodeSuccess ||
                  current is VerifyCodeFail,
          listener: (context, state) {
            if (state is VerifyCodeLoading) {
              loadingWidget(context);
            } else if (state is VerifyCodeSuccess) {
              context.pop();
              if (typeUser == TypeUser.driver) {
                context.pushRepalceMent(DriverHomeScreen());
                LocalStorageApp.saveData("step", 1);
              } else {
                context.pushRepalceMent(RiderHomeScreen());
                LocalStorageApp.saveData("step", 2);
              }
            } else if (state is VerifyCodeFail) {
              context.pop();
              errorWidget(context: context);
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  TextApp.verify.tr(),
                  style: getTitleStyle(context: context),
                ),
                Gap(20.0.h),
                Text(
                  TextApp.bodyVerify.tr(),
                  style: getSmallStyle(context: context),
                ),
                Gap(20.0.h),
                OptWidget(
                  controller: getIt<AuthCubit>().optController,
                  validator: (value) {
                    return validationField("number", 5, 5, value);
                  },
                ),
                Gap(20.0.h),
                CounterWidget(typeUser: typeUser),
                Gap(20.0.h),
                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    title: TextApp.verify.tr(),
                    onTap: () {
                      getIt<AuthCubit>().checkCode(typeUser);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
