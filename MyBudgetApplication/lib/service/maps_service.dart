import 'package:dio/dio.dart';
import 'package:geocode/geocode.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:my_budget_application/util/constants.dart';

import '../model/directions.dart';

/// Service consisting of business logic used for the
/// maps and location related screens and widgets.
class MapsService {
  /// Base url to which the Google API authentication requests are sent.
  static const String _baseUrl = Constants.googleAPIUrl;

  /// An object consisting of all the information about
  /// the current user position, as well as listeners used for updating it.
  static Location location = Location();

  /// An object used for reading the specific user location details.
  static GeoCode geoCode = GeoCode();

  /// The organization/company's specific location, given a in [LatLng] pair.
  static const LatLng originLngLat = LatLng(42.0, 21.5);

  /// A camera position with  organization/company's specific location.
  static const CameraPosition initialCameraPosition = CameraPosition(
    target: originLngLat,
    zoom: 7.5,
  );

  /// Makes a request to the Google API to read the information
  /// about the directions from the current's [CustomUser] location: [origin]
  /// to the organization/company's specific [destination] location.
  ///
  /// Returns null, if the request is not successful,
  /// or if the mapping to the [Directions] object is not successful.
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

  /// Returns the living address of the [CurrentUser],
  /// given his specific [latLng].
  ///
  static Future<Address> getLocationAddress(LatLng latLng) async {
    Address address = await geoCode.reverseGeocoding(
        latitude: latLng.latitude, longitude: latLng.longitude);

    return address;
  }

  /// Returns the current [CurrentUser] location in a [LatLng] object,
  /// using the functionalities of the [Location] class.
  ///
  /// Returns null, if the service is nota available,
  /// or there are no permissions for that action.
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
