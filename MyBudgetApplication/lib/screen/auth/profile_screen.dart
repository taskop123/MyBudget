import 'package:flutter/material.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/widget/profile/profile_top_widget.dart';

import '../../util/constants.dart';
import '../../widget/profile/profile_content.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = Constants.profileRoute;

  final double coverHeight = 220;
  final double profileHeight = 200;

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentUser = ModalRoute.of(context)!.settings.arguments as CustomUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.profileTitle),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ProfileTopWidget(currentUser, coverHeight, profileHeight),
          ProfileContentWidget(currentUser),
        ],
      ),
    );
  }
}
