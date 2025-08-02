import 'package:crazycar/core/constants/image_app.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

congWidget(context) {
  return showDialog(
    context: context,
    builder:
        (context) => Center(
          child: Lottie.asset(
            AnimationApp.cong,
            width: 300.0.w,
            height: 300.0.h,
          ),
        ),
  );
}
