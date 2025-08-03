import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconShadow extends StatelessWidget {
  const CustomIconShadow({super.key, required this.icon, required this.colorIcon});
  final IconData icon;
  final Color colorIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withAlpha(40),
            blurRadius: 8,
            spreadRadius: .4,
          ),
        ],
      ),
      child: Icon(icon, color:colorIcon, size: 15.0.sp),
    );
  }
}
