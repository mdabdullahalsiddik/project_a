import 'package:geolocator/geolocator.dart';

import '../../data/local/storage.dart';


class Permission {
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    // Save the service status locally
    await LocalData().writeData(key: 'isPermissionGranted', value: serviceEnabled.toString());

    if (!serviceEnabled) {
      // Open device location settings if services are disabled
      await Geolocator.openLocationSettings();

      // Wait a bit for user to enable location
      await Future.delayed(Duration(seconds: 3));

      // Re-check after delay
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are still disabled.');
      }
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    // Return current position
    return await Geolocator.getCurrentPosition();
  }
}
