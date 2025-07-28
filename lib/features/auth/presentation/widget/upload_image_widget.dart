import 'dart:developer';
import 'dart:io';

import 'package:crazycar/core/constants/text_app.dart';
import 'package:crazycar/core/function/image_picker.dart';
import 'package:crazycar/core/get_it/get_it.dart';
import 'package:crazycar/core/theme/color_app.dart';
import 'package:crazycar/core/theme/textstyle_app.dart';
import 'package:crazycar/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class UploadImageWidget extends StatelessWidget {
  const UploadImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () async {
            String? imagePath = await imagePicker(true);
            if (imagePath != null) {
              getIt<AuthCubit>().image.add(File(imagePath));
              log("imagePath: ${getIt<AuthCubit>().image}");
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0.r),

              color: Theme.of(context).inputDecorationTheme.fillColor,
            ),
            child: Icon(Icons.photo_outlined, color: ColorApp.whiteColor),
          ),
        ),
        Gap(10.0.w),
        Text(
          TextApp.uploadImageProfile.tr(),
          style: getSmallStyle(context: context, fontSize: 16.0.sp),
        ),
      ],
    );
  }
}
