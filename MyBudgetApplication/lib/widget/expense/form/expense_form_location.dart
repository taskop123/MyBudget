import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../util/constants.dart';
import '../../form/button_form_field.dart';
import '../../map/map_dialog.dart';

class ExpenseFormLocation extends StatelessWidget {
  final Function(LatLng?) _validateLocationFunction;
  final String? _expenseAddress;
  final LatLng? _locationController;
  final BuildContext _buildContext;

  const ExpenseFormLocation(this._validateLocationFunction,
      this._expenseAddress, this._locationController, this._buildContext,
      {Key? key})
      : super(key: key);

  void _chooseLocation() {
    showDialog(
      context: _buildContext,
      builder: (context) {
        return MapDialog(_validateLocationFunction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ButtonFormField(
      const EdgeInsets.fromLTRB(0, 0, 0, 45),
      _chooseLocation,
      (_locationController == null || _expenseAddress == null)
          ? Constants.locationSelectorPlaceholder
          : _expenseAddress!,
      Theme.of(_buildContext).primaryColorDark,
      Colors.white,
    );
  }
}
