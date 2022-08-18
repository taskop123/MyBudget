import 'package:flutter/material.dart';
import 'package:my_budget_application/model/expense.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/widget/main/main_spent_banner.dart';

import '../../util/constants.dart';
import '../image_banner.dart';

/// Defines the header banner widget for the expense list.
class MainBanner extends StatelessWidget {
  /// The list of [Expense] objects to show the banner for.
  final List<Expense> _expenses;

  /// The currently logged in user.
  final CustomUser? _currentUser;

  /// Creates an instance of [MainBanner]
  /// with [_expenses] and the [_currentUser].
  const MainBanner(this._expenses, this._currentUser, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      color: (_currentUser != null && !_currentUser!.themeDarkEnabled) ? Colors.lightBlue : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
            child: ImageBanner(Constants.logoUrl),
          ),
          MainSpentBanner(_expenses, _currentUser),
        ],
      ),
    );
  }
}
