import 'package:flutter/material.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/service/firebase/users_repository.dart';

import '../../util/constants.dart';
import '../../util/theme_manager.dart';
import '../../widget/settings/notification_option.dart';
import '../../widget/settings/notification_row.dart';
import '../../widget/settings/sign_out_button.dart';

/// Defines the screen for configuration of the current user's preferences.
class SettingsScreen extends StatefulWidget {
  /// The route name of the settings screen.
  static const routeName = Constants.settingsRoute;

  /// The notifier class used to change the state of the screen UI theme.
  final ThemeNotifier _themeNotifier;

  /// Creates an instance of the [SettingsScreen]
  /// with the specific [_themeNotifier].
  const SettingsScreen(this._themeNotifier, {Key? key}) : super(key: key);

  /// Creates the state object for the [SettingsScreen].
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

/// State class used to display the settings screen elements and its functionalities.
class _SettingsScreenState extends State<SettingsScreen> {
  /// The currently logged in user.
  CustomUser? _currentUser;

  /// The function to be called on user logout.
  Function()? _logoutFunction;

  /// Builds the UI elements for the user settings screen,
  /// including the [appBar] and the [body] with a [context].
  ///
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as List;
    _currentUser = arguments[0] as CustomUser?;
    _logoutFunction = arguments[1] as Function()?;

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.settingsTitle),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 35,
          ),
          const NotificationRow(Constants.notificationsPlaceholder,
              Icons.notifications_active_outlined),
          const Divider(
            height: 20,
            thickness: 1,
          ),
          const SizedBox(
            height: 10,
          ),
          NotificationOption(
              Constants.monthlyNotificationsPlaceholder,
              _currentUser!.monthlyNotificationsEnabled,
              _monthlyNotificationsToggle),
          NotificationOption(
              Constants.yearlyNotificationsPlaceholder,
              _currentUser!.yearlyNotificationsEnabled,
              _yearlyNotificationsToggle),
          const SizedBox(
            height: 40,
          ),
          const NotificationRow(Constants.profileTitle, Icons.person_outline),
          const Divider(
            height: 20,
            thickness: 1,
          ),
          const SizedBox(
            height: 10,
          ),
          NotificationOption(Constants.updateProfilePlaceholder,
              _currentUser!.updateProfileEnabled, _updateProfileToggle),
          NotificationOption(Constants.themeDarkPlaceholder,
              _currentUser!.themeDarkEnabled, _themeDarkToggle),
          const SizedBox(
            height: 50,
          ),
          SignOutButton(Constants.signOutTitle, _logoutFunction),
        ],
      ),
    );
  }

  /// The method is called when disabling/enabling monthly notifications.
  ///
  /// Notifies the application that user wants to enable or disable the
  /// monthly notifications which are automatically generated.
  void _monthlyNotificationsToggle(bool value) {
    UserRepository.updateUserProfile(_currentUser!.updateProfileEnabled,
        _currentUser!.id, null, null, null, null, value, null, null, null);
    setState(() {
      _currentUser!.monthlyNotificationsEnabled = value;
    });
  }

  /// The method is called when disabling/enabling yearly notifications.
  ///
  /// Notifies the application that user wants to enable or disable the
  /// yearly notifications which are automatically generated.
  void _yearlyNotificationsToggle(bool value) {
    UserRepository.updateUserProfile(_currentUser!.updateProfileEnabled,
        _currentUser!.id, null, null, null, null, null, value, null, null);
    setState(() {
      _currentUser!.yearlyNotificationsEnabled = value;
    });
  }

  /// The method is called when disabling/enabling the ability
  /// to update the user profile.
  ///
  /// Notifies the application that user wants to enable or disable the
  /// ability of configuring and changing existing user data information.
  void _updateProfileToggle(bool value) {
    UserRepository.updateUserProfile(value, _currentUser!.id, null, null, null,
        null, null, null, value, null);
    setState(() {
      _currentUser!.updateProfileEnabled = value;
    });
  }

  /// The method is called when disabling/enabling dark theme.
  ///
  /// Notifies the application that user wants to enable or disable
  /// the dark UI theme, and enable/disable the light theme.
  void _themeDarkToggle(bool value) {
    UserRepository.updateUserProfile(_currentUser!.updateProfileEnabled,
        _currentUser!.id, null, null, null, null, null, null, null, value);
    setState(() {
      _currentUser!.themeDarkEnabled = value;
    });
    (value)
        ? widget._themeNotifier.setDarkMode()
        : widget._themeNotifier.setLightMode();
  }
}
