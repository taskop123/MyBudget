import 'package:flutter/material.dart';
import 'package:my_budget_application/widget/menu/bottom_bar.dart';
import 'package:my_budget_application/widget/visualizations/line_chart_widget.dart';

import '../../model/expense.dart';

class StatisticsScreen extends StatefulWidget {
  static const routeName = '/statistics';

  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    List<Expense> _expenses = arguments['expenses'];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Statistics"),
      ),
      body: Card(
        // elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 0, 0, 22),
          child: LineChartWidget(_expenses),
        ),
      ),
      bottomNavigationBar: BottomBar(1, _expenses),
    );
  }
}
