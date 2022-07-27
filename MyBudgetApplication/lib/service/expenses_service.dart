import '../model/expense.dart';
import '../util/constants.dart';

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

  static double allTimeSpending(List<Expense> _expenses) {
    return _calculateIncome(_expenses);
  }

  static double yearlySpending(List<Expense> _expenses, int year) {
    List<Expense> filteredExpenses = _expenses.where((element) =>
    (element.dateAndTime != null)
        ? (element.dateAndTime!.year == year)
        : false).toList();

    return _calculateIncome(filteredExpenses);
  }

  static double monthlySpending(List<Expense> _expenses, int year, int month) {
    List<Expense> filteredExpenses = _expenses.where((element) =>
    (element.dateAndTime != null)
        ? (element.dateAndTime!.month == month &&
        element.dateAndTime!.year == year)
        : false).toList();

    return _calculateIncome(filteredExpenses);
  }

  /// Calculates the total amount of today's spending,
  /// from the list of [Expense] objects in dollars.
  ///
  /// Returns 0.0 dollars, if the [List<Expense>] is empty.
  static double dailySpending(List<Expense> _expenses, int year, int month, day) {
    List<Expense> filteredExpenses = _expenses.where((element) =>
    (element.dateAndTime != null)
        ? (element.dateAndTime!.month == month &&
        element.dateAndTime!.year == year &&
        element.dateAndTime!.day == day)
        : false).toList();

    return _calculateIncome(filteredExpenses);
  }

  static double _calculateIncome(List<Expense> expenses) {
    return (expenses.isNotEmpty) ? expenses.map((element) {
      if (element.price != null) {
        String price = element.price!.replaceAll(Constants.lettersRegex, '');
        return double.parse(price);
      }
      return 0.0;
    }).reduce((a, b) => a + b) : 0.0;
  }
}
