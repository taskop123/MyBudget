import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/model/expense.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/widget/profile/profile_monthly_income_button.dart';
import 'package:my_budget_application/widget/profile/profile_numbers_widget.dart';
import 'package:provider/provider.dart';

/// Defines the profile content widget for displaying information
/// about the current user's profile.
class ProfileContentWidget extends StatelessWidget {
  /// Defines the current user.
  final CustomUser? _currentUser;

  final List<Expense> _expenses;

  /// Creates new profile content widget for the current user.
  const ProfileContentWidget(this._currentUser, this._expenses, {Key? key}) : super(key: key);

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
        const SizedBox(height: 10),
        const Divider(),
        const SizedBox(height: 15),
        MonthlyIncomeButton(_currentUser),
        const SizedBox(height: 8),
        const Divider(),
        const SizedBox(height: 8),
        ProfileNumbersWidget(_expenses, _currentUser!),
        const SizedBox(height: 8),
        const SizedBox(height: 8),
      ],
    );
  }
}
