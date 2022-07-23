import 'package:flutter/material.dart';
import 'package:my_budget_application/util/constants.dart';
import 'package:my_budget_application/widget/expense/expense_list.dart';
import 'package:my_budget_application/widget/expense/expense_list_banner.dart';

import '../../model/expense.dart';
import '../../service/firebase/expenses_repository.dart';
import 'expenses_add_screen.dart';
import 'expenses_details_screen.dart';

/// Displays the expenses that the user has added.
class ListExpenseScreen extends StatefulWidget {
  /// The route name of the list expenses screen.
  static const routeName = Constants.expensesListRoute;

  /// The expenses that the current user has added.
  final List<Expense> _expenses;

  final BuildContext? _buildContext;

  /// Creates new list expense screen with the [_expenses].
  const ListExpenseScreen(this._expenses, this._buildContext, {Key? key})
      : super(key: key);

  @override
  State<ListExpenseScreen> createState() => _ListExpenseScreenState();
}

class _ListExpenseScreenState extends State<ListExpenseScreen> {
  /// Sorts expenses by the date in an descending order,
  /// in which the most recent expense is at the top.
  void _sortExpenses() {
    widget._expenses.sort(
        (a, b) => b.dateAndTime?.compareTo(a.dateAndTime as DateTime) as int);
  }

  /// Builds the UI elements for listing all expenses screen.
  ///
  @override
  Widget build(BuildContext context) {
    _sortExpenses();

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: widget._expenses.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _navigateDetailsScreen(widget._expenses[index]),
          child: Card(
            margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ExpenseListBanner(widget._expenses[index]),
                ExpenseList(widget._expenses[index], _editItem, _deleteItem),
              ],
            ),
          ),
        );
      },
    );
  }

  void _navigateDetailsScreen(Expense expense) {
    if(widget._buildContext != null) {
      Navigator.of(widget._buildContext!)
          .pushNamed(ExpenseDetailsScreen.routeName, arguments: expense);
    }

  }

  void _editItem(Expense expense) {
    if(widget._buildContext != null) {
      Navigator.of(widget._buildContext!)
          .pushNamed(ExpenseAddScreen.routeName, arguments: expense);
    }
  }

  void _deleteItem(Expense expense) {
    if(widget._buildContext != null) {
      ExpenseRepository.deleteExpense(expense.id);
      widget._expenses.remove(expense);
    }
  }
}
