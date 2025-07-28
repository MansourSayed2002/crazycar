import 'dart:io';

import 'package:crazycar/core/constants/text_app.dart';
import 'package:crazycar/core/function/image_picker.dart';
import 'package:crazycar/core/get_it/get_it.dart';
import 'package:crazycar/core/shared/custom_elevated_button.dart';
import 'package:crazycar/core/theme/textstyle_app.dart';
import 'package:crazycar/features/auth/data/model/static/data_page.dart';
import 'package:crazycar/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CompleteRegisterScreen extends StatefulWidget {
  const CompleteRegisterScreen({super.key});
  @override
  State<CompleteRegisterScreen> createState() => _CompleteRegisterScreenState();
}

class _CompleteRegisterScreenState extends State<CompleteRegisterScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    getIt<AuthCubit>().image.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          TextApp.completeRegister.tr(),
          style: getSmallStyle(context: context, fontSize: 16.0.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: PageView.builder(
            itemCount: dataPage.length,
            controller: pageController,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(dataPage[index].image, width: 200.0.w),
                  Gap(20.0.h),
                  Text(
                    dataPage[index].description,
                    style: getSmallStyle(context: context, fontSize: 16.0.sp),
                    textAlign: TextAlign.center,
                  ),
                  Gap(20.0.h),
                  CustomElevatedButton(
                    title: TextApp.openCamera.tr(),
                    onTap: () async{
                      String? imagePath =await imagePicker(false);
                      getIt<AuthCubit>().image.add(File(imagePath ?? ''));
                      if (imagePath != null) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      }
                    },
                  ),
                  Gap(30.0.h),
                  index == 2
                      ? CustomElevatedButton(
                        title: TextApp.uploadImage.tr(),
                        onTap: () {
                          getIt<AuthCubit>().completeRegister();
                        },
                      )
                      : SizedBox.shrink(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
