import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../screen/camera/camera_screen.dart';
import '../../screen/expenses/expenses_add_screen.dart';

class AddExpenseMenu extends StatelessWidget {
  final BuildContext _buildContext;

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
