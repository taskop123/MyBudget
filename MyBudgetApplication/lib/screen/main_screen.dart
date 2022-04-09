import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/screen/expenses/expenses_add_screen.dart';
import 'package:my_budget_application/screen/expenses/expenses_list_screen.dart';
import 'package:my_budget_application/service/expenses_service.dart';
import 'package:my_budget_application/widget/menu/bottom_bar.dart';
import 'package:my_budget_application/widget/menu/side_bar.dart';
import 'package:provider/provider.dart';

import '../model/expense.dart';
import '../service/firebase/expenses_repository.dart';
import '../service/firebase/users_repository.dart';
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
  final List<Expense> _expenses = [];
  CustomUser? _currentUser;

  bool checkIfExpenseExists(List<Expense> expenses, Expense ex) {
    for (var element in expenses) {
      if (element.id == ex.id) {
        return false;
      }
    }
    return true;
  }

  void fetchExpenses(BuildContext buildContext) async {
    var currentUser = buildContext.watch<User?>();
    var _eventInstance = ExpenseRepository.getExpensesByUser(currentUser!.uid);

    if (_eventInstance != null) {
      _eventInstance.listen((event) {
        if (event.snapshot.value == Null) {
          return;
        }
        var resultList = (event.snapshot.value as Map<Object?, Object?>).values;
        for (var i = 0; i < resultList.length; i++) {
          var item = resultList.elementAt(i) as Map<Object?, Object?>;
          var expense = Expense.fromJson(item);
          if (checkIfExpenseExists(_expenses, expense)) {
            setState(() {
              _expenses.add(expense);
            });
          }
        }
      });
    }
  }

  @override
  void didChangeDependencies() {
    fetchExpenses(context);
    super.didChangeDependencies();
  }

  void _setCurrentUser(String? userId) async {
    if (userId != null) {
      UserRepository.getUser(userId)!.listen((event) {
        if (event.snapshot.value == Null) {
          return;
        }
        var result = (event.snapshot.value as Map<Object?, Object?>)
            .values
            .first as Map<Object?, Object?>;
        setState(() {
          _currentUser = CustomUser.fromJson(result);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var currentUser = context.watch<User?>();
    _setCurrentUser(currentUser!.uid);

    return Scaffold(
      drawer: SideBar(_currentUser, widget._logoutFunction),
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
                      "Today Spent: ",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      "${ExpenseService.todaySpend(_expenses).toStringAsFixed(2)}\$",
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
          Expanded(
            child: _expenses.isNotEmpty
                ? ListExpenseScreen(_expenses)
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text("No expenses currently!"),
                    ],
                  ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).pushNamed(ExpenseAddScreen.routeName),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomBar(0, _expenses),
    );
  }
}
