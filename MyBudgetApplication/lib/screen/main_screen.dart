import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/screen/expenses/expenses_form_screen.dart';
import 'package:my_budget_application/screen/expenses/list_expenses_screen.dart';
import 'package:my_budget_application/service/expenses_service.dart';
import 'package:my_budget_application/service/firebase/expenses_repository.dart';
import 'package:my_budget_application/widget/menu/bottom_bar.dart';
import 'package:my_budget_application/widget/menu/side_bar.dart';
import 'package:provider/provider.dart';

import '../model/expense.dart';
import '../service/notification_service.dart';
import '../util/constants.dart';
import '../widget/action_button.dart';
import '../widget/menu/side_bar.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/home';

  final Function()? _logoutFunction;

  const MainScreen(this._logoutFunction, {Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Expense> fetchedExpenses = [];

  void fetchExpenses(BuildContext buildContext) async {
    var currentUser = buildContext.watch<User?>();
    var _eventInstance = ExpenseRepository.getExpensesByUser(currentUser!.uid);
    if (_eventInstance != null) {
      _eventInstance.listen((event) {
        var resultList = (event.snapshot.value as Map<Object?, Object?>).values;
        for (var i = 0; i < resultList.length; i++) {
          var item = resultList.elementAt(i) as Map<Object?, Object?>;
          var expense = Expense.fromJson(item);
          setState(() {
            fetchedExpenses.add(expense);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    NotificationService.init();

    return Scaffold(
      drawer: SideBar(widget._logoutFunction),
      appBar: AppBar(
        title: const Text(Constants.applicationTitle),
        actions: [ActionButton(Icons.logout, widget._logoutFunction!)],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            color: Theme.of(context).colorScheme.primary,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(250.0),
                  child: Image.asset(
                    'assets/images/logo.jpg',
                    alignment: Alignment.centerLeft,
                    height: 150,
                    width: 150,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      Constants.formatter.format(DateTime.now()),
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const Text(
                      "Spent: ",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      ExpenseService().todaySpend().toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                )
              ],
            ),
          ),
          const Expanded(
            child: ListExpenseScreen(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).pushNamed(ExpensesScreen.routeName),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
