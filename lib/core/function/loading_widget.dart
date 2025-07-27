import 'package:crazycar/core/theme/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

loadingWidget(context) {
  return showDialog(
    barrierDismissible: false,
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
            child: CircularProgressIndicator(
              color: ColorApp.backgroundColorDark,
            ),
          ),
        ),
  );
}
