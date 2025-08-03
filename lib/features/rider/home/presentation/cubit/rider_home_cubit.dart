import 'package:bloc/bloc.dart';
import 'package:crazycar/core/class/location_app.dart';
import 'package:crazycar/features/rider/home/domain/usecase/search_about_place_usecase.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'rider_home_state.dart';

class RiderHomeCubit extends Cubit<RiderHomeState> {
  RiderHomeCubit({required this.searchAboutPlaceUsecase})
    : super(RiderHomeInitial());

  late SearchAboutPlaceUsecase searchAboutPlaceUsecase;

  TextEditingController searchFromController = TextEditingController();
  TextEditingController searchToController = TextEditingController();

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
}
