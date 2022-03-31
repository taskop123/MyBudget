import 'package:dio/dio.dart';
import 'package:geocode/geocode.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:my_budget_application/util/constants.dart';

import '../model/directions.dart';

class MapsService {
  static const String _baseUrl = Constants.googleAPIUrl;
  static Location location = Location();
  static GeoCode geoCode = GeoCode();
  static const LatLng originLngLat = LatLng(42.0, 21.5);
  static const CameraPosition initialCameraPosition = CameraPosition(
    target: originLngLat,
    zoom: 7.5,
  );

  static Future<Directions?> getDirections(
      LatLng origin, LatLng destination) async {
    final response = await Dio().get(_baseUrl, queryParameters: {
      Constants.originPlaceholder: '${origin.latitude}, ${origin.longitude}',
      Constants.destinationPlaceholder:
          '${destination.latitude}, ${destination.longitude}',
      Constants.keyString: Constants.googleAPIKey,
    });

    if (response.statusCode == 200 &&
        response.data[Constants.statusString] == Constants.okStatus) {
      return Directions.fromMap(response.data);
    }
    return null;
  }

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
