import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../util/constants.dart';

/// State class used for keeping user directions for a location.
class Directions {
  /// The longitude and latitude bounds of the directions in degrees.
  final LatLngBounds bounds;

  /// The list of longitude/latitude polyline points which the user path
  /// from one location to another is consisted of.
  final List<PointLatLng> polylinePoints;

  /// The total distance of the user path from
  /// one location to another in kilometers.
  final String totalDistance;

  /// The total duration for the user path from
  /// one location to another in hours and minutes.
  final String totalDuration;

  /// Creates directions for specific user path with
  /// longitude/latitude [bounds],list of [polylinePoints],
  /// string with the [totalDistance]  and a string with the [totalDuration].
  ///
  Directions(
      this.bounds, this.polylinePoints, this.totalDistance, this.totalDuration);

  /// Conversion of a JSON [map] of directions information gathered from an API,
  /// to a usable [Directions] object.
  ///
  /// If the [map] is empty, or,
  /// it is not in the required format, null is returned.
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
