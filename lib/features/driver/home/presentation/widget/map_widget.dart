import 'package:crazycar/core/class/location_app.dart';
import 'package:crazycar/core/extension/message_bar.dart';
import 'package:crazycar/core/theme/color_app.dart';
import 'package:crazycar/features/driver/home/presentation/widget/buttons_map_widget.dart';
import 'package:crazycar/features/driver/home/presentation/widget/laoding_map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  Position? position;
  late MapController mapController;
  late TextEditingController searchController;
  late LatLng point;
  Location? locSearch;
  @override
  void initState() {
    mapController = MapController();
    searchController = TextEditingController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      position = await LocationApp.determinePosition();
      point = LatLng(position!.latitude, position!.longitude);
      setState(() {});
    });
  }

  @override
  void dispose() {
    mapController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:
          position == null
              ? LaodingMapWidget()
              : Stack(
                children: [
                  FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      initialZoom: 13.0,
                      initialCenter: LatLng(
                        position!.latitude,
                        position!.longitude,
                      ),
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
                    bottom: 20.0.h,
                    child: ButtonsMapWidget(
                      onTapAdd: () {
                        changeZoom('in');
                      },
                      onTapRemove: () {
                        changeZoom('out');
                      },
                      onTapMyLocation: () async {
                        await changeLocation();
                      },
                    ),
                  ),
                  Positioned(
                    top: 20.0.h,
                    child: Container(
                      width: 350.0.w,
                      margin: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: TextFormField(
                        controller: searchController,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.search,
                            color: ColorApp.whiteColor,
                          ),
                        ),
                        onEditingComplete: () async {
                          await handleSearch(searchController.text);
                        },
                      ),
                    ),
                  ),
                ],
              ),
    );
  }

  Future<void> changeLocation() async {
    position = await LocationApp.determinePosition();
    mapController.move(LatLng(position!.latitude, position!.longitude), 13.0);
    searchController.clear();
    setState(() {
      point = LatLng(position!.latitude, position!.longitude);
    });
  }

  void changeZoom(String action) {
    final currentZoom = mapController.camera.zoom;
    if (action == 'in' && currentZoom < 23) {
      mapController.move(mapController.camera.center, currentZoom + 1);
    } else if (action == 'out' && currentZoom > 3) {
      mapController.move(mapController.camera.center, currentZoom - 1);
    }
  }

  Future<void> handleSearch(String query) async {
    if (query.trim().isEmpty) return;

    final result = await LocationApp.searchPlace(query);

    if (result != null) {
      final newPoint = LatLng(result.latitude, result.longitude);

      setState(() {
        point = newPoint;
      });

      mapController.move(newPoint, 13.0);
    } else {
      context.messageBar('⚠️ لم يتم العثور على هذا المكان');
    }
  }
}
