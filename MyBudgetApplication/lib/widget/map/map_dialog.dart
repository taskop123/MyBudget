import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_budget_application/widget/map/map_field.dart';

class MapDialog extends StatefulWidget {
  final Function(LatLng?) _validateLocation;

  const MapDialog(this._validateLocation, {Key? key}) : super(key: key);

  @override
  State<MapDialog> createState() => _MapDialogState();
}

class _MapDialogState extends State<MapDialog> {
  late BuildContext _buildContext;

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