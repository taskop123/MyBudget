import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_budget_application/widget/map/map_field.dart';

/// Defines the map dialog widget used for displaying
/// the map that is used as user input.
class MapDialog extends StatefulWidget {
  /// Defines the callback function used to validate the user input.
  final Function(LatLng?) _validateLocation;

  /// Creates a map dialog widget with the given validation callback function.
  const MapDialog(this._validateLocation, {Key? key}) : super(key: key);

  /// Creates a state object for the [MapDialog].
  @override
  State<MapDialog> createState() => _MapDialogState();
}

/// Defines the state of the map dialog widget.
class _MapDialogState extends State<MapDialog> {
  /// Defines the build context in which this widget was called from.
  late BuildContext _buildContext;

  /// Handles the event of when the user selects a location with the [newLatLng].
  ///
  void _onMapClick(LatLng newLatLng) {
    widget._validateLocation(newLatLng);
    Navigator.pop(_buildContext);
  }

  @override
  Widget build(BuildContext context) {
    _buildContext = context;

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return AlertDialog(
          actions: <Widget>[
            SizedBox(
                height: 500,
                child: MapField(null, _onMapClick, null, null, null)),
          ],
        );
      },
    );
  }
}
