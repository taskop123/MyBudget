import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/model/user.dart';

import '../../service/firebase/users_repository.dart';
import '../../util/constants.dart';
import '../expense/form/expense_form_currency_formatter.dart';

/// Defines the dialog which is displayed to the user
/// so he can enter his monthly income.
class MonthlyIncomeDialog extends StatefulWidget {
  /// The currently logged in user.
  final CustomUser _currentUser;

  /// Creates a new instance of the [MonthlyIncomeDialog] object,
  /// with the [_currentUser] specified.
  const MonthlyIncomeDialog(this._currentUser, {Key? key}) : super(key: key);

  /// Creates the state object for the [MonthlyIncomeDialog].
  @override
  State<MonthlyIncomeDialog> createState() => _MonthlyIncomeDialogState();
}

/// Defines the state of monthly income dialog widget.
class _MonthlyIncomeDialogState extends State<MonthlyIncomeDialog> {
  /// The price which is being entered by the user to the form input.
  String? _price;

  /// Toggles the state of the price, which is being updated in the form input.
  ///
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
                  widget._currentUser.updateProfileEnabled,
                  widget._currentUser.id, null,
                  _price, null, null, null, null, null, null);
              setState(() {});
              Navigator.pop(context);
            },
            child: const Text(Constants.submitButtonPlaceholder)),
      ],
    );
  }
}
