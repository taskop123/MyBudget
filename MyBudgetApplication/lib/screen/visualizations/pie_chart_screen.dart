import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/model/expense.dart';
import 'package:my_budget_application/model/pie_data.dart';
import 'package:my_budget_application/widget/menu/bottom_bar.dart';
import 'package:my_budget_application/widget/visualizations/indicators_widget.dart';
import 'package:my_budget_application/widget/visualizations/pie_chart_sections.dart';

class PieChartScreen extends StatefulWidget {
  static const routeName = '/pie-chart';

  const PieChartScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PieChartScreenState();
}

class _PieChartScreenState extends State<PieChartScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    List<Expense> _expenses = arguments['expenses'];

    var data = PieData(expenses: _expenses).getData();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pie chart'),
      ),
      body: Card(
        child: Column(
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
        ),
      ),
      bottomNavigationBar: BottomBar(2, _expenses),
    );
  }
}
