import 'package:flutter/material.dart';

import '../../../util/constants.dart';

class ExpenseFormCategoryDropdown extends StatelessWidget {
  final Function(String?) _setExpenseCategoryFunction;
  final String? _expenseCategory;

  const ExpenseFormCategoryDropdown(
      this._setExpenseCategoryFunction, this._expenseCategory,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: _expenseCategory,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      onChanged: (val) => _setExpenseCategoryFunction(val),
      items: Constants.categories.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
      hint: const Text(Constants.categoryPlaceholder),
    );
  }
}
