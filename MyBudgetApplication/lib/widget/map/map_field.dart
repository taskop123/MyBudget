import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_budget_application/util/constants.dart';

import '../../model/directions.dart';
import '../../service/maps_service.dart';

class MapField extends StatelessWidget {
  final Function(GoogleMapController)? _setControllerFunction;
  final Function(LatLng)? _setLocationFunction;
  final Marker? _origin;
  final Marker? _destination;
  final Directions? _info;

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
