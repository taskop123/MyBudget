import '../model/expense.dart';

/// Service consisting of business logic for the [Expense] entity.
class ExpenseService {
  /// Calculates the total amount of today's spending,
  /// from the list of [Expense] objects in dollars.
  ///
  /// Returns 0.0 dollars, if the [List<Expense>] is empty.
  static double todaySpend(List<Expense> _expenses) {
    double total = 0.0;

    for (var element in _expenses) {
      if (element.dateAndTime?.day == DateTime.now().day &&
          element.dateAndTime?.month == DateTime.now().month &&
          element.dateAndTime?.year == DateTime.now().year) {
        String temp = element.price as String;
        var amount = double.parse(temp.replaceAll(RegExp('[^0-9.]+'), ''));
        total += amount;
      }
    }

    return total;
  }
}
