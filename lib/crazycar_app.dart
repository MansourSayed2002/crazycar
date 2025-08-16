import 'package:crazycar/core/theme/theme_app.dart';

import 'package:crazycar/features/intro/screen/splash_screen.dart';
import 'package:crazycar/offline_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CrazycarApp extends StatelessWidget {
  const CrazycarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return OfflineBuilder(
          connectivityBuilder: (
            BuildContext context,
            List<ConnectivityResult> connectivity,
            Widget child,
          ) {
            final bool connected =
                !connectivity.contains(ConnectivityResult.none);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeApp.light,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              home: connected ? SplashScreen() : OfflineScreen(),
            );
          },
          child: const CircularProgressIndicator(),
        );
      },
    );
  }
}
