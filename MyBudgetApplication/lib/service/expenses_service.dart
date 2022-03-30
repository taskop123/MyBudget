import '../model/expense.dart';

class ExpenseService {

  final List<Expense> _expenses;

  ExpenseService(this._expenses);

  double todaySpend() {
    double total = 0.0;

    for (var element in _expenses) {
      if(element.dateAndTime?.day == DateTime.now().day && element.dateAndTime?.month == DateTime.now().month && element.dateAndTime?.year == DateTime.now().year){
        String temp = element.price as String;
        var amount = double.parse(temp.replaceAll(RegExp('[^0-9.]+'), ''));
        total += amount;
      }
    }



    return total;
  }
}
