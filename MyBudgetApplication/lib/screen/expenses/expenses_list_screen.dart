import 'package:flutter/material.dart';
import 'package:my_budget_application/model/user.dart';
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

  /// The information about the currently logged in user.
  final CustomUser? _currentUser;

  /// The context in which the screen will to navigate to.
  final BuildContext? _buildContext;

  /// Creates new list expense screen with the [_expenses],
  /// [_buildContext] and the [_currentUser].
  const ListExpenseScreen(this._expenses, this._buildContext, this._currentUser,
      {Key? key})
      : super(key: key);

  /// Creates the state object for the [ListExpenseScreen].
  @override
  State<ListExpenseScreen> createState() => _ListExpenseScreenState();
}

/// State class used to display the details about the list of expenses.
class _ListExpenseScreenState extends State<ListExpenseScreen> {
  /// Sorts expenses by the date in an descending order,
  /// in which the most recent expense is at the top.
  void _sortExpenses() {
    widget._expenses
        .where((element) => element.dateAndTime != null)
        .toList()
        .sort((a, b) =>
            a.dateAndTime?.compareTo(b.dateAndTime as DateTime) as int);
  }

  /// Builds the UI elements for listing all expenses screen,
  /// with a specific [ListView].
  ///
  @override
  Widget build(BuildContext context) {
    _sortExpenses();

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: widget._expenses.length,
      itemBuilder: (context, index) {
        return (index < widget._expenses.length && index >= 0)
            ? GestureDetector(
                onTap: () => _navigateDetailsScreen(widget._expenses[index]),
                child: Card(
                  margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ExpenseListBanner(widget._expenses[index]),
                      ExpenseList(
                          widget._expenses[index], _editItem, _deleteItem),
                    ],
                  ),
                ),
              )
            : Container();
      },
    );
  }

  /// Navigates the user from the [ListExpenseScreen] to the [ExpenseDetailsScreen],
  /// for allowing him to view the details of the specified [expense].
  void _navigateDetailsScreen(Expense expense) {
    if (widget._buildContext != null) {
      Navigator.of(widget._buildContext!).pushNamed(
          ExpenseDetailsScreen.routeName,
          arguments: [expense, widget._currentUser]);
    }
  }

  /// Navigates the user from the [ListExpenseScreen] to the [ExpenseAddScreen],
  /// for allowing him to edit his specified [expense].
  void _editItem(Expense expense) {
    if (widget._buildContext != null) {
      Navigator.of(widget._buildContext!)
          .pushNamed(ExpenseAddScreen.routeName, arguments: expense);
    }
  }

  /// Deletes the specified [expense] from the firebase database.
  void _deleteItem(Expense expense) {
    if (widget._buildContext != null) {
      ExpenseRepository.deleteExpense(expense.id);
      setState(() {
        widget._expenses.remove(expense);
      });
    }
  }
}
