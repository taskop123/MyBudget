import '../model/expense.dart';

/// Service consisting of business logic for the [Expense] entity.
class ExpenseService {
  /// Makes a check whether the id from some of the list of [expenses]
  /// match the id of the given [expense].
  ///
  static bool checkIfExpenseExists(List<Expense> expenses, Expense expense) {
    for (var element in expenses) {
      if (element.id == expense.id) {
        return false;
      }
    }
    return true;
  }

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
