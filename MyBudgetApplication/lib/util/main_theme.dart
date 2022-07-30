import 'package:flutter/material.dart';

/// Represents the main theme of the application.
class MainTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
      buttonTheme: const ButtonThemeData(buttonColor: Colors.blueAccent, colorScheme: ColorScheme.light()),
      backgroundColor: Colors.lightBlue,
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 60.0),
        headline6: TextStyle(fontSize: 20.0),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      primarySwatch: Colors.blueGrey,
      brightness: Brightness.dark,
      buttonTheme: const ButtonThemeData(buttonColor: Colors.grey),
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 60.0),
        headline6: TextStyle(fontSize: 20.0),
      ),
    );
  }
}
