import 'dart:developer';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationApp {
  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      log('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      log(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    return await Geolocator.getCurrentPosition();
  }

  static Future<Location?> searchPlace(String placeName) async {
    try {
      final locations = await locationFromAddress(placeName);
      if (locations.isNotEmpty) {
        return locations.first;
      } else {
        log('No results found for: $placeName');
        return null;
      }
    } catch (e) {
      log('Error in searchPlace: $e');
      return null;
    }
  }
}
