import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:my_budget_application/model/expense.dart';

class CustomLineChartData {
  List<Expense> expenses;
  CustomLineChartData({required this.expenses});

   bool checkIfCurrentMonth(var currMonth, List<int?> otherMonths) {
    for (var i = 0; i < otherMonths.length; i++) {
      if (otherMonths[i] == currMonth) {
        return true;
      }
    }
    return false;
  }

  int getIndexOfMonth(var currMonth, List<int?> otherMonths) {
     for(var i = 0; i < otherMonths.length; i++){
       if(otherMonths[i] == currMonth) {
         return i;
        }
     }
     return 0;
  }

  List<FlSpot> getDotData() {
    List<FlSpot> dataSpots = [];
    final groups = groupBy(expenses, (Expense e) {
      return e.dateAndTime?.month;
    });

    List<int> months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    for (var i = 0; i < months.length; i++) {
      var currMonth = months[i];
      if (checkIfCurrentMonth(currMonth, groups.keys.toList())) {
        int tempIndex = getIndexOfMonth(currMonth, groups.keys.toList());
        var name = groups.keys.toList()[tempIndex];
        double totalSpent = 0.0;
        for (var j = 0; j < groups[name]!.length; j++) {
          String temp = groups[name]![j].price as String;
          var amount = double.parse(temp.replaceAll(RegExp('[^0-9.]+'), ''));
          totalSpent += amount;
        }
        totalSpent /= 1000;
        if (totalSpent > 6) {
          totalSpent = 6;
        }
        dataSpots.add(FlSpot(currMonth.toDouble(), double.parse(totalSpent.toStringAsFixed(2))));
        // break;
      } else {
        dataSpots
            .add(FlSpot(currMonth.toDouble(), 0)); // 0 dollars spent that month
      }
    }

    return dataSpots;
  }
}