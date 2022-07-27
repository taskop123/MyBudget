import 'package:flutter/material.dart';
import 'package:my_budget_application/model/expense.dart';
import 'package:my_budget_application/service/expenses_service.dart';

import '../../util/constants.dart';

/// Defines the spent price widget for the expenses in the banner.
class MainSpentBanner extends StatelessWidget {
  /// The list of [Expense] objects to the spent price amount for.
  final List<Expense> _expenses;

  /// Creates an instance for the [MainSpentBanner] with [_expenses].
  const MainSpentBanner(this._expenses, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dateTimeNow = DateTime.now();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          Constants.formatter.format(DateTime.now()),
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        const Text(
          Constants.expensesTodaySpentPlaceholder,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        Text(
          "${ExpenseService.dailySpending(_expenses, dateTimeNow.year, dateTimeNow.month, dateTimeNow.day).toStringAsFixed(2)}\$",
          style: const TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
