import 'package:crazycar/core/constants/image_app.dart';
import 'package:crazycar/core/constants/text_app.dart';
import 'package:crazycar/core/enum/type_user.dart';
import 'package:crazycar/core/extension/navigator_app.dart';
import 'package:crazycar/core/theme/textstyle_app.dart';
import 'package:crazycar/features/auth/presentation/screen/login_screen.dart';
import 'package:crazycar/features/intro/widget/card_select_role_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageApp.logo, width: 50.0.w),
                Text(
                  TextApp.selectRole.tr(),
                  style: getBodyStyle(context: context),
                ),
              ],
            ),
            Gap(35.0.h),
            CardSelectRoleWidget(
              image: ImageApp.rider,
              title: TextApp.iRider.tr(),
              onTap: () {
                context.push(LoginScreen(typeUser: TypeUser.rider));
              },
            ),
            Gap(30.0.h),
            CardSelectRoleWidget(
              image: ImageApp.driver,
              title: TextApp.iDriver.tr(),
              onTap: () {
                context.push(LoginScreen(typeUser: TypeUser.driver));
              },
            ),
          ],
        ),
      ),
    );
  }
}
