import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../util/constants.dart';

class Directions {
  final LatLngBounds bounds;
  final List<PointLatLng> polylinePoints;
  final String totalDistance;
  final String totalDuration;

  Directions(
      this.bounds, this.polylinePoints, this.totalDistance, this.totalDuration);

  static Directions? fromMap(Map<String, dynamic> map) {
    if ((map[Constants.routesPlaceholder] as List).isEmpty) return null;

    final data = Map<String, dynamic>.from(map[Constants.routesPlaceholder][0]);

    final northeast =
        data[Constants.boundsPlaceholder][Constants.northeastPlaceholder];
    final southwest =
        data[Constants.boundsPlaceholder][Constants.southwestPlaceholder];
    final bounds = LatLngBounds(
      southwest: LatLng(southwest[Constants.latitudePlaceholder],
          southwest[Constants.longitudePlaceholder]),
      northeast: LatLng(northeast[Constants.latitudePlaceholder],
          northeast[Constants.longitudePlaceholder]),
    );

    String distance = Constants.blankString;
    String duration = Constants.blankString;
    if ((data[Constants.legsPlaceholder] as List).isNotEmpty) {
      final leg = data[Constants.legsPlaceholder][0];
      distance = leg[Constants.distancePlaceholder][Constants.textPlaceholder];
      duration = leg[Constants.durationPlaceholder][Constants.textPlaceholder];
    }

    return Directions(
      bounds,
      PolylinePoints().decodePolyline(
          data[Constants.overviewPolylinePlaceholder]
              [Constants.pointsPlaceholder]),
      distance,
      duration,
    );
  }
}
