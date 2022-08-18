import 'package:flutter/material.dart';
import 'package:my_budget_application/model/user.dart';

import '../../util/constants.dart';
import '../custom_snack_bar.dart';
import 'monthly_income_dialog.dart';

/// Defines the button which in which
/// is displayed the monthly income for the user.
class MonthlyIncomeButton extends StatelessWidget {
  /// The currently logged in user.
  final CustomUser? _currentUser;

  /// Creates an instance of the [MonthlyIncomeButton] object
  /// with the given [_currentUser].
  const MonthlyIncomeButton(this._currentUser, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(15.0),
      ),
      child: Text(
        (_currentUser?.monthlyIncome) != null
            ? _currentUser!.monthlyIncome!
            : Constants.monthlyIncomeTextPlaceholder,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      onPressed: () async {
        if (_currentUser!.updateProfileEnabled) {
          await showDialog(
            context: context,
            builder: (context) => MonthlyIncomeDialog(_currentUser!),
          );
          var count = 0;
          Navigator.popUntil(context, (route) {
            return count++ == 2;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const CustomSnackBar(Constants.snackBarPlaceholder).build());
        }
      },
    );
  }
}
