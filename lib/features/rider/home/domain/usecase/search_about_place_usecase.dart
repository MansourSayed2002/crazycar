import 'dart:developer';
import 'package:crazycar/core/class/location_app.dart';
import 'package:geocoding/geocoding.dart';

class SearchAboutPlaceUsecase {
  Future<List<LocationWithName>> searchAboutPlace(String placeName) async {
    try {
      List<Location> response = await LocationApp.searchPlace(placeName);
      List<LocationWithName> result = [];
      for (final element in response) {
        Placemark? placemark = await LocationApp.getPlaceName(
          element.latitude,
          element.longitude,
        );

        result.add(LocationWithName(location: element, placeMark: placemark));
      }
      if (response.isNotEmpty) {
        return result;
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
