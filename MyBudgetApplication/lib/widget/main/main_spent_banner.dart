import 'package:flutter/material.dart';
import 'package:my_budget_application/model/expense.dart';
import 'package:my_budget_application/service/expenses_service.dart';

import '../../util/constants.dart';

class MainSpentBanner extends StatelessWidget {
  final List<Expense> _expenses;

  const MainSpentBanner(this._expenses, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          "${ExpenseService.todaySpend(_expenses).toStringAsFixed(2)}\$",
          style: const TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
