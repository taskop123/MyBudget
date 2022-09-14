import 'package:flutter/material.dart';
import 'package:my_budget_application/service/shared_preferences_service.dart';
import 'package:my_budget_application/util/main_theme.dart';

import 'constants.dart';

/// The notifier class which updates the state of the application
/// for a change in the user's UI theme.
class ThemeNotifier with ChangeNotifier {
  /// The data object which is keeping state of the current theme.
  ThemeData _themeData = MainTheme.lightTheme();

  /// Returns the current [_themeData].
  ThemeData getTheme() => _themeData;

  /// Creates only singleton [_themeData] object.
  ThemeNotifier() {
    SharedPreferencesService.getBool(Constants.darkModeEnabled).then((value) {
      _themeData = (value) ? MainTheme.darkTheme() : MainTheme.lightTheme();
      notifyListeners();
    });
  }

  /// Toggles the current device's UI mode to dark.
  ///
  void setDarkMode() async {
    _themeData = MainTheme.darkTheme();
    SharedPreferencesService.setBool(Constants.darkModeEnabled, true);
    notifyListeners();
  }

  /// Toggles the current device's UI mode to light.
  ///
  void setLightMode() async {
    _themeData = MainTheme.lightTheme();
    SharedPreferencesService.setBool(Constants.darkModeEnabled, false);
    notifyListeners();
  }
}
