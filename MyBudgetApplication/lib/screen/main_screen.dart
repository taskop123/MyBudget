import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/service/expenses_service.dart';
import 'package:my_budget_application/util/theme_manager.dart';
import 'package:my_budget_application/widget/main/main_banner.dart';
import 'package:my_budget_application/widget/main/main_expanded_list.dart';
import 'package:my_budget_application/widget/menu/add_expense_menu.dart';
import 'package:my_budget_application/widget/menu/bottom_bar.dart';
import 'package:my_budget_application/widget/menu/side_bar.dart';
import 'package:my_budget_application/widget/profile/monthly_income_dialog.dart';
import 'package:provider/provider.dart';

import '../model/expense.dart';
import '../service/firebase/expenses_repository.dart';
import '../service/firebase/users_repository.dart';
import '../service/notification_service.dart';
import '../util/constants.dart';
import '../widget/action_button.dart';
import '../widget/menu/side_bar.dart';

/// The main user screen showed after authentication.
class MainScreen extends StatefulWidget {
  /// The route name of the main screen.
  static const routeName = Constants.mainRoute;

  /// The function that has the required business logic
  /// to log out the current user and redirect him to the [LoginScreen].
  final Function()? _logoutFunction;

  /// The notifier class used to change the state of the screen UI theme.
  final ThemeNotifier _themeNotifier;

  /// Creates an instance of the [MainScreen]
  /// with a [_logoutFunction] and a [_themeNotifier].
  const MainScreen(this._logoutFunction, this._themeNotifier, {Key? key})
      : super(key: key);

  /// Creates the state object for the [MainScreen].
  @override
  State<MainScreen> createState() => _MainScreenState();
}

/// State class used to display the main user screen elements.
class _MainScreenState extends State<MainScreen> {
  /// The list of [Expense] objects which are manipulated through the screens.
  final List<Expense> _expenses = [];

  /// The currently authenticated [CustomUser] user.
  CustomUser? _currentUser;

  /// The event for reading the information about the currently logged user.
  StreamSubscription? _readUserEvent;

  /// The event for reading the information about the logged in user's expenses.
  StreamSubscription? _readExpensesEvent;

  /// Fetches the list of the expenses for the [_currentUser],
  /// given the adequate [buildContext], with the help of
  /// [ExpenseRepository] which makes a request to the [FirebaseDatabase].
  ///
  void _fetchExpenses(BuildContext buildContext) async {
    var currentUser = buildContext.watch<User?>();
    var _eventInstance = ExpenseRepository.getExpensesByUser(currentUser!.uid);

    if (_eventInstance != null) {
      _readExpensesEvent = _eventInstance.listen((event) {
        if (event.snapshot.value == Null) {
          return;
        }
        var resultList = (event.snapshot.value as Map<Object?, Object?>).values;
        for (var i = 0; i < resultList.length; i++) {
          var item = resultList.elementAt(i) as Map<Object?, Object?>;
          var expense = Expense.fromJson(item);
          if (ExpenseService.checkIfExpenseExists(_expenses, expense)) {
            setState(() {
              _expenses.add(expense);
            });
          }
        }
      });
    }
  }

  /// Fetches the information of the currently authenticated [CustomUser],
  /// with the help of [UserRepository], which makes
  /// a request to the [FirebaseDatabase], given the adequate [userId].
  ///
  void _fetchCurrentUser(String? userId, BuildContext context, User user) async {
    if (userId != null) {
      _readUserEvent = UserRepository.getUser(userId)!.listen((event) {
        if (event.snapshot.value == Null) {
          return;
        }
        var result = (event.snapshot.value as Map<Object?, Object?>)
            .values
            .first as Map<Object?, Object?>;
        setState(() {
          _currentUser = CustomUser.fromJson(result);
          if (_currentUser != null) {
            (_currentUser!.themeDarkEnabled)
                ? widget._themeNotifier.setDarkMode()
                : widget._themeNotifier.setLightMode();
            if (_currentUser!.monthlyIncome == null) {
              _showMonthlyIncomeDialog(context);
              NotificationService.toggleExpenseNotifications(
                  _expenses, user, _currentUser!, context);
            }
          }
        });
      });
    }
  }

  /// Displays the dialog window for allowing the user to enter
  /// his monthly income so the application can base it's behaviour based
  /// on the personalized logged in user's information.
  ///
  void _showMonthlyIncomeDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => MonthlyIncomeDialog(_currentUser!));
  }

  /// Allows the list of [_expenses] to be fetched again,
  /// when a change to the list has been made in the [FirebaseDatabase].
  ///
  @override
  Future<void> didChangeDependencies() async {
    _fetchExpenses(context);
    var currentUser = context.watch<User?>();
    _fetchCurrentUser(currentUser!.uid, context, currentUser);

    super.didChangeDependencies();
  }

  /// Builds the list of action buttons,
  /// shown in the upper right corner of the [MainScreen].
  ///
  List<Widget> _buildActionButtons() {
    List<Widget> _actionButtons = [];
    _actionButtons.add(ActionButton(Icons.logout, widget._logoutFunction!));

    return _actionButtons;
  }

  /// Builds the UI elements for the main screen,
  /// including the [bottomNavigationBar], [appBar], [drawer] and a [body]
  /// with a [context] of the adequate [_expenses] listing.
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(_currentUser, widget._logoutFunction, _expenses),
      appBar: AppBar(
        title: const Text(Constants.applicationTitle),
        actions: _buildActionButtons(),
      ),
      body: Column(
        children: [
          MainBanner(_expenses, _currentUser),
          MainExpandedList(_expenses, context, _currentUser),
        ],
      ),
      floatingActionButton: AddExpenseMenu(context),
      bottomNavigationBar: (_currentUser != null)
          ? BottomBar(0, _expenses, _currentUser!)
          : null,
    );
  }

  /// This method is called when the widget is disposed
  /// and the subscription events need to canceled
  /// in order not to get stuck in an endless 'listen' loop.
  ///
  @override
  void dispose() {
    if (_readUserEvent != null) {
      _readUserEvent!.cancel();
    }
    if (_readExpensesEvent != null) {
      _readExpensesEvent!.cancel();
    }
    super.dispose();
  }
}
