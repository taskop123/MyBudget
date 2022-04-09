import 'package:flutter/material.dart';
import 'package:my_budget_application/util/constants.dart';
import 'package:my_budget_application/widget/expense/expense_list.dart';
import 'package:my_budget_application/widget/expense/expense_list_banner.dart';

import '../../model/expense.dart';

class ListExpenseScreen extends StatelessWidget {
  static const routeName = Constants.expensesListRoute;
  final List<Expense> _expenses;

  const ListExpenseScreen(this._expenses, {Key? key}) : super(key: key);

  void _sortExpenses() {
    _expenses.sort(
        (a, b) => b.dateAndTime?.compareTo(a.dateAndTime as DateTime) as int);
  }

  @override
  Widget build(BuildContext context) {
    _sortExpenses();

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _expenses.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ExpenseListBanner(_expenses[index]),
              ExpenseList(_expenses[index]),
            ],
          ),
        );
      },
    );
  }
}
