import 'package:geolocator/geolocator.dart';
import 'package:weather/viewmodel/geocode.dart';

Position? position;


Future<void> getCurrentLocation() async {
  try {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    latitude = position.latitude;
    longitude = position.longitude;
  
  } catch (e) {
    print(e);
  }
}

