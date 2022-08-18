import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_budget_application/util/constants.dart';

import '../../model/directions.dart';
import '../../service/maps_service.dart';

/// Defines the map field widget used to display the Google Maps.
class MapField extends StatelessWidget {
  /// Defines the callback controlled function for managing the user input.
  final Function(GoogleMapController)? _setControllerFunction;

  /// Defines the callback function for the event of setting a new location.
  final Function(LatLng)? _setLocationFunction;

  /// Defines the origin/starting point of the user.
  final Marker? _origin;

  /// Defines the destination/ending point of the user.
  final Marker? _destination;

  /// Defines the directions that the user should take in order to get from
  /// the starting point all the way to the destination.
  final Directions? _info;

  /// Creates the map field widget with the given [_setControllerFunction],
  /// [_setLocationFunction], the [_origin] the [_destination]
  /// and the specified directions.
  const MapField(this._setControllerFunction, this._setLocationFunction,
      this._origin, this._destination, this._info,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      initialCameraPosition: MapsService.initialCameraPosition,
      onMapCreated: (controller) => (_setControllerFunction != null)
          ? _setControllerFunction!(controller)
          : null,
      markers: {
        if (_origin != null) _origin!,
        if (_destination != null) _destination!,
      },
      polylines: {
        if (_info != null)
          Polyline(
            polylineId: const PolylineId(Constants.overviewPolylinePlaceholder),
            color: Colors.red,
            width: 5,
            points: _info!.polylinePoints
                .map((e) => LatLng(e.latitude, e.longitude))
                .toList(),
          ),
      },
      onTap: (latLng) =>
          (_setLocationFunction != null) ? _setLocationFunction!(latLng) : null,
    );
  }
}
