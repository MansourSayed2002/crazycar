import 'package:crazycar/core/constants/image_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LaodingMapWidget extends StatelessWidget {
  const LaodingMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        AnimationApp.loadingMap,
        height: 100.0.h,
        width: 100.0.w,
      ),
    );
  }
}
