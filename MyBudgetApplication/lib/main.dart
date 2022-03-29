import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/screen/auth/login_screen.dart';
import 'package:my_budget_application/screen/auth/profile_screen.dart';
import 'package:my_budget_application/screen/auth/registration_screen.dart';
import 'package:my_budget_application/screen/expenses/expenses_form_screen.dart';
import 'package:my_budget_application/screen/expenses/list_expenses_screen.dart';
import 'package:my_budget_application/screen/info/contact_screen.dart';
import 'package:my_budget_application/screen/info/location_screen.dart';
import 'package:my_budget_application/screen/main_screen.dart';
import 'package:my_budget_application/screen/splash_screen.dart';
import 'package:my_budget_application/service/authentication_service.dart';
import 'package:my_budget_application/service/database_service.dart';
import 'package:my_budget_application/util/constants.dart';
import 'package:my_budget_application/util/main_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  RealtimeDatabaseService.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.applicationTitle,
      theme: MainTheme.getMainTheme(),
    );
  }

  @override
  State<StatefulWidget> createState() => MyHomePage();
}

class MyHomePage extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Constants.applicationTitle,
          theme: MainTheme.getMainTheme(),
          routes: {
            MainScreen.routeName: (ctx) => const MainScreen(null),
            RegistrationScreen.routeName: (ctx) => const RegistrationScreen(),
            LoginScreen.routeName: (ctx) => const LoginScreen(null),
            ProfileScreen.routeName: (ctx) => const ProfileScreen(),
            ContactScreen.routeName: (ctx) => const ContactScreen(),
            LocationScreen.routeName: (ctx) => const LocationScreen(),
            ExpensesScreen.routeName: (ctx) => const ExpensesScreen(),
            ListExpenseScreen.routeName: (ctx) => const ListExpenseScreen(),
          },
          home: const SplashScreen()),
    );
  }
}
