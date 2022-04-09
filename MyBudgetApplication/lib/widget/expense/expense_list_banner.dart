import 'package:flutter/cupertino.dart';
import 'package:my_budget_application/model/expense.dart';

import '../../util/constants.dart';

class ExpenseListBanner extends StatelessWidget {
  final Expense _expense;

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
