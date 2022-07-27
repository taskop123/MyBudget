import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/model/user.dart';

import '../../service/firebase/users_repository.dart';
import '../../util/constants.dart';
import '../expense/form/expense_form_currency_formatter.dart';

class MonthlyIncomeDialog extends StatefulWidget {
  final CustomUser _currentUser;

  const MonthlyIncomeDialog(this._currentUser, {Key? key}) : super(key: key);

  @override
  State<MonthlyIncomeDialog> createState() => _MonthlyIncomeDialogState();
}

class _MonthlyIncomeDialogState extends State<MonthlyIncomeDialog> {
  String? _price;

  void _changePrice(String? newPrice) {
    if (newPrice != null && newPrice.isNotEmpty) {
      setState(() {
        _price = newPrice;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    CurrencyTextInputFormatter formatter = CurrencyTextInputFormatter(
        locale: Localizations.localeOf(context).toString());

    return AlertDialog(
      title: const Text(Constants.monthlyIncomePlaceholder),
      content: ExpenseFormCurrencyFormatter(_changePrice, formatter, _price),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(Constants.cancelButtonPlaceholder)),
        TextButton(
            onPressed: () {
              UserRepository.updateUserProfile(
                  widget._currentUser.id, null, _price, null, null);
              setState(() {});
              Navigator.pop(context);
            },
            child: const Text(Constants.submitButtonPlaceholder)),
      ],
    );
  }
}
