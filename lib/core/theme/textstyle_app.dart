import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle getTitleStyle({
  required BuildContext context,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) => TextStyle(
  fontSize: fontSize ?? 24.0.sp,
  fontWeight: fontWeight ?? FontWeight.bold,
  color: color ?? Theme.of(context).colorScheme.onSurface,
);

TextStyle getBodyStyle({
  required BuildContext context,

  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) => TextStyle(
  fontSize: fontSize ?? 22.0.sp,
  fontWeight: fontWeight ?? FontWeight.bold,
  color: color ?? Theme.of(context).colorScheme.onSurface,
);

TextStyle getSmallStyle({
  required BuildContext context,

  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) => TextStyle(
  fontSize: fontSize ?? 14.0.sp,
  fontWeight: fontWeight ?? FontWeight.w500,
  color: color ?? Theme.of(context).colorScheme.onSurface,
);
