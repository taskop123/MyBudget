import 'package:flutter/material.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/util/constants.dart';
import 'package:my_budget_application/widget/menu/bottom_bar.dart';
import 'package:my_budget_application/widget/visualizations/line_chart_widget.dart';

import '../../model/expense.dart';

/// Defines the statistics screen which displays the line chart 
/// of user expenses through the months in the current year.
class StatisticsScreen extends StatefulWidget {
  /// The route name of the statistics screen.
  static const routeName = Constants.statisticsRoute;

  /// Creates new line chart statistics screen.
  const StatisticsScreen({Key? key}) : super(key: key);

  /// Creates the state object for the [StatisticsScreen].
  @override
  State<StatefulWidget> createState() => _StatisticsScreenState();
}

/// State class used to display the line chart statistics screen.
class _StatisticsScreenState extends State<StatisticsScreen> {

  /// Builds the UI elements for line chart statistics screen,
  /// including the [appBar] and [body] with a [context],
  /// with the adequate line chart which depicts the total amount 
  /// of expenses throughout each month of the current year. 
  ///
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as List;
    List<Expense> _expenses = arguments[0] as List<Expense>;
    CustomUser _currentUser = arguments[1] as CustomUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.statisticsTitle),
      ),
      body: Card(
        // elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 0, 0, 22),
          child: LineChartWidget(_expenses),
        ),
      ),
      bottomNavigationBar: BottomBar(1, _expenses, _currentUser),
    );
  }
}
