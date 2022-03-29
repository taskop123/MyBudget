import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/screen/expenses/expenses_form_screen.dart';
import 'package:my_budget_application/screen/expenses/list_expenses_screen.dart';
import 'package:my_budget_application/service/expenses_service.dart';
import 'package:my_budget_application/widget/menu/bottom_bar.dart';
import 'package:my_budget_application/widget/menu/side_bar.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../service/database_service.dart';
import '../service/notification_service.dart';
import '../util/constants.dart';
import '../widget/action_button.dart';
import '../widget/menu/side_bar.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/home';

  final Function()? _logoutFunction;

  const MainScreen(this._logoutFunction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotificationService.init();
    setCurrentUser(context);

    return Scaffold(
      drawer: SideBar(_logoutFunction),
      appBar: AppBar(
        title: const Text(Constants.applicationTitle),
        actions: [ActionButton(Icons.logout, _logoutFunction!)],
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
        onPressed: () => Navigator.of(context)
            .pushNamed(ExpensesScreen.routeName),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }

  void setCurrentUser(BuildContext context) {
    var currentUser = context.watch<User?>();
    if (currentUser != null) {
      RealtimeDatabaseService.setUser(currentUser.uid);
    }
  }
}
