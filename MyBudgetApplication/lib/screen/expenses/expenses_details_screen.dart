import 'package:flutter/material.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/widget/expense/details/expense_details_carousel.dart';
import 'package:my_budget_application/widget/expense/details/expense_details_entry.dart';

import '../../model/expense.dart';
import '../../util/constants.dart';

/// Defines the screen used for displaying the expense details.
class ExpenseDetailsScreen extends StatefulWidget {
  /// The route name of the expense details screen.
  static const routeName = Constants.expensesDetailsRoute;

  /// Creates new screen for displaying screen details.
  const ExpenseDetailsScreen({Key? key}) : super(key: key);

  /// Creates the state object for the [ExpenseDetailsScreen].
  @override
  State<ExpenseDetailsScreen> createState() => _ExpenseDetailsScreenState();
}

/// State class used to display the details about the selected expense.
class _ExpenseDetailsScreenState extends State<ExpenseDetailsScreen> {
  /// The expense for which the details will be presented.
  Expense? _selectedExpense;

  /// The currently logged in user, whose expense is to be presented.
  CustomUser? _currentUser;

  /// Builds the UI elements for displaying the specific expense details
  /// including the [appBar] and [body] with a [context],
  /// with the adequate container elements.
  ///
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as List;
    _selectedExpense = arguments[0] as Expense;
    _currentUser = arguments[1] as CustomUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.detailsTitle),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 65),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const ExpenseDetailsCarousel(),
                ExpenseDetailsEntry(_selectedExpense!.price.toString(),
                    _currentUser, const EdgeInsets.fromLTRB(0, 35, 0, 10), 35),
                if (_selectedExpense!.expenseAddress != null)
                  ExpenseDetailsEntry(
                      _selectedExpense!.expenseAddress.toString(),
                      _currentUser,
                      const EdgeInsets.fromLTRB(0, 0, 0, 6),
                      20),
                ExpenseDetailsEntry(_selectedExpense!.dateAndTime.toString(),
                    _currentUser, const EdgeInsets.fromLTRB(0, 0, 0, 0), 19),
                ExpenseDetailsEntry(
                    '${Constants.categoryPlaceholder}: ${_selectedExpense!.expenseCategory.toString()}',
                    _currentUser,
                    const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    24),
                if (_selectedExpense!.expenseNotes != null)
                  ExpenseDetailsEntry(_selectedExpense!.expenseNotes.toString(),
                      _currentUser, const EdgeInsets.fromLTRB(7, 0, 7, 0), 15),
              ]),
        ),
      ),
    );
  }
}
