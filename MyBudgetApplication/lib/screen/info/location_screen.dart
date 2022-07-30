import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:my_budget_application/service/maps_service.dart';
import 'package:my_budget_application/util/constants.dart';
import 'package:my_budget_application/util/string_utils.dart';

import '../../model/directions.dart';
import '../../widget/map/map_field.dart';
import '../../widget/map/map_info.dart';

/// The location screen which shows the location of the company,
/// and the directions from the current user location to it.
class LocationScreen extends StatefulWidget {
  /// The route name of the location screen.
  static const routeName = Constants.contactLocationRoute;

  /// Creates an instance of the [LocationScreen].
  const LocationScreen({Key? key}) : super(key: key);

  /// Creates the state object for the [LocationScreen].
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

/// State class used to display the location screen elements and map.
class _LocationScreenState extends State<LocationScreen> {
  /// Keeps the state of the values on the [GoogleMap],
  /// such as markers, polyline points, camera location, as well as directions.
  late GoogleMapController _googleMapController;

  /// The current user's location marker on the map.
  Marker? _origin;

  /// The company's location marker on the map.
  Marker? _destination;

  /// The directions from the current user location to the company's location.
  Directions? _info;

  /// Sets the origin marker on the map,
  /// given the [position] pair of latitude and longitude.
  ///
  void _setOriginMarker(LatLng? position) {
    if (position != null && mounted) {
      setState(() {
        _origin = Marker(
          markerId: const MarkerId(Constants.originPlaceholder),
          infoWindow: InfoWindow(
              title: StringUtils.capitalizeString(Constants.originPlaceholder)),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: position,
        );
      });
    }
  }

  /// Sets the destination marker on the map,
  /// given the [position] pair of latitude and longitude.
  ///
  void _setDestinationMarker(LatLng? position) {
    if (position != null && mounted) {
      setState(() {
        _destination = Marker(
          markerId: const MarkerId(Constants.destinationPlaceholder),
          infoWindow: InfoWindow(
              title: StringUtils.capitalizeString(
                  Constants.destinationPlaceholder)),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: position,
        );
      });
    }
  }

  /// Sets the directions and polyline points on the map,
  /// given the [origin] and [destination] pairs of latitude and longitude.
  ///
  void _setDirections(LatLng? origin, LatLng? destination) async {
    if (mounted) {
      var directions = await MapsService.getDirections(origin!, destination!);
      if (directions == null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(Constants.googleAPIError),
          duration: Duration(seconds: 3),
        ));
      } else {
        setState(() {
          _info = directions;
        });
      }
    }
  }

  /// Sets the markers on the map, given the [origin]
  /// and [destination] pairs of latitude and longitude.
  ///
  void _setMarkers(LatLng? origin, LatLng? destination) {
    if (_origin == null &&
        _destination == null &&
        origin != null &&
        destination != null) {
      _setOriginMarker(origin);
      _setDestinationMarker(destination);

      _setDirections(origin, destination);
    }
  }

  /// Listens fo a change of location, which, if happens,
  /// updates the markers and directions on the map adequately.
  ///
  void _listenForLocation() {
    MapsService.location.onLocationChanged
        .listen((LocationData currentLocation) {
      LatLng newOriginPosition =
          LatLng(currentLocation.latitude!, currentLocation.longitude!);
      if (_origin!.position.latitude != newOriginPosition.latitude ||
          _origin!.position.longitude != newOriginPosition.longitude) {
        _setDirections(newOriginPosition, _destination!.position);
        _setOriginMarker(newOriginPosition);
      }
    });
  }

  /// Sets the the current [_googleMapController],
  /// given the adequate [controller] value.
  ///
  void _setController(GoogleMapController controller) {
    _googleMapController = controller;
  }

  /// Builds the UI elements for the contact screen,
  /// including the [appBar], [floatingActionButton] and a [body]
  /// with a [context] of the adequate location [GoogleMap] content.
  ///
  @override
  Widget build(BuildContext context) {
    final _originLngLat = ModalRoute.of(context)!.settings.arguments as LatLng?;
    _setMarkers(_originLngLat, MapsService.originLngLat);
    _listenForLocation();

    return Scaffold(
      appBar: AppBar(
        title: const Tooltip(
          message: Constants.locationTitle,
          child: Text(Constants.directionsPlaceholder),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          MapField(_setController, null, _origin, _destination, _info),
          if (_info != null)
            MapInfo('${_info!.totalDistance}, ${_info!.totalDuration}'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _googleMapController.animateCamera(
          _info != null
              ? CameraUpdate.newLatLngBounds(_info!.bounds, 100.00)
              : CameraUpdate.newCameraPosition(
                  MapsService.initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }

  /// Disposes the [_googleMapController],
  /// in order for it to avoid memory leakage.
  ///
  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }
}
