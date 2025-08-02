import 'package:crazycar/core/class/local_storage.dart';
import 'package:crazycar/features/driver/home/presentation/screen/driver_home_screen.dart';
import 'package:crazycar/features/intro/screen/onboarding_screen.dart';
import 'package:crazycar/features/rider/home/presentation/screen/rider_home_screen.dart';
import 'package:flutter/widgets.dart';

Widget middleWare() {
  if (LocalStorageApp.getData("step") == 1) {
    return DriverHomeScreen();
  } else if (LocalStorageApp.getData("step") == 2) {
    return RiderHomeScreen();
  } else {
    return OnboardingScreen();
  }
}
