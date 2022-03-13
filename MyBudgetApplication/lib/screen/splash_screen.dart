import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/screen/login_screen.dart';
import 'package:my_budget_application/screen/main_screen.dart';
import 'package:my_budget_application/util/constants.dart';
import 'package:my_budget_application/widget/action_button.dart';
import 'package:provider/provider.dart';

import '../service/authentication_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _login() {
    setState(() {});
  }

  void _logout() {
    context.read<AuthenticationService>().signOut();
    setState(() {});
  }

  List<Widget>? _actionButtons(BuildContext context) {
    List<Widget>? buttons = [];
    buttons.add(ActionButton(Icons.logout, _logout));

    return buttons;
  }

  Widget _getHomeScreen() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.applicationTitle),
        actions: _actionButtons(context),
      ),
      body: MainScreen(_logout),
    );
  }

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    return (firebaseUser != null) ? _getHomeScreen() : LoginScreen(_login);
  }
}
