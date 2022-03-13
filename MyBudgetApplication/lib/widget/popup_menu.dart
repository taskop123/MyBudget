import 'package:flutter/material.dart';
import 'package:my_budget_application/util/constants.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: (ctx) => [
              const PopupMenuItem(child: Text(Constants.settingsTitle)),
              const PopupMenuItem(child: Text(Constants.privacyPolicyTitle)),
              const PopupMenuItem(child: Text(Constants.contactTitle)),
            ]);
  }
}
