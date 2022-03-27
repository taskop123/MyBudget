import 'package:flutter/material.dart';
import 'package:my_budget_application/widget/profile/profile_top_widget.dart';

import '../../util/constants.dart';
import '../../widget/action_button.dart';
import '../../widget/menu/popup_menu.dart';
import '../../widget/profile/profile_content.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = Constants.profileRoute;

  final double coverHeight = 160;
  final double profileHeight = 144;

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.profileTitle),
        actions: const [
          PopupMenu(),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ProfileTopWidget(coverHeight, profileHeight),
          const ProfileContentWidget(),
        ],
      ),
    );
  }
}
