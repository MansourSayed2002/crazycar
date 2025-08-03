import 'package:crazycar/core/class/location_app.dart';
import 'package:crazycar/core/constants/text_app.dart';
import 'package:crazycar/core/extension/navigator_app.dart';
import 'package:crazycar/core/get_it/get_it.dart';
import 'package:crazycar/core/theme/color_app.dart';
import 'package:crazycar/features/driver/home/presentation/widget/laoding_map_widget.dart';
import 'package:crazycar/features/rider/home/presentation/cubit/rider_home_cubit.dart';
import 'package:crazycar/features/rider/home/presentation/screen/search_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class RiderHomeScreen extends StatelessWidget {
  const RiderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<RiderHomeCubit>(),
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
  late LatLng point;
  Position? position;
  late MapController mapController;
  Placemark? placeMarket;
  @override
  void initState() {
    mapController = MapController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      position = await LocationApp.determinePosition();
      placeMarket = await LocationApp.getPlaceName(
        position!.latitude,
        position!.longitude,
      );
      point = LatLng(position!.latitude, position!.longitude);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return position == null
        ? LaodingMapWidget()
        : Stack(
          children: [
            FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialZoom: 13.0,
                initialCenter: LatLng(position!.latitude, position!.longitude),
              ),
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
                      child: Icon(
                        Icons.location_on,
                        color: ColorApp.fieldColorDark,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 10.0.h,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0.w,
                  vertical: 10.0.h,
                ),
                width: 350.0.w,
                height: 100.0.h,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20.0.w),
                decoration: BoxDecoration(
                  color: ColorApp.fieldColorDark,
                  borderRadius: BorderRadius.circular(15.0.r),
                ),
                child: TextFormField(
                  readOnly: true,
                  onTap: () {
                    context.push(SearchScreen(placemark: placeMarket));
                  },
                  decoration: InputDecoration(
                    fillColor: ColorApp.fieldColorDark,
                    hintText: TextApp.wheretogo.tr(),
                    prefixIcon: Icon(Icons.search, color: ColorApp.whiteColor),
                  ),
                ),
              ),
            ),
          ],
        );
  }
}
