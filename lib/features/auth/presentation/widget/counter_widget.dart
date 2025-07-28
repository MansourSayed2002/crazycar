import 'dart:async';

import 'package:crazycar/core/constants/text_app.dart';
import 'package:crazycar/core/enum/type_user.dart';
import 'package:crazycar/core/extension/navigator_app.dart';
import 'package:crazycar/core/theme/color_app.dart';
import 'package:crazycar/core/theme/textstyle_app.dart';
import 'package:crazycar/features/auth/presentation/screen/opt_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key, required this.typeUser});
  final TypeUser typeUser;
  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  Duration duration = Duration(seconds: 20);
  Timer? timer;
  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) => minusTime());
    super.initState();
  }

  minusTime() {
    final minusSecond = 1;
    if (duration.inSeconds == minusSecond) {
      timer?.cancel();
    }
    setState(() {
      final seconds = duration.inSeconds - minusSecond;
      duration = Duration(seconds: seconds);
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "00:${duration.inSeconds > 10 ? duration.inSeconds : "0${duration.inSeconds}"}",
        ),
        InkWell(
          onTap: () {
            if (duration.inSeconds == 0) {
              context.pushRepalceMent(OptScreen(typeUser: widget.typeUser));
            }
          },
          child: Text(
            TextApp.sendCode.tr(),
            style: getSmallStyle(context: context, color: ColorApp.whiteColor),
          ),
        ),
      ],
    );
  }
}
