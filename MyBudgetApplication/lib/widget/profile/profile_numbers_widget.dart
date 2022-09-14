import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/model/expense.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/service/expenses_service.dart';
import 'package:my_budget_application/util/constants.dart';
import 'package:my_budget_application/widget/profile/profile_numbers_button.dart';

/// The widget which displays the statistics for the currently logged in user.
class ProfileNumbersWidget extends StatelessWidget {
  /// The currently logged in user.
  final CustomUser _currentUser;

  /// The list of expenses for the currently logged in user.
  final List<Expense> _expenses;

  /// Creates a new instance for the [ProfileNumbersWidget]
  /// for the given [_currentUser] and his [_expenses].
  const ProfileNumbersWidget(this._expenses, this._currentUser, {Key? key})
      : super(key: key);

  /// The divider which is used to separate different statistics numbers.
  Widget buildDivider() => const SizedBox(
        height: 40,
        child: VerticalDivider(),
      );

  /// Calculates the monthly spending of the currently logged in user.
  ///
  double monthlySpending() {
    return ExpenseService.monthlySpending(
        _expenses, DateTime.now().year, DateTime.now().month);
  }

  /// Calculates the daily spending of the currently logged in user.
  ///
  double dailySpending() {
    return ExpenseService.dailySpending(_expenses, DateTime.now().year,
        DateTime.now().month, DateTime.now().day);
  }

  /// Reads the monthly income of the currently logged in user,
  ///
  /// Returns 0.0 dollars ($), if the income was not specified.
  double monthlyIncome() {
    return (_currentUser.monthlyIncome != null)
        ? double.parse(_currentUser.monthlyIncome!
            .replaceAll(Constants.lettersRegex, Constants.blankString))
        : 0.0;
  }

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    final CurrencyTextInputFormatter formatter =
        CurrencyTextInputFormatter(locale: locale.toString());

    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        ProfileNumbersButton(
            Constants.allTimePlaceholder,
            ExpenseService.allTimeSpending(_expenses),
            _currentUser.themeDarkEnabled ? Colors.white : Colors.black,
            24,
            formatter),
        buildDivider(),
      ]),
      const SizedBox(
        height: 7,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        ProfileNumbersButton(
            Constants.monthlyPlaceholder,
            monthlySpending(),
            (monthlyIncome() < monthlySpending()) ? Colors.red : Colors.green,
            18,
            formatter),
        buildDivider(),
        ProfileNumbersButton(
            Constants.dailyPlaceholder,
            dailySpending(),
            ((monthlyIncome() / 30) < dailySpending())
                ? Colors.red
                : Colors.green,
            18,
            formatter),
        buildDivider(),
      ]),
    ]);
  }
}
