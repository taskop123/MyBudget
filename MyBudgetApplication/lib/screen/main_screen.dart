import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/widget/menu/bottom_bar.dart';
import 'package:my_budget_application/widget/menu/side_bar.dart';
import 'package:provider/provider.dart';

import '../service/database_service.dart';
import '../service/notification_service.dart';
import '../util/constants.dart';
import '../widget/action_button.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/home';

  final Function()? _logoutFunction;

  const MainScreen(this._logoutFunction, {Key? key}) : super(key: key);

  List<Widget>? _actionButtons(BuildContext context) {
    List<Widget>? buttons = [];
    buttons.add(ActionButton(Icons.logout, _logoutFunction!));

    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    NotificationService.init();
    setCurrentUser(context);

    return Scaffold(
      drawer: SideBar(_logoutFunction),
      appBar: AppBar(
        title: const Text(Constants.applicationTitle),
        actions: _actionButtons(context),
      ),
      body: Container(),
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
