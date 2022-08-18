import 'package:flutter/material.dart';
import 'package:my_budget_application/model/expense.dart';

import '../../util/constants.dart';

/// The popup menu widget of the application.
class PopupMenu extends StatelessWidget {
  /// The expense with which the user has interaction.
  final Expense _expense;

  /// Defines the function which will be called for editing the expense.
  final Function(Expense) _editExpenseFunction;

  /// Defines the function which will be called for deleting the expense.
  final Function(Expense) _deleteExpenseFunction;

  /// Creates a new object instance of the [PopupMenu] widget,
  /// with the specified [_expense], [_editExpenseFunction]
  /// and the [_deleteExpenseFunction].
  const PopupMenu(
      this._expense, this._editExpenseFunction, this._deleteExpenseFunction,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (ctx) => [
        const PopupMenuItem(
          child: Icon(Icons.edit),
          value: Constants.editPlaceholder,
        ),
        const PopupMenuItem(
          child: Icon(Icons.delete),
          value: Constants.deletePlaceholder,
        ),
      ],
      onSelected: (value) {
        if (value == Constants.editPlaceholder) {
          _editExpenseFunction(_expense);
        } else if (value == Constants.deletePlaceholder) {
          _deleteExpenseFunction(_expense);
        }
      },
    );
  }
}
