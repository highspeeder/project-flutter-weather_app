import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class MyLocation {
  double? latitude;
  double? longitude;

  Future<void> getMyCurrentLocation() async {
    var permission = await Geolocator.requestPermission();
    debugPrint(permission.name.toString());

    try {
      Position position =
          await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      debugPrint('There was a problem with the Connection');
    }
  }
}
