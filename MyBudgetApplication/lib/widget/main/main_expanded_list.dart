import 'package:flutter/cupertino.dart';
import 'package:my_budget_application/model/expense.dart';

import '../../screen/expenses/expenses_list_screen.dart';
import '../../util/constants.dart';

/// Defines the expanded list widget for the expenses.
class MainExpandedList extends StatelessWidget {
  /// The list of [Expense] objects that are shown in the widget.
  final List<Expense> _expenses;

  final BuildContext _buildContext;

  /// Creates an instance of [MainExpandedList] with [_expenses].
  const MainExpandedList(this._expenses, this._buildContext, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: _expenses.isNotEmpty
          ? ListExpenseScreen(_expenses, _buildContext)
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
