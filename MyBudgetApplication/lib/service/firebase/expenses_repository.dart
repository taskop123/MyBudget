import 'package:firebase_database/firebase_database.dart';
import 'package:my_budget_application/service/firebase/database_service.dart';

import '../../model/expense.dart';

class ExpenseRepository {
  static final _expensesReference =
      RealtimeDatabaseService.dbReference.ref().child('expenses');

  static void addExpense(Expense newExpense) async {
    await _expensesReference.push().set(newExpense.toJson());
  }

  static Stream<DatabaseEvent>? getExpensesByUser(String? userId) {
    if (userId == null || userId.isEmpty) {
      return null;
    }

    return _expensesReference.orderByChild('userId').equalTo(userId).onValue;
  }
}
