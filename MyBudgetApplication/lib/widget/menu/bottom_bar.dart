import 'package:flutter/material.dart';
import 'package:my_budget_application/model/expense.dart';
import 'package:my_budget_application/screen/visualizations/pie_chart_screen.dart';
import 'package:my_budget_application/screen/visualizations/statistics_screen.dart';

import '../../util/constants.dart';

class BottomBar extends StatelessWidget {
  final List<Expense> _expenses;
  final int _currentIndex;

  const BottomBar(this._currentIndex, this._expenses, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.blue,
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
                arguments: {"expenses": _expenses});
          }
          if (index == 2) {
            Navigator.of(context).pushNamed(PieChartScreen.routeName,
                arguments: {"expenses": _expenses});
          }
        }
      },
    );
  }
}
