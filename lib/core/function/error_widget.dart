import 'package:crazycar/core/constants/image_app.dart';
import 'package:crazycar/core/theme/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

errorWidget(context) {
  return showDialog(
    context: context,
    builder:
        (context) => Center(
          child: Container(
            width: 100.0.w,
            height: 100.0.h,
            padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0.r),
              color: ColorApp.hintTextColorDark,
            ),
            child: Lottie.asset(
              AnimationApp.error,
              height: 50.0.h,
              width: 50.0.w,
            ),
          ),
        ),
  );
}
