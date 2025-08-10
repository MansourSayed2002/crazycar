import 'package:crazycar/core/constants/text_app.dart';
import 'package:crazycar/core/extension/navigator_app.dart';
import 'package:crazycar/core/theme/color_app.dart';
import 'package:crazycar/core/theme/textstyle_app.dart';
import 'package:crazycar/features/rider/home/presentation/screen/search_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:geocoding/geocoding.dart';

class BanerSearchWidget extends StatelessWidget {
  const BanerSearchWidget({super.key, required this.placeMarket});
  final Placemark? placeMarket;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(SearchScreen(placemark: placeMarket));
      },
      child: Container(
        height: 50.0.h,
        alignment: Alignment.centerRight,
        margin: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 50.0.h),
        decoration: BoxDecoration(
          color: ColorApp.whiteColor,
          borderRadius: BorderRadius.circular(15.0.r),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: ColorApp.primaryColor,
              child: Icon(Icons.search_rounded, color: ColorApp.whiteColor),
            ),
            Gap(20.0.w),
            Text(
              TextApp.wheretogo.tr(),
              style: getSmallStyle(context: context),
            ),
          ],
        ),
      ),
    );
  }
}
