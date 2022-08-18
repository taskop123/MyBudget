import '../model/expense.dart';
import '../util/constants.dart';

/// Service consisting of business logic for the [Expense] entity.
class ExpenseService {
  /// Makes a check whether the id from some of the list of [_expenses]
  /// match the id of the given [expense].
  ///
  static bool checkIfExpenseExists(List<Expense> _expenses, Expense _expense) {
    return _expenses.where((item) => item.id == _expense.id).isEmpty;
  }

  /// Calculates the total spent amount for the specified
  /// list of [_expenses] in dollars ($).
  ///
  /// Returns 0.0 dollars ($), if the [List<Expense>] is empty.
  static double allTimeSpending(List<Expense> _expenses) {
    return _calculateIncome(_expenses);
  }

  /// Calculates the total spent amount for the specified [year]
  /// from the list of [_expenses] in dollars ($).
  ///
  /// Returns 0.0 dollars ($), if the [List<Expense>] is empty.
  static double yearlySpending(List<Expense> _expenses, int year) {
    List<Expense> filteredExpenses = _expenses
        .where((element) => (element.dateAndTime != null)
            ? (element.dateAndTime!.year == year)
            : false)
        .toList();

    return _calculateIncome(filteredExpenses);
  }

  /// Calculates the total spent amount for the specified [year] and [month]
  /// from the list of [_expenses] in dollars ($).
  ///
  /// Returns 0.0 dollars ($), if the [List<Expense>] is empty.
  static double monthlySpending(List<Expense> _expenses, int year, int month) {
    List<Expense> filteredExpenses = _expenses
        .where((element) => (element.dateAndTime != null)
            ? (element.dateAndTime!.month == month &&
                element.dateAndTime!.year == year)
            : false)
        .toList();

    return _calculateIncome(filteredExpenses);
  }

  /// Calculates the total spent amount for the specified
  /// [year], [month] and [day] from the list of [_expenses] in dollars ($).
  ///
  /// Returns 0.0 dollars ($), if the [List<Expense>] is empty.
  static double dailySpending(
      List<Expense> _expenses, int year, int month, day) {
    List<Expense> filteredExpenses = _expenses
        .where((element) => (element.dateAndTime != null)
            ? (element.dateAndTime!.month == month &&
                element.dateAndTime!.year == year &&
                element.dateAndTime!.day == day)
            : false)
        .toList();

    return _calculateIncome(filteredExpenses);
  }

  /// Calculates the total income for the [expenses] list.
  ///
  /// Returns 0.0 dollars ($), if the [List<Expense>] is empty.
  static double _calculateIncome(List<Expense> expenses) {
    return (expenses.isNotEmpty)
        ? expenses.map((element) {
            return (element.price != null)
                ? double.parse(element.price!
                    .replaceAll(Constants.lettersRegex, Constants.blankString))
                : 0.0;
          }).reduce((a, b) => a + b)
        : 0.0;
  }
}
