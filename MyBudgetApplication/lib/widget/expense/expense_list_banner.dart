import 'package:flutter/cupertino.dart';
import 'package:my_budget_application/model/expense.dart';

import '../../util/constants.dart';

/// Defines the listing of an expense widget.
/// It displays the date and time and the price of given expense.
class ExpenseListBanner extends StatelessWidget {
  /// Defines the expense that the widget is showing.
  final Expense _expense;

  /// Creates the listing expense widget.
  const ExpenseListBanner(this._expense, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            Constants.formatWithMonthName
                .format(_expense.dateAndTime as DateTime),
            style: const TextStyle(fontSize: 10),
          ),
          Row(
            children: [
              const Text(
                Constants.expensesSpentPlaceholder,
                style: TextStyle(fontSize: 15),
              ),
              Text(
                _expense.price.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
