import 'package:flutter/material.dart';
import 'package:my_budget_application/widget/menu/bottom_bar.dart';

import '../../model/expense.dart';

class StatisticsScreen extends StatefulWidget{
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
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Coming soon!", style: TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
      bottomNavigationBar: BottomBar(1, _expenses),
    );
  }

}