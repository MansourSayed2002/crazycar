import 'package:crazycar/core/get_it/get_it.dart';
import 'package:crazycar/features/rider/home/presentation/cubit/rider_home_cubit.dart';
import 'package:crazycar/features/rider/home/presentation/widget/custom_icon_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SearchLocationWidget extends StatelessWidget {
  const SearchLocationWidget({
    super.key,
    required this.searchFromController,
    required this.searchToController,
  });
  final TextEditingController searchFromController;
  final TextEditingController searchToController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: searchFromController,
          decoration: InputDecoration(
            prefixIcon: CustomIconShadow(
              icon: Icons.circle,
              colorIcon: Colors.blue,
            ),
          ),
        ),
        Gap(10.0.h),
        TextFormField(
          controller: searchToController,
          onFieldSubmitted: (value) {
            getIt<RiderHomeCubit>().searchPlace(searchFromController.text);
          },
          decoration: InputDecoration(
            prefixIcon: CustomIconShadow(
              icon: Icons.circle,
              colorIcon: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
