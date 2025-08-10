import 'package:crazycar/core/constants/image_app.dart';
import 'package:crazycar/core/get_it/get_it.dart';
import 'package:crazycar/features/driver/home/presentation/widget/laoding_map_widget.dart';
import 'package:crazycar/features/rider/home/presentation/cubit/rider_home_cubit.dart';
import 'package:crazycar/features/rider/home/presentation/widget/baner_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

class RiderHomeScreen extends StatelessWidget {
  const RiderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<RiderHomeCubit>()..getnearbydriver(),
      child: Scaffold(body: CustomMapWidget()),
    );
  }
}

class CustomMapWidget extends StatefulWidget {
  const CustomMapWidget({super.key});

  @override
  State<CustomMapWidget> createState() => _CustomMapWidgetState();
}

class _CustomMapWidgetState extends State<CustomMapWidget> {
  late MapController mapController;

  @override
  void initState() {
    mapController = MapController();
    super.initState();
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RiderHomeCubit, RiderHomeState>(
      buildWhen:
          (previous, current) =>
              current is RiderHomeSuccess ||
              current is RiderHomeLoading ||
              current is RiderHomeError,
      builder: (context, state) {
        if (state is RiderHomeSuccess) {
          final markers = state.data;
          final point = LatLng(
            state.position!.latitude,
            state.position!.longitude,
          );
          return Stack(
            children: [
              FlutterMap(
                mapController: mapController,
                options: MapOptions(initialZoom: 16.0, initialCenter: point),
                children: [
                  TileLayer(
                    urlTemplate: dotenv.env['URL_TEMPLATE'].toString(),
                    userAgentPackageName:
                        dotenv.env['USER_AGENT_PACKAGE_NAME'].toString(),
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: point,
                        child: Image.asset(
                          ImageApp.pin,
                          width: 60.0.w,
                          height: 60.0.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  MarkerLayer(
                    markers: List.generate(
                      markers.length,
                      (index) => Marker(
                        point: LatLng(
                          markers[index]['latitude'],
                          markers[index]['longitude'],
                        ),
                        child: Image.asset(
                          ImageApp.car,
                          width: 60.0.w,
                          height: 60.0.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              BanerSearchWidget(placeMarket: state.placemark),
            ],
          );
        } else {
          return LaodingMapWidget();
        }
      },
    );
  }
}
