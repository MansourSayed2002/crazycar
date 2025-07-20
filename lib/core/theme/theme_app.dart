import 'package:crazycar/core/theme/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeApp {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: ColorApp.backgroundColorLight,
    fontFamily: "SpaceGrotesk",
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorApp.whiteColor,
      onSurface: ColorApp.blackColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      hintStyle: TextStyle(
        fontSize: 16.0.sp,
        color: ColorApp.hintTextColorLight,
        fontWeight: FontWeight.w400,
      ),
      fillColor: ColorApp.fieldColorLight,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: ColorApp.fieldColorDark),
      ),
    ),
  );
  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: ColorApp.backgroundColorDark,
    fontFamily: "SpaceGrotesk",
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorApp.blackColor,
      onSurface: ColorApp.whiteColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      hintStyle: TextStyle(
        fontSize: 16.0.sp,
        color: ColorApp.hintTextColorDark,
        fontWeight: FontWeight.w400,
      ),
      fillColor: ColorApp.fieldColorDark,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: ColorApp.hintTextColorLight),
      ),
    ),
  );
}
