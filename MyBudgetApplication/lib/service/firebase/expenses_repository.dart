import 'package:my_budget_application/service/firebase/database_service.dart';

import '../../model/expense.dart';

class ExpenseRepository {
  static final _expensesReference =
      RealtimeDatabaseService.dbReference.ref().child('expenses');

  static void addExpense(Expense newExpense) async {
    await _expensesReference.push().set(newExpense.toJson());
  }

  static Future<Expense?> getExpensesByUser(String? userId) async {
    if (userId == null || userId.isEmpty) {
      return null;
    }

    _expensesReference.orderByChild('userId').equalTo(userId).onValue.listen((event) {
      var result = (event.snapshot.value as Map<Object?, Object?>)
          .values as List<Map<Object?, Object?>>;

      List<Expense> fetchedExpenses = [];
      for (var element in result) {
        var expense = Expense.fromJson(element);
        fetchedExpenses.add(expense);
      }

      int someStream = 10;
    });
    return null;
  }
}
