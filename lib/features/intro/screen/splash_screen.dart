import 'package:crazycar/core/constants/image_app.dart';
import 'package:crazycar/core/constants/text_app.dart';
import 'package:crazycar/core/extension/navigator_app.dart';
import 'package:crazycar/core/function/middleware.dart';
import 'package:crazycar/core/theme/color_app.dart';
import 'package:crazycar/core/theme/textstyle_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 4), () {
        context.pushRepalceMent(middleWare());
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backgroundColorDark,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(ImageApp.logo, width: 200.0.w),
            Gap(50.0.h),
            Text(
              TextApp.appName,
              style: getTitleStyle(
                context: context,
                color: ColorApp.whiteColor,
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                TextApp.loading,
                style: getSmallStyle(context: context),
              ),
            ),
            Gap(10.0.h),
            LinearProgressIndicator(color: ColorApp.primaryColor),
            Gap(10.0.h),
          ],
        ),
      ),
    );
  }
}
