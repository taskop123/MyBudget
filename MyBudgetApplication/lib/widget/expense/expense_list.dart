import 'package:flutter/cupertino.dart';
import 'package:my_budget_application/model/expense.dart';

import '../../util/constants.dart';

/// Displays the category of a given expense.
class ExpenseList extends StatelessWidget {
  /// Defines the expense for which we display the category.
  final Expense _expense;

  /// Creates the category displaying widget.
  const ExpenseList(this._expense, {Key? key}) : super(key: key);

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
        ],
      ),
    );
  }
}