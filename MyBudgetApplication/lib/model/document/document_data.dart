import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_budget_application/util/constants.dart';

import '../expense.dart';
import '../user.dart';
import 'document_customer.dart';
import 'document_supplier.dart';

class DocumentData {
  final DocumentInfo info;
  final Supplier supplier;
  final Customer customer;
  final List<DocumentItem> items;

  const DocumentData({
    required this.info,
    required this.supplier,
    required this.customer,
    required this.items,
  });

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

class DocumentInfo {
  final String number;
  final String description;
  final DateTime date;

  const DocumentInfo(
      {required this.number, required this.description, required this.date});
}

class DocumentItem {
  final String expenseCategory;
  final String expenseAddress;
  final DateTime expenseDateTime;
  final String expensePrice;
  final String expenseNotes;

  const DocumentItem({
    required this.expenseCategory,
    required this.expenseAddress,
    required this.expenseDateTime,
    required this.expensePrice,
    required this.expenseNotes,
  });
}
