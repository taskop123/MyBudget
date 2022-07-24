import 'package:flutter/material.dart';
import 'package:my_budget_application/model/user.dart';

import '../../util/constants.dart';
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
        await showDialog(
          context: context,
          builder: (context) => MonthlyIncomeDialog(_currentUser!),
        );
        setState() {};
      },
    );
  }
}