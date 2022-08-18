import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../screen/camera/camera_screen.dart';
import '../../screen/expenses/expenses_add_screen.dart';

/// Defines the widget menu for adding a new expense.
class AddExpenseMenu extends StatelessWidget {
  /// The build context of the parent of the menu.
  final BuildContext _buildContext;

  /// Creates a new instance of the [AddExpenseMenu],
  /// with the specified [_buildContext].
  const AddExpenseMenu(this._buildContext, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.add_event,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.edit),
          onTap: () =>
              Navigator.of(_buildContext).pushNamed(ExpenseAddScreen.routeName),
        ),
        SpeedDialChild(
          child: const Icon(Icons.camera_alt),
          onTap: () =>
              Navigator.of(_buildContext).pushNamed(CameraScreen.routeName),
        ),
      ],
    );
  }
}
