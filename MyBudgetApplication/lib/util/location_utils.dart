import 'package:geocode/geocode.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationUtils {
  static Location location = Location();
  static GeoCode geoCode = GeoCode();
  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(42.0, 21.5),
    zoom: 7.5,
  );

  static Future<Address> getLocationAddress(LatLng latLng) async {
    Address address = await geoCode.reverseGeocoding(
        latitude: latLng.latitude, longitude: latLng.longitude);

    return address;
  }

  static Future<LatLng?> getCurrentLocation() async {
    if (!(await location.serviceEnabled()) ||
        !(await location.requestService())) {
      return null;
    }
    if (await location.hasPermission() == PermissionStatus.denied) {
      if (await location.requestPermission() != PermissionStatus.granted) {
        return null;
      }
    }

    LocationData _locationData = await location.getLocation();
    if (_locationData.latitude == null || _locationData.longitude == null) {
      return null;
    }

    return LatLng(_locationData.latitude!, _locationData.longitude!);
  }
}