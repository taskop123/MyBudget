import 'package:flutter/material.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/service/firebase/users_repository.dart';

import '../../util/constants.dart';
import '../../widget/settings/notification_option.dart';
import '../../widget/settings/notification_row.dart';
import '../../widget/settings/sign_out_button.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = Constants.settingsRoute;

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  CustomUser? _currentUser;
  Function()? _logoutFunction;

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

  void _monthlyNotificationsToggle(bool value) {
    UserRepository.updateUserProfile(
        _currentUser!.updateProfileEnabled,
        _currentUser!.id,
        _currentUser!.profilePicture,
        _currentUser!.monthlyIncome,
        _currentUser!.monthlyNotifications,
        _currentUser!.yearlyNotifications,
        value,
        null,
        null,
        null);
    setState(() {
      _currentUser!.monthlyNotificationsEnabled = value;
    });
  }

  void _yearlyNotificationsToggle(bool value) {
    UserRepository.updateUserProfile(
        _currentUser!.updateProfileEnabled,
        _currentUser!.id,
        _currentUser!.profilePicture,
        _currentUser!.monthlyIncome,
        _currentUser!.monthlyNotifications,
        _currentUser!.yearlyNotifications,
        null,
        value,
        null,
        null);
    setState(() {
      _currentUser!.yearlyNotificationsEnabled = value;
    });
  }

  void _updateProfileToggle(bool value) {
    UserRepository.updateUserProfile(
        value,
        _currentUser!.id,
        _currentUser!.profilePicture,
        _currentUser!.monthlyIncome,
        _currentUser!.monthlyNotifications,
        _currentUser!.yearlyNotifications,
        null,
        null,
        value,
        null);
    setState(() {
      _currentUser!.updateProfileEnabled = value;
    });
  }

  void _themeDarkToggle(bool value) {
    UserRepository.updateUserProfile(
        _currentUser!.updateProfileEnabled,
        _currentUser!.id,
        _currentUser!.profilePicture,
        _currentUser!.monthlyIncome,
        _currentUser!.monthlyNotifications,
        _currentUser!.yearlyNotifications,
        null,
        null,
        null,
        value);
    setState(() {
      _currentUser!.themeDarkEnabled = value;
    });
  }
}
