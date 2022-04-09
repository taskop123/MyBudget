import 'package:firebase_database/firebase_database.dart';
import 'package:my_budget_application/service/firebase/database_service.dart';

import '../../model/expense.dart';

/// Repository used for main CRUD methods for [Expense] objects.
class ExpenseRepository {
  /// The reference to the [FirebaseDatabase] db table of [Expense] objects.
  static final _expensesReference =
      RealtimeDatabaseService.dbReference.ref().child('expenses');

  /// Adds a new [Expense] object to the [FirebaseDatabase].
  ///
  static void addExpense(Expense newExpense) async {
    await _expensesReference.push().set(newExpense.toJson());
  }

  /// Returns a listener stream of [DatabaseEvent],
  /// consisting of [Expense] objects filtered by a [userId].
  ///
  static Stream<DatabaseEvent>? getExpensesByUser(String? userId) {
    if (userId == null || userId.isEmpty) {
      return null;
    }

    return _expensesReference.orderByChild('userId').equalTo(userId).onValue;
  }
}
