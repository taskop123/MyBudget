import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/model/expense.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/service/expenses_service.dart';
import 'package:my_budget_application/util/constants.dart';

class ProfileNumbersWidget extends StatelessWidget {
  final CustomUser _currentUser;
  final List<Expense> _expenses;

  const ProfileNumbersWidget(this._expenses, this._currentUser, {Key? key})
      : super(key: key);

  Widget buildButton(
          {required String text,
          required Object value,
          required Color color,
          required double fontSize,
          required CurrencyTextInputFormatter formatter}) =>
      MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                formatter.format(value.toString()),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize,
                  color: color,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                text,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      );

  Widget buildDivider() => const SizedBox(
        height: 40,
        child: VerticalDivider(),
      );

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    final CurrencyTextInputFormatter formatter =
        CurrencyTextInputFormatter(locale: locale.toString());

    DateTime dateTimeNow = DateTime.now();
    var monthlySpending = ExpenseService.monthlySpending(
        _expenses, dateTimeNow.year, dateTimeNow.month);
    var dailySpending = ExpenseService.dailySpending(
        _expenses, dateTimeNow.year, dateTimeNow.month, dateTimeNow.day);
    var monthlyIncome = (_currentUser.monthlyIncome != null)
        ? double.parse(_currentUser.monthlyIncome!
            .replaceAll(Constants.lettersRegex, Constants.blankString))
        : 0.0;
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        buildButton(
            text: Constants.allTimePlaceholder,
            value: ExpenseService.allTimeSpending(_expenses),
            color: _currentUser.themeDarkEnabled ? Colors.white : Colors.black,
            fontSize: 24,
            formatter: formatter),
        buildDivider(),
      ]),
      const SizedBox(
        height: 7,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        buildButton(
            text: Constants.monthlyPlaceholder,
            value: monthlySpending,
            color:
                (monthlyIncome < monthlySpending) ? Colors.red : Colors.green,
            fontSize: 18,
            formatter: formatter),
        buildDivider(),
        buildButton(
            text: Constants.dailyPlaceholder,
            value: dailySpending,
            color: ((monthlyIncome / 30) < dailySpending)
                ? Colors.red
                : Colors.green,
            fontSize: 18,
            formatter: formatter),
        buildDivider(),
      ]),
    ]);
  }
}
