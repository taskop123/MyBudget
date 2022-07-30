import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/model/expense.dart';
import 'package:my_budget_application/model/pie_data.dart';
import 'package:my_budget_application/widget/menu/bottom_bar.dart';
import 'package:my_budget_application/widget/visualizations/indicators_widget.dart';
import 'package:my_budget_application/widget/visualizations/pie_chart_sections.dart';

import '../../model/user.dart';
import '../../util/constants.dart';

/// Defines the pie chart screen for displaying the expenses sorted by category.
class PieChartScreen extends StatefulWidget {
  /// The route name of the pie chart screen.
  static const routeName = Constants.pieChartRoute;

  /// Creates new pie chart screen.
  const PieChartScreen({Key? key}) : super(key: key);

  /// Creates the state object for the [PieChartScreen].
  @override
  State<StatefulWidget> createState() => _PieChartScreenState();
}

/// State class used to display the pie chart screen.
class _PieChartScreenState extends State<PieChartScreen> {

  /// Builds the UI elements for pie chart screen,
  /// including the [appBar] and [body] with a [context],
  /// with the adequate pie chart which depicts the expenses 
  /// grouped by the expense category.
  ///
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as List;
    List<Expense> _expenses = arguments[0] as List<Expense>;
    CustomUser _currentUser = arguments[1] as CustomUser;

    var data = PieData(expenses: _expenses).getData();

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.pieChartTitle),
      ),
      body: Card(
        child: data.isNotEmpty
            ? Column(
                children: <Widget>[
                  Expanded(
                    child: PieChart(
                      PieChartData(
                        borderData: FlBorderData(show: false),
                        sectionsSpace: 0,
                        centerSpaceRadius: 40,
                        sections: getSections(data),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: IndicatorsWidget(data),
                      ),
                    ],
                  )
                ],
              )
            : const Center(
                child: Text(Constants.expensesPieChartPlaceholder),
              ),
      ),
      bottomNavigationBar: BottomBar(2, _expenses, _currentUser),
    );
  }
}
