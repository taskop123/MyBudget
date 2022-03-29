import '../model/expense.dart';

class ExpenseService {
  // final List<Expense> _expenses = [
  //   Expense(Constants.getRandomString(10), null, "USD10.00", 52.33, 45.55,
  //       "Skopje", "Clothing", DateTime.now(), "Nothing"),
  //   Expense(Constants.getRandomString(10), null, "USD23.00", 52.33, 45.55,
  //       "Skopje", "Shopping", DateTime.now(), "Nothing"),
  //   Expense(Constants.getRandomString(10), null, "USD41.00", 52.33, 45.55,
  //       "Skopje", "Food", DateTime.now(), "Nothing"),
  //   Expense(Constants.getRandomString(10), null, "USD65.00", 52.33, 45.55,
  //       "Skopje", "Baby", DateTime.now(), "Nothing"),
  //   Expense(Constants.getRandomString(10), null, "USD1.00", 52.33, 45.55,
  //       "Skopje", "Cigarette", DateTime.now(), "Nothing"),
  //   Expense(Constants.getRandomString(10), null, "USD5.00", 52.33, 45.55,
  //       "Skopje", "Shopping", DateTime.now(), "Nothing"),
  //   Expense(Constants.getRandomString(10), null, "USD12.00", 52.33, 45.55,
  //       "Skopje", "Pet", DateTime.now(), "Nothing"),
  //   Expense(Constants.getRandomString(10), null, "USD6.00", 52.33, 45.55,
  //       "Skopje", "Food", DateTime.now(), "Nothing"),
  //   Expense(Constants.getRandomString(10), null, "USD345.00", 52.33, 45.55,
  //       "Skopje", "Clothing", DateTime.now(), "Nothing"),
  //   Expense(Constants.getRandomString(10), null, "USD9.00", 52.33, 45.55,
  //       "Skopje", "Baby", DateTime.now(), "Nothing"),
  //   Expense(Constants.getRandomString(10), null, "USD88.00", 52.33, 45.55,
  //       "Skopje", "Pet", DateTime.now(), "Nothing"),
  //   Expense(Constants.getRandomString(10), null, "USD8.00", 52.33, 45.55,
  //       "Skopje", "Cigarette", DateTime.now(), "Nothing"),
  //   Expense(Constants.getRandomString(10), null, "USD10.00", 52.33, 45.55,
  //       "Skopje", "Food", DateTime.now(), "Nothing"),
  // ];

  final List<Expense> _expenses;

  ExpenseService(this._expenses);

  double todaySpend() {
    double total = 0.0;

    for (var element in _expenses) {
      String temp = element.price as String;
      var amount = double.parse(temp.replaceAll(RegExp('[^0-9.]+'), ''));
      total += amount;
    }

    return total;
  }
}
