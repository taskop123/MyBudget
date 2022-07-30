import 'package:flutter/material.dart';
import 'package:my_budget_application/service/shared_preferences_service.dart';
import 'package:my_budget_application/util/main_theme.dart';

import 'constants.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData = MainTheme.lightTheme();

  ThemeData getTheme() => _themeData;

  ThemeNotifier() {
    SharedPreferencesService.getBool(Constants.darkModeEnabled).then((value) {
      _themeData = (value) ? MainTheme.darkTheme() : MainTheme.lightTheme();
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = MainTheme.darkTheme();
    SharedPreferencesService.setBool(Constants.darkModeEnabled, true);
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = MainTheme.lightTheme();
    SharedPreferencesService.setBool(Constants.darkModeEnabled, false);
    notifyListeners();
  }
}
