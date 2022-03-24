import 'package:flutter/material.dart';

class MainTheme {
  static ThemeData getMainTheme() {
    return ThemeData(
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 60.0),
        headline6: TextStyle(fontSize: 20.0),
      ),
    );
  }
}