import 'package:flutter/material.dart';
import 'package:my_budget_application/model/user.dart';

import '../../util/constants.dart';
import '../custom_snack_bar.dart';
import 'monthly_income_dialog.dart';

class MonthlyIncomeButton extends StatelessWidget {
  final CustomUser? _currentUser;

  const MonthlyIncomeButton(this._currentUser, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.lightBlue,
        side: const BorderSide(
          color: Colors.blue,
        ),
        padding: const EdgeInsets.all(15.0),
      ),
      child: Text(
        (_currentUser?.monthlyIncome) != null
            ? _currentUser!.monthlyIncome!
            : Constants.monthlyIncomeTextPlaceholder,
        style: const TextStyle(
            fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      onPressed: () async {
        if(_currentUser!.updateProfileEnabled) {
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