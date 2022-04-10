import 'package:flutter/cupertino.dart';
import 'package:my_budget_application/model/expense.dart';

import '../../screen/expenses/expenses_list_screen.dart';
import '../../util/constants.dart';

class MainExpandedList extends StatelessWidget {
  final List<Expense> _expenses;

  const MainExpandedList(this._expenses, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: _expenses.isNotEmpty
          ? ListExpenseScreen(_expenses)
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(Constants.expensesEmptySpentPlaceholder),
              ],
            ),
    );
  }
}
