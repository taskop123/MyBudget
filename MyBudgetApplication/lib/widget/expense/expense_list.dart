import 'package:flutter/cupertino.dart';
import 'package:my_budget_application/model/expense.dart';
import 'package:my_budget_application/widget/menu/list_popup_menu.dart';

import '../../util/constants.dart';

/// Displays the category of a given expense.
class ExpenseList extends StatelessWidget {
  /// Defines the expense for which we display the category.
  final Expense _expense;

  /// Defines the function which will be called for editing the expense.
  final Function(Expense) _editExpenseFunction;

  /// Defines the function which will be called for deleting the expense.
  final Function(Expense) _deleteExpenseFunction;

  /// Creates the category displaying widget,
  /// with the specified [_expense], [_editExpenseFunction]
  /// and [_deleteExpenseFunction].
  const ExpenseList(this._expense, this._editExpenseFunction, this._deleteExpenseFunction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _expense.expenseCategory == null
                ? Constants.unknownPlaceholder
                : _expense.expenseCategory as String,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          PopupMenu(_expense, _editExpenseFunction, _deleteExpenseFunction),
        ],
      ),
    );
  }
}