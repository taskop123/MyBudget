import 'package:flutter/material.dart';

class MainTheme {
  static ThemeData getMainTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 60.0),
        headline6: TextStyle(fontSize: 20.0),
      ),
    );
  }
}
