import 'package:crazycar/core/constants/text_app.dart';
import 'package:crazycar/core/shared/custom_elevated_button.dart';
import 'package:crazycar/core/theme/textstyle_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CardSelectRoleWidget extends StatelessWidget {
  const CardSelectRoleWidget({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });
  final String image;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180.0.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0.r),
              image: DecorationImage(image: AssetImage(image)),
            ),
          ),
          Gap(20.0.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: getBodyStyle(context: context)),
              CustomElevatedButton(title: TextApp.select.tr(), onTap: onTap),
            ],
          ),
        ],
      ),
    );
  }
}
