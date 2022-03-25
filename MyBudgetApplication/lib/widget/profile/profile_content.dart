import 'package:flutter/material.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/widget/profile/profile_numbers_widget.dart';

import '../../util/constants.dart';

class ProfileContentWidget extends StatelessWidget {
  const ProfileContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          CustomUser.current!.username!,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          Constants.profileContentPlaceholder,
          style: TextStyle(fontSize: 20, color: Colors.black),
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
