import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:my_budget_application/service/maps_service.dart';
import 'package:my_budget_application/util/constants.dart';
import 'package:my_budget_application/util/string_utils.dart';

import '../../model/directions.dart';
import '../../widget/map/map_field.dart';
import '../../widget/map/map_info.dart';
import '../../widget/menu/popup_menu.dart';

class LocationScreen extends StatefulWidget {
  static const routeName = Constants.contactLocationRoute;

  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List<String> locationNotifications = <String>[];

  late GoogleMapController _googleMapController;
  Marker? _origin;
  Marker? _destination;
  Directions? _info;

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

  void _setDistance(LatLng? origin, LatLng? destination) async {
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

  void _setMarkers(LatLng? origin, LatLng? destination) {
    if (_origin == null &&
        _destination == null &&
        origin != null &&
        destination != null) {
      _setOriginMarker(origin);
      _setDestinationMarker(destination);

      _setDistance(origin, destination);
    }
  }

  void _listenForLocation() {
    MapsService.location.onLocationChanged
        .listen((LocationData currentLocation) {
      LatLng newOriginPosition =
          LatLng(currentLocation.latitude!, currentLocation.longitude!);
      if (_origin!.position.latitude != newOriginPosition.latitude ||
          _origin!.position.longitude != newOriginPosition.longitude) {
        _setDistance(newOriginPosition, _destination!.position);
        _setOriginMarker(newOriginPosition);
      }
    });
  }

  void _setController(GoogleMapController controller) {
    _googleMapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final _originLngLat = ModalRoute.of(context)!.settings.arguments as LatLng?;
    _setMarkers(_originLngLat, MapsService.originLngLat);
    _listenForLocation();

    return Scaffold(
      appBar: AppBar(
        title: const Tooltip(
          message: Constants.locationTitle,
          child: Text(Constants.locationPlaceholder),
        ),
        actions: const [
          PopupMenu(),
        ],
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
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
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

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }
}
