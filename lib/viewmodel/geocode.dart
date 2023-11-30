import 'package:geocode/geocode.dart';

double? latitude;
double? longitude;

geocode(String cityy) async {
  GeoCode geoCode = GeoCode();

  try {
    Coordinates coordinates = await geoCode.forwardGeocoding(address: cityy);
    latitude = coordinates.latitude;
    longitude = coordinates.longitude;
    print(latitude);
    print(longitude);
  } catch (e) {
    print(e);
  }
}
