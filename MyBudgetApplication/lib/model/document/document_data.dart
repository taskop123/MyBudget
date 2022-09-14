import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_budget_application/util/constants.dart';

import '../expense.dart';
import '../user.dart';
import 'data/document_info.dart';
import 'data/document_item.dart';
import 'document_customer.dart';
import 'document_supplier.dart';

/// State class used for keeping data and information about document exports.
class DocumentData {
  /// Document's basic general information.
  final DocumentInfo info;

  /// Document's information about the supplier. (MyBudget)
  final Supplier supplier;

  /// Document's information about the customer. (MyBudget)
  final Customer customer;

  /// Document's items which are displayed in the 'Expenses' table.
  final List<DocumentItem> items;

  /// Creates a document with [info], [supplier],
  /// [customer], and the [items] it is consisted of.
  const DocumentData({
    required this.info,
    required this.supplier,
    required this.customer,
    required this.items,
  });

  /// Factory method supplied with the appropriate logic,
  /// used for creating a new [DocumentData] object,
  /// with the help of a list of [_expenses], the currently logged in user,
  /// [_currentUser], along with the information about the [_firebaseUser],
  /// as well as the [uuid] of the document which is to be created.
  ///
  static DocumentData build(List<Expense> _expenses, CustomUser _currentUser,
      User _firebaseUser, String uuid) {
    final date = DateTime.now();

    return DocumentData(
      supplier: const Supplier(
        name: Constants.applicationTitle,
        address: Constants.contactAddress,
        email: Constants.contactEmail,
        paymentInfo: Constants.contactPaypal,
      ),
      customer: Customer(
        username: (_currentUser.username != null)
            ? _currentUser.username!
            : Constants.blankString,
        email: (_firebaseUser.email != null)
            ? _firebaseUser.email!
            : Constants.blankString,
        monthlyIncome: (_currentUser.monthlyIncome != null)
            ? _currentUser.monthlyIncome!
            : Constants.blankString,
      ),
      info: DocumentInfo(
        number: uuid,
        date: date,
        description: Constants.contactDescription,
      ),
      items: _expenses
          .map((expense) => DocumentItem(
                expenseCategory: expense.expenseCategory!,
                expenseAddress: (expense.expenseAddress != null)
                    ? expense.expenseAddress!
                    : Constants.unknownAddressPlaceholder,
                expenseDateTime: expense.dateAndTime!,
                expensePrice: expense.price!,
                expenseNotes: (expense.expenseNotes != null)
                    ? expense.expenseNotes!
                    : Constants.noExpenseNotesPlaceholder,
              ))
          .toList(growable: true),
    );
  }
}
