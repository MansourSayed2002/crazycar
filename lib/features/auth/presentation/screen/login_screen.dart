import 'package:crazycar/core/constants/image_app.dart';
import 'package:crazycar/core/constants/text_app.dart';
import 'package:crazycar/core/theme/textstyle_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(ImageApp.logo, width: 200.0.w),
          Text(TextApp.appName, style: getTitleStyle(context: context)),
        ],
      ),
    );
  }
}
