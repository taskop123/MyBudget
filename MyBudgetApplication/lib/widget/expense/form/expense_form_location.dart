import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../util/constants.dart';
import '../../form/button_form_field.dart';
import '../../map/map_dialog.dart';

/// Defines the Location picker widget used in the form when adding a new Expense.
class ExpenseFormLocation extends StatelessWidget {
  /// Callback function called each time new location is picked by the user to validate the input.
  final Function(LatLng?) _validateLocationFunction;

  /// Defines the address from the selected location from the user.
  final String? _expenseAddress;

  /// Defines the controller who manages the input from the user.
  final LatLng? _locationController;

  /// Defines the build context of the parent widget.
  final BuildContext _buildContext;

  /// Creates the location picker widget.
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
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: ButtonFormField(
          const EdgeInsets.fromLTRB(0, 0, 0, 45),
          _chooseLocation,
          (_locationController == null || _expenseAddress == null)
              ? Constants.locationSelectorPlaceholder
              : _expenseAddress!,
          null,
          null
        ));
  }
}
