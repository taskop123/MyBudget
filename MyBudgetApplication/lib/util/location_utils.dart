import 'package:geocode/geocode.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

/// Location Utils class which helps the user to get his current location
/// and get the address for given location.
class LocationUtils {
  /// Variable for the location services.
  static Location location = Location();
  /// Variable for getting the address for given location.
  static GeoCode geoCode = GeoCode();
  /// Setting the initial Google Maps API location and the corresponding zoom.
  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(42.0, 21.5),
    zoom: 10.5,
  );
  /// Returns the location address for the given [latLng] location on the map.
  static Future<Address> getLocationAddress(LatLng latLng) async {
    Address address = await geoCode.reverseGeocoding(
        latitude: latLng.latitude, longitude: latLng.longitude);

    return address;
  }
  /// Returns the current location of the user
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
