import 'package:flutter/material.dart';

import '../../../util/constants.dart';

/// Defines the dropdown list widget used in the form when adding a new Expense.
class ExpenseFormCategoryDropdown extends StatelessWidget {
  /// Callback function to set the selected category from the dropdown list.
  final Function(String?) _setExpenseCategoryFunction;

  /// Defines the initial expense category.
  ///
  /// When null, then the hint is displayed.
  final String? _expenseCategory;

  /// Creates the dropdown list widget with the [_setExpenseCategoryFunction]
  /// and the initial [_expenseCategory].
  const ExpenseFormCategoryDropdown(
      this._setExpenseCategoryFunction, this._expenseCategory,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
        child: DropdownButton<String>(
          isExpanded: true,
          value: _expenseCategory,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 20,
          elevation: 16,
          onChanged: (val) => _setExpenseCategoryFunction(val),
          items: Constants.categories
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
          hint: const Text(Constants.chooseCategoryPlaceholder),
        ));
  }
}
