import 'package:flutter/material.dart';
import 'package:my_budget_application/model/expense.dart';

class PopupMenu extends StatelessWidget {
  final Expense _expense;
  final Function(Expense) _editExpenseFunction;
  final Function(Expense) _deleteExpenseFunction;

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
          value: 'edit',
        ),
        const PopupMenuItem(
          child: Icon(Icons.delete),
          value: 'delete',
        ),
      ],
      onSelected: (value) {
        if (value == 'edit') {
          _editExpenseFunction(_expense);
        } else if (value == 'delete') {
          _deleteExpenseFunction(_expense);
        }
      },
    );
  }
}
