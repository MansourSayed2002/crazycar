import 'package:crazycar/core/constants/image_app.dart';
import 'package:crazycar/core/constants/text_app.dart';
import 'package:crazycar/core/theme/textstyle_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OfflineScreen extends StatelessWidget {
  const OfflineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextApp.appName, style: getBodyStyle(context: context)),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 150.0.h,
            margin: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 20.0.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0.r),
              image: DecorationImage(
                image: AssetImage(ImageApp.offline),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(TextApp.noInternet, style: getBodyStyle(context: context)),
          Gap(10.0.h),
          Text(TextApp.noInternetSub, style: getSmallStyle(context: context)),
        ],
      ),
    );
  }
}
