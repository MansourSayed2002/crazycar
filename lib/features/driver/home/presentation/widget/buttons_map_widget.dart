import 'package:crazycar/core/theme/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ButtonsMapWidget extends StatelessWidget {
  const ButtonsMapWidget({
    super.key,
    required this.onTapAdd,
    required this.onTapRemove,
    required this.onTapMyLocation,
  });
  final VoidCallback onTapAdd;
  final VoidCallback onTapRemove;
  final VoidCallback onTapMyLocation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
      child: Column(
        children: [
          ButtomMap(
            onTap: onTapAdd,
            iconData: Icons.add,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(13.0.r),
              topRight: Radius.circular(13.0.r),
            ),
          ),
          Gap(5.0.h),
          ButtomMap(
            onTap: onTapRemove,
            iconData: Icons.remove,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(13.0.r),
              bottomLeft: Radius.circular(13.0.r),
            ),
          ),
          Gap(12.0.h),
          ButtomMap(
            onTap: onTapMyLocation,
            iconData: Icons.my_location_rounded,
            borderRadius: BorderRadius.circular(13.0.r),
          ),
        ],
      ),
    );
  }
}

class ButtomMap extends StatelessWidget {
  const ButtomMap({
    super.key,
    required this.iconData,
    this.borderRadius,
    required this.onTap,
  });
  final IconData iconData;
  final BorderRadiusGeometry? borderRadius;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
        decoration: BoxDecoration(
          color: ColorApp.backgroundColorDark,
          borderRadius: borderRadius,
        ),
        child: Icon(iconData, color: ColorApp.whiteColor),
      ),
    );
  }
}
