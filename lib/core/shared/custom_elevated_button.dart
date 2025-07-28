import 'package:crazycar/core/theme/color_app.dart';
import 'package:crazycar/core/theme/textstyle_app.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.onTap,
    this.backGroudColor,
  });
  final String title;
  final VoidCallback onTap;
  final Color? backGroudColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backGroudColor ?? ColorApp.primaryColor,
      ),
      child: Text(title, style: getSmallStyle(context: context)),
    );
  }
}
