import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:my_budget_application/model/expense.dart';

import '../util/constants.dart';

/// State class used for keeping
/// line chart data information about [Expense] objects.
class CustomLineChartData {
  /// The list of the expenses from which the line chart data is derived.
  List<Expense> expenses;

  /// Creates an line chart data object for specific [expenses].
  ///
  CustomLineChartData({required this.expenses});

  /// Checks whether the [currMonth] is included in the list of [otherMonths],
  /// which consists of all the months in the year.
  ///
  bool checkIfCurrentMonth(var currMonth, List<int?> otherMonths) {
    for (var month in otherMonths) {
      if (month == currMonth) {
        return true;
      }
    }
    return false;
  }

  /// Returns the [int] index/number of [currMonth]
  /// from the list of [otherMonths].
  ///
  /// Returns 0 if there is no match of the index.
  int getIndexOfMonth(var currMonth, List<int?> otherMonths) {
    for (var i = 0; i < otherMonths.length; i++) {
      if (otherMonths[i] == currMonth) {
        return i;
      }
    }
    return 0;
  }

  /// Creates a list of [FlSpot] cartesian space points
  /// used for creation of the statistics line graph.
  ///
  /// Returns an empty [FlSpot] list, if there is not dot data.
  List<FlSpot> getDotData() {
    List<FlSpot> dataSpots = [];
    final groups = groupBy(expenses, (Expense e) {
      return e.dateAndTime?.month;
    });

    List<int> months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    for (var currentMonth in months) {
      if (checkIfCurrentMonth(currentMonth, groups.keys.toList())) {
        int tempIndex = getIndexOfMonth(currentMonth, groups.keys.toList());
        var name = groups.keys.toList()[tempIndex];
        double totalSpent = 0.0;
        for (var j = 0; j < groups[name]!.length; j++) {
          String temp = groups[name]![j].price as String;
          var amount = double.parse(
              temp.replaceAll(Constants.numbersRegex, Constants.blankString));
          totalSpent += amount;
        }
        totalSpent /= 1000;
        if (totalSpent > 6) {
          totalSpent = 6;
        }
        dataSpots.add(FlSpot(currentMonth.toDouble(),
            double.parse(totalSpent.toStringAsFixed(2))));
      } else {
        dataSpots.add(FlSpot(currentMonth.toDouble(), 0));
      }
    }

    return dataSpots;
  }
}
