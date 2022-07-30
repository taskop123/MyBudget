import 'package:flutter/material.dart';
import 'package:my_budget_application/model/expense.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/screen/visualizations/pie_chart_screen.dart';
import 'package:my_budget_application/screen/visualizations/statistics_screen.dart';

import '../../util/constants.dart';

/// Defines the bottom navigation bar widget in our application.
class BottomBar extends StatelessWidget {
  /// Defines the expenses of the user that need to be displayed.
  final List<Expense> _expenses;
  /// Defines the current index of the selected screen in the bottom bar.
  final int _currentIndex;
  final CustomUser _currentUser;

  /// Creates a bottom navigation bar widget
  /// with the given current selected index of the navigation bar 
  /// and the expenses of the current user.
  const BottomBar(this._currentIndex, this._expenses, this._currentUser, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: (!_currentUser.themeDarkEnabled) ? Colors.blue : null,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white60,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 28,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_filled), label: Constants.homeTitle),
        BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart), label: Constants.statisticsTitle),
        BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart), label: Constants.visualisationsTitle),
      ],
      onTap: (index) {
        if (_currentIndex != index) {
          if (index == 0) {
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
          if (index == 1) {
            Navigator.of(context).pushNamed(StatisticsScreen.routeName,
                arguments: [_expenses, _currentUser]);
          }
          if (index == 2) {
            Navigator.of(context).pushNamed(PieChartScreen.routeName,
                arguments: [_expenses, _currentUser]);
          }
        }
      },
    );
  }
}
