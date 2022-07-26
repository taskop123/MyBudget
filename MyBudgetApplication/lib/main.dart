import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/screen/auth/login_screen.dart';
import 'package:my_budget_application/screen/auth/profile_screen.dart';
import 'package:my_budget_application/screen/auth/registration_screen.dart';
import 'package:my_budget_application/screen/camera/camera_screen.dart';
import 'package:my_budget_application/screen/expenses/expenses_add_screen.dart';
import 'package:my_budget_application/screen/expenses/expenses_details_screen.dart';
import 'package:my_budget_application/screen/expenses/expenses_list_screen.dart';
import 'package:my_budget_application/screen/info/contact_screen.dart';
import 'package:my_budget_application/screen/info/help_screen.dart';
import 'package:my_budget_application/screen/info/location_screen.dart';
import 'package:my_budget_application/screen/main_screen.dart';
import 'package:my_budget_application/screen/splash_screen.dart';
import 'package:my_budget_application/screen/visualizations/pie_chart_screen.dart';
import 'package:my_budget_application/screen/visualizations/statistics_screen.dart';
import 'package:my_budget_application/service/firebase/authentication_service.dart';
import 'package:my_budget_application/service/firebase/database_service.dart';
import 'package:my_budget_application/util/constants.dart';
import 'package:my_budget_application/util/main_theme.dart';
import 'package:provider/provider.dart';

/// The initialization of listeners and services for the application,
/// as well as the application itself.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  RealtimeDatabaseService.init();

  /// Initializes the application.
  runApp(const MyApp());
}

/// The main application widget.
class MyApp extends StatefulWidget {
  /// Creates instance of the [MyApp] widget.
  const MyApp({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.applicationTitle,
      theme: MainTheme.getMainTheme(),
    );
  }

  /// Creates the state object for the [MyApp] widget.
  @override
  State<StatefulWidget> createState() => MyHomePage();
}

/// State object for the [MyApp] widget that
/// creates the authentication providers,
/// as well as routing throughout the application.
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
            ExpenseAddScreen.routeName: (ctx) => const ExpenseAddScreen(),
            ListExpenseScreen.routeName: (ctx) => const ListExpenseScreen([], null),
            ExpenseDetailsScreen.routeName: (ctx) =>
                const ExpenseDetailsScreen(),
            PieChartScreen.routeName: (ctx) => const PieChartScreen(),
            StatisticsScreen.routeName: (ctx) => const StatisticsScreen(),
            CameraScreen.routeName: (ctx) => const CameraScreen(),
            HelpScreen.routeName: (ctx) => const HelpScreen(),
          },
          home: const SplashScreen()),
    );
  }
}
