import 'package:crazycar/core/constants/image_app.dart';
import 'package:crazycar/core/theme/color_app.dart';
import 'package:crazycar/core/theme/textstyle_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Gap(20.0.h),
          Row(
            children: [
              CircleAvatar(
                radius: 30.0.r,
                backgroundImage: AssetImage(ImageApp.logo),
              ),
              Gap(8.0.w),
              Text(
                "mansour sayed",
                style: getBodyStyle(context: context),
                overflow: TextOverflow.ellipsis,
              ),
              Spacer(),
              Switch(
                value: true,
                onChanged: (val) {},
                activeColor: ColorApp.whiteColor,
                activeTrackColor: ColorApp.primaryColor,
              ),
            ],
          ),
          Container(
            width: 50.0.w,
            height: 6.0.h,
            margin: EdgeInsets.symmetric(vertical: 8.0.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0.r),
              color: ColorApp.fieldColorDark,
            ),
          ),
        ],
      ),
    );
  }
}
