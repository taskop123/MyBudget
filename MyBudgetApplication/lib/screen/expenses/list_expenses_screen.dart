import 'package:flutter/material.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/service/expenses_service.dart';
import 'package:my_budget_application/util/constants.dart';

class ListExpenseScreen extends StatefulWidget {
  static const routeName = "/expense/list";
  const ListExpenseScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListExpenseScreenState();
}

class _ListExpenseScreenState extends State<ListExpenseScreen> {
  // Expense data
  final List<Expense> _expenses = ExpenseService().getExpenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _expenses.length,
      itemBuilder: (context, index) {
        return Card(
            margin: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Constants.formatWithMonthName
                            .format(_expenses[index].dateAndTime as DateTime),
                        style: const TextStyle(fontSize: 10),
                      ),
                      Row(
                        children: [
                          const Text(
                            "Spent: ",
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            _expenses[index].price.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _expenses[index].expenseCategory as String,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, EventLocationScreen.routeName,
                          //     arguments: {"location": _exams[index].location});
                        },
                        child: const Text("Details"),
                      ),
                    ],
                  ),
                ),
              ],
            ));
      },
    );
  }
}
