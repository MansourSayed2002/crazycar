import 'package:crazycar/core/constants/image_app.dart';
import 'package:crazycar/core/theme/color_app.dart';
import 'package:crazycar/core/theme/textstyle_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

errorWidget({required context, bool isText = false, String? text}) {
  return showDialog(
    context: context,

    builder:
        (context) => Center(
          child: Container(
            width: isText ? 300.0.w : 100.0.w,
            height: isText ? 200.0.h : 100.0.h,
            padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0.r),
              color: ColorApp.hintTextColorDark,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(AnimationApp.error, height: 70.0.h, width: 70.0.w),
                isText
                    ? Text(text??"", style: getSmallStyle(context: context))
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
  );
}
