import 'package:flutter/cupertino.dart';
import 'package:my_budget_application/model/expense.dart';

import '../../util/constants.dart';

class ExpenseList extends StatelessWidget {
  final Expense _expense;

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