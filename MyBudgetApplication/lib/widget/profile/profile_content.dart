import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/util/constants.dart';
import 'package:provider/provider.dart';

import 'monthly_income_dialog.dart';

/// Defines the profile content widget for displaying information
/// about the current user's profile.
class ProfileContentWidget extends StatelessWidget {
  /// Defines the current user.
  final CustomUser? _currentUser;

  /// Creates new profile content widget for the current user.
  const ProfileContentWidget(this._currentUser, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentUser = context.watch<User?>();

    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          _currentUser!.username!,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          currentUser!.email!,
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        const Text(
          Constants.monthlyIncomeTextPlaceholder,
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 5),
        TextButton(
          child: Text(
              (_currentUser?.monthlyIncome) != null
                  ? _currentUser!.monthlyIncome!
                  : Constants.blankString,
              style: const TextStyle(
                  fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold)
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => MonthlyIncomeDialog(_currentUser!));
          },
        ),
      ],
    );
  }
}
