import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../util/constants.dart';


/// Defines the price input field widget used in the form when adding a new Expense.
class ExpenseFormCurrencyFormatter extends StatelessWidget {
  /// Callback function when input is changed.
  final Function(String?) _changePriceFunction;
  /// Defines the format used for formatting the user input.
  final CurrencyTextInputFormatter _formatter;

  /// Creates the price input field widget with the callback function
  /// when input is changed and the format of the user input.
  const ExpenseFormCurrencyFormatter(this._changePriceFunction, this._formatter,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: '${Constants.pricePlaceholder} \$',
      ),
      onChanged: (val) => _changePriceFunction(val),
      inputFormatters: <TextInputFormatter>[
        _formatter,
      ],
      keyboardType: TextInputType.number,
    );
  }
}
