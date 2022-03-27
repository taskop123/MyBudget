<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/widget/profile/profile_numbers_widget.dart';

import '../../util/constants.dart';
=======
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/widget/profile/profile_numbers_widget.dart';
import 'package:provider/provider.dart';
>>>>>>> origin/develop

class ProfileContentWidget extends StatelessWidget {
  const ProfileContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
=======
    var currentUser = context.watch<User?>();

>>>>>>> origin/develop
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          CustomUser.current!.username!,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
<<<<<<< HEAD
        const Text(
          Constants.profileContentPlaceholder,
          style: TextStyle(fontSize: 20, color: Colors.black),
=======
        Text(
          currentUser!.email!,
          style: const TextStyle(fontSize: 20, color: Colors.black),
>>>>>>> origin/develop
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
