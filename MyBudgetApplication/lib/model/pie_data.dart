import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/model/expense.dart';
import 'dart:math' as math;

class PieData {
  List<Expense> expenses;
  PieData({required this.expenses});

  List<Data> getData() {
    List<Data> dataForPieChart = [];
    final groups = groupBy(expenses, (Expense e) {
      return e.expenseCategory;
    });

    for (var i = 0; i < groups.length; i++) {
      var name = groups.keys.toList()[i] as String;
      var lengthOfCategory = groups[name]?.length;
      double percentage = ((lengthOfCategory! / expenses.length) * 100);

      var newData = Data(
          name: name,
          percent: percentage,
          color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
              .withOpacity(1.0));

      dataForPieChart.add(newData);
    }

    return dataForPieChart;
  }
}

class Data {
  final String name;
  final double percent;
  final Color color;
  Data({required this.name, required this.percent, required this.color});
}
