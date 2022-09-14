import 'package:firebase_database/firebase_database.dart';
import 'package:my_budget_application/service/firebase/database_service.dart';

import '../../model/expense.dart';

/// Repository used for main CRUD methods for [Expense] objects.
class ExpenseRepository {
  /// The reference to the [FirebaseDatabase] db table of [Expense] objects.
  static final _expensesReference =
      RealtimeDatabaseService.dbReference.ref().child('expenses');

  /// Returns a listener stream of [DatabaseEvent],
  /// consisting of [Expense] objects filtered by a [userId].
  ///
  /// If the user id is null or empty, null is returned.
  static Stream<DatabaseEvent>? getExpensesByUser(String? userId) {
    if (userId == null || userId.isEmpty) {
      return null;
    }

    return _expensesReference.orderByChild('userId').equalTo(userId).onValue;
  }

  /// Adds a [newExpense] object to the [FirebaseDatabase].
  ///
  static void addExpense(Expense newExpense) async {
    await _expensesReference.push().set(newExpense.toJson());
  }

  /// Updates the details for an [existingExpense]
  /// object to the [FirebaseDatabase].
  ///
  static void editExpense(Expense existingExpense) async {
    _expensesReference
        .orderByChild('id')
        .equalTo(existingExpense.id)
        .onValue
        .listen((event) {
      if (event.snapshot.value is Map<Object?, Object?>) {
        var resultMap = (event.snapshot.value as Map<Object?, Object?>);
        var resultKey = resultMap.keys.first as String;

        _updateExpenseAttribute('price', existingExpense.price, resultKey);
        _updateExpenseAttribute(
            'latitude', existingExpense.latitude, resultKey);
        _updateExpenseAttribute(
            'longitude', existingExpense.longitude, resultKey);
        _updateExpenseAttribute(
            'expenseAddress', existingExpense.expenseAddress, resultKey);
        _updateExpenseAttribute(
            'expenseCategory', existingExpense.expenseCategory, resultKey);
        _updateExpenseAttribute(
            'dateAndTime', existingExpense.dateAndTime.toString(), resultKey);
        _updateExpenseAttribute(
            'expenseNotes', existingExpense.expenseNotes, resultKey);
      }
    });
  }

  /// Updates the details for a specific attribute
  /// of an existing [Expense] object.
  ///
  static void _updateExpenseAttribute(
      String name, Object? value, var expenseId) {
    _expensesReference.child(expenseId).child(name).set(value);
  }

  /// Deletes an existing [Expense] object with the specified [expenseId].
  ///
  static void deleteExpense(String? expenseId) async {
    if (expenseId != null) {
      _expensesReference
          .orderByChild('id')
          .equalTo(expenseId)
          .onValue
          .listen((event) {
        if (event.snapshot.value != null &&
            event.snapshot.value is Map<Object?, Object?>) {
          var resultMap = (event.snapshot.value as Map<Object?, Object?>);
          var resultKey = resultMap.keys.first as String;

          _expensesReference.child(resultKey).remove();
        }
      });
    }
  }
}
