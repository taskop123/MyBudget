import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/util/constants.dart';

class ExpenseService {
  final List<Expense> _expenses = [
    Expense(Constants.getRandomString(10), "USD10.00", 52.33, 45.55, "Skopje",
        "Clothing", DateTime.now(), "Nothing"),
    Expense(Constants.getRandomString(10), "USD23.00", 52.33, 45.55, "Skopje",
        "Shopping", DateTime.now(), "Nothing"),
    Expense(Constants.getRandomString(10), "USD41.00", 52.33, 45.55, "Skopje",
        "Food", DateTime.now(), "Nothing"),
    Expense(Constants.getRandomString(10), "USD65.00", 52.33, 45.55, "Skopje",
        "Baby", DateTime.now(), "Nothing"),
    Expense(Constants.getRandomString(10), "USD1.00", 52.33, 45.55, "Skopje",
        "Cigarette", DateTime.now(), "Nothing"),
    Expense(Constants.getRandomString(10), "USD5.00", 52.33, 45.55, "Skopje",
        "Shopping", DateTime.now(), "Nothing"),
    Expense(Constants.getRandomString(10), "USD12.00", 52.33, 45.55, "Skopje",
        "Pet", DateTime.now(), "Nothing"),
    Expense(Constants.getRandomString(10), "USD6.00", 52.33, 45.55, "Skopje",
        "Food", DateTime.now(), "Nothing"),
    Expense(Constants.getRandomString(10), "USD345.00", 52.33, 45.55, "Skopje",
        "Clothing", DateTime.now(), "Nothing"),
    Expense(Constants.getRandomString(10), "USD9.00", 52.33, 45.55, "Skopje",
        "Baby", DateTime.now(), "Nothing"),
    Expense(Constants.getRandomString(10), "USD88.00", 52.33, 45.55, "Skopje",
        "Pet", DateTime.now(), "Nothing"),
    Expense(Constants.getRandomString(10), "USD8.00", 52.33, 45.55, "Skopje",
        "Cigarette", DateTime.now(), "Nothing"),
    Expense(Constants.getRandomString(10), "USD10.00", 52.33, 45.55, "Skopje",
        "Food", DateTime.now(), "Nothing"),
  ];

  List<Expense> get getExpenses {
    return _expenses;
  }

  double todaySpend() {
    double total = 0.0;

    _expenses.forEach((element) {
      String temp = element.price as String;
      var amount = double.parse(temp.replaceAll(RegExp('[^0-9.]+'), ''));
      total += amount;
    });

    return total;
  }
}
