import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../util/constants.dart';

class ExpenseFormCurrencyFormatter extends StatelessWidget {
  final Function(String?) _changePriceFunction;
  final CurrencyTextInputFormatter _formatter;

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
