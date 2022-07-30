import 'package:flutter/material.dart';
import 'package:my_budget_application/model/expense.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/service/expenses_service.dart';

import '../../util/constants.dart';

/// Defines the spent price widget for the expenses in the banner.
class MainSpentBanner extends StatelessWidget {
  /// The list of [Expense] objects to the spent price amount for.
  final List<Expense> _expenses;

  final CustomUser? _currentUser;

  /// Creates an instance for the [MainSpentBanner] with [_expenses].
  const MainSpentBanner(this._expenses, this._currentUser, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dateTimeNow = DateTime.now();
    double dailySpending = ExpenseService.dailySpending(
        _expenses, dateTimeNow.year, dateTimeNow.month, dateTimeNow.day);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          Constants.formatter.format(DateTime.now()),
          style: TextStyle(fontSize: 20, color: (_currentUser != null && !_currentUser!.themeDarkEnabled) ? Colors.white : null),
        ),
        Text(
          Constants.expensesTodaySpentPlaceholder,
          style: TextStyle(fontSize: 20, color: (_currentUser != null && !_currentUser!.themeDarkEnabled) ? Colors.white : null),
        ),
        Text(
          "${dailySpending.toString()}\$",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: (_currentUser != null && !_currentUser!.themeDarkEnabled) ? Colors.white : null),
        )
      ],
    );
  }
}
