import 'package:crazycar/features/driver/home/presentation/widget/header_widget.dart';
import 'package:crazycar/features/driver/home/presentation/widget/map_widget.dart';
import 'package:flutter/material.dart';

class DriverHomeScreen extends StatelessWidget {
  const DriverHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [MapWidget(), HeaderWidget()]));
  }
}
