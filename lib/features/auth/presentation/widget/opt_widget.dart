import 'package:crazycar/core/theme/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OptWidget extends StatelessWidget {
  const OptWidget({super.key, this.controller, this.validator});
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        length: 5,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        controller: controller,
        validator: validator,
        errorPinTheme: PinTheme(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(color: ColorApp.redColor),
            borderRadius: BorderRadius.circular(10.0.r),
          ),
        ),
        defaultPinTheme: PinTheme(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: ColorApp.backgroundColorDark,
            borderRadius: BorderRadius.circular(10.0.r),
            border: Border.all(color: ColorApp.hintTextColorDark),
          ),
        ),
        focusedPinTheme: PinTheme(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: ColorApp.backgroundColorDark,
            borderRadius: BorderRadius.circular(10.0.r),
            border: Border.all(color: ColorApp.hintTextColorDark),
          ),
        ),
      ),
    );
  }
}
