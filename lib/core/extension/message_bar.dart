import 'package:crazycar/core/theme/color_app.dart';
import 'package:crazycar/core/theme/textstyle_app.dart';
import 'package:flutter/material.dart';

extension MessageBar on BuildContext {
  messageBar(String message, [Color? color]) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: color ?? ColorApp.redColor,
        content: Text(
          message,
          style: getSmallStyle(context: this, color: ColorApp.whiteColor),
        ),
      ),
    );
  }
}
