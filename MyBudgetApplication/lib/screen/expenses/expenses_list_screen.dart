import 'package:flutter/material.dart';
import 'package:my_budget_application/util/constants.dart';
import 'package:my_budget_application/widget/expense/expense_list.dart';
import 'package:my_budget_application/widget/expense/expense_list_banner.dart';

import '../../model/expense.dart';

/// Displays the expenses that the user has added.
class ListExpenseScreen extends StatelessWidget {
  /// The route name of the list expenses screen.
  static const routeName = Constants.expensesListRoute;

  /// The expenses that the current user has added.
  final List<Expense> _expenses;

  /// Creates new list expense screen with the [_expenses].
  const ListExpenseScreen(this._expenses, {Key? key}) : super(key: key);

  /// Sorts expenses by the date in an descending order, 
  /// in which the most recent expense is at the top.
  void _sortExpenses() {
    _expenses.sort(
        (a, b) => b.dateAndTime?.compareTo(a.dateAndTime as DateTime) as int);
  }

  /// Builds the UI elements for listing all expenses screen.
  ///
  @override
  Widget build(BuildContext context) {
    _sortExpenses();

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _expenses.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
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
