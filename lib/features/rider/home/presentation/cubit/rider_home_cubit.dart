import 'package:bloc/bloc.dart';
import 'package:crazycar/core/class/api_result.dart';
import 'package:crazycar/core/class/location_app.dart';
import 'package:crazycar/features/rider/home/domain/usecase/get_nearby_driver_usecase.dart';
import 'package:crazycar/features/rider/home/domain/usecase/search_about_place_usecase.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'rider_home_state.dart';

class RiderHomeCubit extends Cubit<RiderHomeState> {
  RiderHomeCubit({
    required this.searchAboutPlaceUsecase,
    required this.getNearbyDriverUsecase,
  }) : super(RiderHomeInitial());

  late SearchAboutPlaceUsecase searchAboutPlaceUsecase;
  late GetNearbyDriverUsecase getNearbyDriverUsecase;

  TextEditingController searchFromController = TextEditingController();
  TextEditingController searchToController = TextEditingController();

  Position? position;
  Placemark? placeMarket;

  searchPlace() async {
    emit(SearchLoading());
    List<LocationWithName> locations = await searchAboutPlaceUsecase
        .searchAboutPlace(searchToController.text);
    if (locations.isNotEmpty) {
      emit(SearchSuccess(locations: locations));
    } else {
      emit(SearchError(message: "not found"));
    }
  }

  getLocation() async {
    position = await LocationApp.determinePosition();
    placeMarket = await LocationApp.getPlaceName(
      position!.latitude,
      position!.longitude,
    );
  }

  getnearbydriver() async {
    emit(RiderHomeLoading());
    await getLocation();
    final response = await getNearbyDriverUsecase.getNearbyDrivers(
      position!.latitude,
      position!.longitude,
    );
    if (response is ApiSuccess) {
      emit(
        RiderHomeSuccess(
          data: response.data,
          position: position,
          placemark: placeMarket,
        ),
      );
    } else if (response is ApiFailure) {
      emit(RiderHomeError(message: response.message));
    }
  }
}
