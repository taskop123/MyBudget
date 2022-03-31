import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/widget/profile/profile_numbers_widget.dart';
import 'package:provider/provider.dart';

class ProfileContentWidget extends StatelessWidget {
  final CustomUser? _currentUser;

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
        const SizedBox(height: 32),
        const Divider(),
        const SizedBox(height: 16),
        const ProfileNumbersWidget(),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 16),
        const ProfileNumbersWidget(),
        const SizedBox(height: 32),
      ],
    );
  }
}
