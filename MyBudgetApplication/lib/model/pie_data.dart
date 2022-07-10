import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/model/expense.dart';

/// State class used for keeping
/// pie chart data information about [Expense] objects.
class PieData {
  /// The list of the expenses from which the pie chart data is derived.
  List<Expense> expenses;

  /// Creates a pie chart data object for specific [expenses].
  ///
  PieData({required this.expenses});

  /// Creates a list of [Data] pie chart group
  /// used for creation of the statistics pie chart graph.
  ///
  /// Returns an empty [Data] list, if there is not dot data.
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

/// State class used for keeping specific pie chart data.
class Data {
  /// Pie chart data group's name.
  final String name;

  /// Pie chart data group's percentage.
  final double percent;

  /// Pie chart data group's color.
  final Color color;

  /// Creates a pie chart data group for a [PieData] object
  /// consisting of [name], [percent] and [color].
  ///
  Data({required this.name, required this.percent, required this.color});
}
