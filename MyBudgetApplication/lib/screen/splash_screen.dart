import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/screen/main_screen.dart';
import 'package:my_budget_application/util/theme_manager.dart';
import 'package:provider/provider.dart';

import '../service/firebase/authentication_service.dart';
import 'auth/login_screen.dart';

/// The screen used to create the logic of navigation,
/// from the authentication screens to the other screens,
/// which the user can access after authentication.
class SplashScreen extends StatefulWidget {
  final ThemeNotifier _themeNotifier;

  /// Creates an instance of the [SplashScreen].
  const SplashScreen(this._themeNotifier, {Key? key}) : super(key: key);

  /// Creates the state object for the [SplashScreen].
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

/// State class used to display the splash screen elements and logic.
class _SplashScreenState extends State<SplashScreen> {
  /// Notifies the screen that a user has been authenticated.
  ///
  void _login() {
    setState(() {});
  }

  /// Notifies the screen that a user has been logged out.
  ///
  void _logout() {
    context.read<AuthenticationService>().signOut();
    setState(() {});
  }

  /// Builds the UI on the screen. Chooses to navigate the,
  /// [LoginScreen] if there is no authenticated user,
  /// and, navigates to the [MainScreen], if there is one,
  /// with a given [context].
  ///
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    return (firebaseUser != null)
        ? MainScreen(_logout, widget._themeNotifier)
        : LoginScreen(_login);
  }
}
